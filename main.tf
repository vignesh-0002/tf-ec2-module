module "dev-vpc"{
       source                       = "./modules/vpc_module"
       cidr                         = var.cidr
       name                         = var.name
       environment                  = var.environment
       enable_dns_hostnames         = var.enable_dns_hostnames
       enable_dns_support           = var.enable_dns_support
       tags                         = var.tags  
       Public_sn_cidr               = var.Public_sn_cidr
       Private_sn_cidr_1            = var.Private_sn_cidr_1
       Private_sn_cidr_2            = var.Private_sn_cidr_2 
       public_subnet_az             = var.public_subnet_az 
       private_subnet_az_2          = var.private_subnet_az_2
       database_sn_cidr             = var.database_sn_cidr 
       public_rt_cidr               = var.public_rt_cidr
       Private_rt_cidr              = var.Private_rt_cidr 
       database_rt_cidr             = var.database_rt_cidr 
       create-eip                   = var.create-eip 
}


module "security_group" {
       source                       = "./modules/securitygroup_module"
       vpc_id                       = module.dev-vpc.vpc_id
       name                         = var.name
       environment                  = var.environment
       tags                         = var.tags
}


module "ec2" {
      source                       = "./modules/ec2_module"
      Public_subnet_id             = module.dev-vpc.Public_subnet_id
      Private_subnet_id            = module.dev-vpc.Private_subnet_id 
      database_sn_id               = module.dev-vpc.database_sn_id
      ems_ops_public_sg            = module.security_group.ems_ops_public_sg
      ems_ops_private_sg           = module.security_group.ems_ops_private_sg
      ec2_instance_profile         = module.session-manager-settings.ec2_instance_profile
      name                         = var.name
      environment                  = var.environment
      tags                         = var.tags
      ami                          = var.ami
      instance_type                = var.instance_type
      associate_public_ip_address  = var.associate_public_ip_address 
      keypair-name                 = var.keypair-name  
}    

#module "RDS" {
#     source                        = "./modules/RDS_module"
#     Private_subnet_id             = module.dev-vpc.Private_subnet_id
#     private_subnet_id_2           = module.dev-vpc.private_subnet_id_2
#     ems_ops_private_sg            = module.security_group.ems_ops_private_sg
#     subnet_grp_name               = var.subnet_grp_name 
#}

module "session-manager-settings" {
  source                            = "./modules/IAM_role_module"
  iam-role-name                     = var.iam-role-name 
  iam-instance-profile-name         = var.iam-instance-profile-name
}