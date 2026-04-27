locals {
  tags = "${var.env}-${var.project}-${var.component}"
   tag = merge( var.common_tags,
    {
      Name        = "cart"
      Environment = var.env
    }
  )
}