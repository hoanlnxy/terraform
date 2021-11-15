module "db" {
  #source  = "git::https://git.sec.samsung.net/ops/terraform-aws-rds.git?ref=v1.0.2"
  source = "./terraform-aws-rds"

  identifier = "${var.db_identifier}" 
  name     = "${var.db_identifier}"
  username = "${var.db_user}"
  password = "${var.db_password}"
  port     = "${var.db_port}"
  #replicate_source_db = "arn:aws:rds:us-east-1:231709379591:cluster:bridge-rds-aurora-prd-cluster"
  #kms_key_id = ""

  engine            = "aurora-mysql"
  engine_version    = "5.7.12"
  instance_class    = "db.r4.large"
  allocated_storage = 100

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["${aws_security_group.sg_rds.id}"]
  #vpc_security_group_ids = ["${data.terraform_remote_state.sg.sg_ids_map.sg_redis}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "terraform"
    Environment = "prd"
  }

  # DB subnet group
  subnet_ids = "${data.terraform_remote_state.vpc.database_subnet_ids}"

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "final-snapshot"

  # Database Deletion Protection
  deletion_protection = false
  #multi_az = 
  parameters = [
    {
      name = "character_set_client"
      value = "utf8"
    },
    {
      name = "character_set_server"
      value = "utf8"
    }
  ]

  options = []
}
