resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.routes
    content {
      cidr_block = route.value.cidr_block

      # Dynamically set the target based on the target_type
      gateway_id                = route.value.target_type == "gateway" ? route.value.target_id : null
      nat_gateway_id            = route.value.target_type == "nat_gateway" ? route.value.target_id : null
      network_interface_id      = route.value.target_type == "network_interface" ? route.value.target_id : null
      vpc_peering_connection_id = route.value.target_type == "vpc_peering_connection" ? route.value.target_id : null
      transit_gateway_id        = route.value.target_type == "transit_gateway" ? route.value.target_id : null
    }
  }

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

resource "aws_route_table_association" "main" {
  count = length(var.subnet_ids)

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.main.id
}
