#RDS Resources
resource "aws_db_subnet_group" "mysql-subnet_groups" {
  name                       =  var.subnet_grp_name
  subnet_ids                 = [var.Private_subnet_id,var.private_subnet_id_2]
}

#create a RDS Database Instance
resource "aws_db_instance" "EMS_OPS_" {
  engine                     = "mysql"
  identifier                 = "myrdsinstance"
  allocated_storage          =  20
  engine_version             = "8.0.33"
  instance_class             = "db.t2.micro"
  username                   = "admin"
  password                   = "admin@123"
  parameter_group_name       = "default.mysql5.7"
  vpc_security_group_ids     = [var.ems_ops_private_sg]
  skip_final_snapshot        = true
  publicly_accessible        = false
}