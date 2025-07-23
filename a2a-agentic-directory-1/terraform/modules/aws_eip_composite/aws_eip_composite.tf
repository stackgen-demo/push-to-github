resource "aws_eip" "main" {
  domain = "vpc"

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
