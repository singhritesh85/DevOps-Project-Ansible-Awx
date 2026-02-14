# AWS Customer Gateway
resource "aws_customer_gateway" "aws_cg" {
  count      = 2
  bgp_asn    = var.gcp_asn    ###65000
  ip_address = count.index == 0 ? google_compute_ha_vpn_gateway.gcp_vpn_gateway.vpn_interfaces[0].ip_address : google_compute_ha_vpn_gateway.gcp_vpn_gateway.vpn_interfaces[1].ip_address
  type       = "ipsec.1"

  tags = {
    Name = "customer-gateway-${count.index + 1}"
  }
}

# AWS Virtual Private Gateway
resource "aws_vpn_gateway" "custom_asn_vgw" {
  amazon_side_asn = var.aws_asn 
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "custom-asn-vgw"
  }
}

resource "aws_vpn_gateway_route_propagation" "public_route_table" {
  vpn_gateway_id = aws_vpn_gateway.custom_asn_vgw.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_vpn_gateway_route_propagation" "private_route_table_1" {
  vpn_gateway_id = aws_vpn_gateway.custom_asn_vgw.id
  route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_vpn_gateway_route_propagation" "private_route_table_2" {
  vpn_gateway_id = aws_vpn_gateway.custom_asn_vgw.id
  route_table_id = aws_route_table.private_route_table_2.id
}

resource "aws_vpn_gateway_route_propagation" "private_route_table_3" {
  vpn_gateway_id = aws_vpn_gateway.custom_asn_vgw.id
  route_table_id = aws_route_table.private_route_table_3.id
}

# AWS VPN Connection
resource "aws_vpn_connection" "vpn_connection" {
  count               = 2
  vpn_gateway_id      = aws_vpn_gateway.custom_asn_vgw.id
  customer_gateway_id = count.index == 0 ? aws_customer_gateway.aws_cg[0].id : aws_customer_gateway.aws_cg[1].id
  type                = "ipsec.1"
  static_routes_only  = false    ### Dynamic (Requires BGP)

  # Tunnel 1 Configuration - Generic + IKEv2
  tunnel1_ike_versions = ["ikev2"]
  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase1_dh_group_numbers      = [14]
  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase2_dh_group_numbers      = [14]

  # Tunnel 2 Configuration - Generic + IKEv2
  tunnel2_ike_versions = ["ikev2"]
  tunnel2_phase1_encryption_algorithms = ["AES256"]
  tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase1_dh_group_numbers      = [14]
  tunnel2_phase2_encryption_algorithms = ["AES256"]
  tunnel2_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase2_dh_group_numbers      = [14]

  tags = {
    Name = "generic-ikev2-vpn-${count.index + 1}"
  }
}


