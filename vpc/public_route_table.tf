resource "aws_route_table" "public" {
  for_each = var.public_subnet_cidrs

  vpc_id = aws_vpc.this[0].id

  tags = merge(
    {"Name" = "public_route_table_az${split("-", each.key)[2]}"},
    var.public_route_table_tags,
  )
}

resource "aws_route_table_association" "public" {
  for_each = var.public_subnet_cidrs

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public[each.key].id
}

