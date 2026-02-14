# HA VPN Gateway (GCP)
resource "google_compute_ha_vpn_gateway" "gcp_vpn_gateway" {
  name    = "${var.prefix}-ha-vpn-gateway"
  network = google_compute_network.gke_vpc.id
  region  = var.gcp_region
  stack_type = "IPV4_ONLY"
  gateway_ip_version = "IPV4"
}

resource "google_compute_router" "gcp_router" {
  name    = "${var.prefix}-cloud-router"
  network = google_compute_network.gke_vpc.name
  region  = var.gcp_region

  bgp {
    asn            = var.gcp_asn # 65000
    advertise_mode = "CUSTOM"    ###"DEFAULT"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges {
      range = "${google_compute_global_address.private_ip_address.address}/${google_compute_global_address.private_ip_address.prefix_length}"
    }
  }
}

# External VPN Gateway (AWS)
resource "google_compute_external_vpn_gateway" "aws_vpn_gateway" {
  name            = "${var.prefix}-aws-vpn-gateway"
  redundancy_type = "FOUR_IPS_REDUNDANCY"
  description     = "Configuration with four IP addresses for HA"

  interface {
    id         = 0
    ip_address = aws_vpn_connection.vpn_connection[0].tunnel1_address
  }
  interface {
    id         = 1
    ip_address = aws_vpn_connection.vpn_connection[0].tunnel2_address
  }
  interface {
    id         = 2
    ip_address = aws_vpn_connection.vpn_connection[1].tunnel1_address
  }
  interface {
    id         = 3
    ip_address = aws_vpn_connection.vpn_connection[1].tunnel2_address
  }
}

# VPN Connection (AWS <=> GCP)
resource "google_compute_vpn_tunnel" "gcp_vpn_tunnels" {
  count                           = 4
  name                            = "gcp-to-aws-tunnel-${count.index + 1}"
  shared_secret                   = count.index % 2 == 0 ? aws_vpn_connection.vpn_connection[floor(count.index / 2)].tunnel1_preshared_key : aws_vpn_connection.vpn_connection[floor(count.index / 2)].tunnel2_preshared_key
  ike_version                     = 2
  router                          = google_compute_router.gcp_router.name
  vpn_gateway                     = google_compute_ha_vpn_gateway.gcp_vpn_gateway.id
  vpn_gateway_interface           = count.index < 2 ? 0 :1  ###"${google_compute_ha_vpn_gateway.gcp_vpn_gateway[count.index].vpn_interfaces[count.index].id}"
  peer_external_gateway           = google_compute_external_vpn_gateway.aws_vpn_gateway.id
  peer_external_gateway_interface = count.index  ###"${google_compute_external_vpn_gateway.aws_vpn_gateway[count.index].interface[count.index].id}"
}

resource "google_compute_router_interface" "router_interfaces" {
  count      = 4
  name       = "if-bgp-session-${count.index + 1}"
  router     = google_compute_router.gcp_router.name
  vpn_tunnel = google_compute_vpn_tunnel.gcp_vpn_tunnels[count.index].id
}

resource "google_compute_router_peer" "router_peers" {
  count           = 4
  name            = "bgp-session-${count.index + 1}"
  router          = google_compute_router.gcp_router.name
  interface       = google_compute_router_interface.router_interfaces[count.index].name
  peer_asn        = var.aws_asn
  ip_address      = count.index % 2 == 0 ? aws_vpn_connection.vpn_connection[floor(count.index / 2)].tunnel1_cgw_inside_address : aws_vpn_connection.vpn_connection[floor(count.index / 2)].tunnel2_cgw_inside_address
  peer_ip_address = count.index % 2 == 0 ? aws_vpn_connection.vpn_connection[floor(count.index / 2)].tunnel1_vgw_inside_address : aws_vpn_connection.vpn_connection[floor(count.index / 2)].tunnel2_vgw_inside_address
}
