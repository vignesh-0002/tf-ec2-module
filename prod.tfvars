cidr                         = "10.0.0.0/16"
name                         = "vpc-module"
environment                  = "prod-module"
enable_dns_hostnames         =  false
enable_dns_support           =  true
Public_sn_cidr               = "10.0.0.0/24"
Private_sn_cidr_1            = "10.0.1.0/24"  
database_sn_cidr             = "10.0.2.0/24" 
Private_sn_cidr_2            = "10.0.3.0/24" 
create-eip                   =  true
public_subnet_az             = "ap-south-1a"
private_subnet_az_2          = "ap-south-1b"
public_rt_cidr               = "0.0.0.0/0"
Private_rt_cidr              = "0.0.0.0/0"
database_rt_cidr             = "0.0.0.0/0"
ami                          = "ami-0f5ee92e2d63afc18"
instance_type                = "t2.micro"
associate_public_ip_address  =  true
subnet_grp_name              = "mysql-subnets"  
keypair-name                 = "prod"
Dynamodb_name                = "prod_dynamo-db"
s3-bucket-name               = "prod-ems-ops-jumisa-statebackend"
iam-role-name                = "prod-iam-role"
iam-instance-profile-name    = "Prod-EC2_SSM_Instance_Profile"