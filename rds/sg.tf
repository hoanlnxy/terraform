resource "aws_security_group" "sg_rds" {
  name        = "sg_rds"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"

  tags {
    Name = "sg_rds"
  }
}

resource "aws_security_group_rule" "allow_app" {
  type              = "ingress"
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.example.cidr_block]
  from_port         = 65535
  security_group_id = "sg-123456"
}

