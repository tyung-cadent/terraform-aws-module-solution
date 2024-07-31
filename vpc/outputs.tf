output "availability_zone_names" {
  value = local.availability_zone_names
}

output "availability_zone_ids" {
  value = local.availability_zone_ids
}

output "eip_addresses" {
  value = [for ip in aws_eip.nat: ip.public_ip ]
}

output "eip_ids" {
  value = [for ip in aws_eip.nat: ip.id ]
}

output "tgw_subnet_id" {
  value = [ for subnet_id in aws_subnet.tgw_subnets: subnet_id.id]
}

output "private_subnets" {
  value = { for k, private in aws_subnet.private: k => private.id}
}

output "public_subnets" {
  value = { for k, public in aws_subnet.public: k => public.id}
}

output "nat_gateway" {
  value = { for k, nat in aws_nat_gateway.nat_gateway: k => nat.id}
}

output "private_route_table" {
  value = { for k, rte in aws_route_table.private: k => rte.id}
}

output "public_route_table" {
  value = { for k, rte in aws_route_table.public: k => rte.id}
}

output "private_tgw_routes" {
  value = local.private_tgw_routes
}

output "flat_private_tgw_routes" {
  value = local.flat_private_tgw_routes
}

output "prefix_list_routes" {
  value = local.prefix_list_routes
}

output "flat_prefix_list_routes" {
  value = local.flat_prefix_list_routes
}

output "public_tgw_routes" {
  value = local.public_tgw_routes
}

output "flat_public_tgw_routes" {
  value = local.flat_public_tgw_routes
}

output "public_prefix_list_routes" {
  value = local.public_prefix_list_routes
}

output "flat_public_prefix_list_routes" {
  value = local.flat_public_prefix_list_routes  
}