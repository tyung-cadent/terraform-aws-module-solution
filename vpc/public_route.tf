locals {
  public_tgw_routes = [
    for rte in aws_route_table.public : [
      for cidr, tgw_id in var.public_tgw_destination_cidr_block : {
        route_table_id  = rte.id
        cidr_block      = cidr
        transit_gateway_id = tgw_id
      }
    ]
  ]

  flat_public_tgw_routes = flatten(local.public_tgw_routes)

  public_prefix_list_routes = [
    for rte in aws_route_table.public : [
      for prefix, tgw_id in var.public_tgw_destination_prefix_list : {
        route_table_id   = rte.id
        prefix_list_name = prefix
        transit_gateway_id = tgw_id
      }
    ]
  ]

  flat_public_prefix_list_routes = flatten(local.public_prefix_list_routes)
}

resource "aws_route" "public_default_route" {
  for_each = var.public_subnet_cidrs

  route_table_id         = aws_route_table.public[each.key].id
  destination_cidr_block = var.default_route
  gateway_id             = aws_internet_gateway.this[0].id

  timeouts {
    create = "5m"
  }
}

resource "aws_route" "public_tgw_route" {
  count = length(local.flat_public_tgw_routes)

  route_table_id         = local.flat_public_tgw_routes[count.index].route_table_id
  destination_cidr_block = local.flat_public_tgw_routes[count.index].cidr_block
  transit_gateway_id     = local.flat_public_tgw_routes[count.index].transit_gateway_id

  timeouts {
    create = "5m"
  }
}

resource "aws_route" "public_prefix_list_route" {
  count = length(local.flat_public_prefix_list_routes)

  route_table_id             = local.flat_public_prefix_list_routes[count.index].route_table_id
  destination_prefix_list_id = local.flat_public_prefix_list_routes[count.index].prefix_list_name
  transit_gateway_id         = local.flat_public_prefix_list_routes[count.index].transit_gateway_id

  timeouts {
    create = "5m"
  }
}
