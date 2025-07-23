resource "aws_nat_gateway" "this" {
  subnet_id     = var.subnet_id
  allocation_id = var.create_eip ? aws_eip.nat[0].id : var.eip_allocation_id

  tags = merge(
    {
      Name = var.nat_gateway_name
    },
    var.tags
  )
}

resource "aws_eip" "nat" {
  count  = var.create_eip ? 1 : 0
  domain = "vpc"

  tags = merge(
    {
      Name = "${var.nat_gateway_name}-eip"
    },
    var.tags
  )
}
