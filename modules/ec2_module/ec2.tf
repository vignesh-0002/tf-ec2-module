resource "tls_private_key" "this" {
  algorithm     = "RSA"
  rsa_bits      = 4096
}

resource "aws_key_pair" "this" {
  key_name      = var.keypair-name // terraform.workspace
  public_key    = tls_private_key.this.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.this.private_key_pem}" > "${var.keypair-name}".pem
    EOT
  }
}

resource "aws_instance" "public_instance_module" {
  ami                         =  var.ami
  instance_type               =  var.instance_type
  key_name                    =  aws_key_pair.this.key_name
  subnet_id                   =  var.Public_subnet_id
  security_groups             = [var.ems_ops_public_sg]
  associate_public_ip_address =  var.associate_public_ip_address
  tags                        =  merge(
                                   {
                                     Name        = "public_ec2.${var.name}"
                                     Environment = var.environment
                                   },
                                   var.tags
                                     )

}

#private_ec2

resource "aws_instance" "private_instance_module" {
  ami                              = var.ami
  instance_type                    = var.instance_type
  key_name                         = aws_key_pair.this.key_name
  subnet_id                        = var.Private_subnet_id
  iam_instance_profile             = "${var.ec2_instance_profile}"
  security_groups                  = [var.ems_ops_private_sg] 
  associate_public_ip_address      = false
  tags                             = merge(
                                        {
                                          Name        = "private_ec2.${var.name}"
                                          Environment = var.environment
                                        },
                                        var.tags
                                          )

}

#database_subnet

resource "aws_instance" "database_instance_module" {
  ami                            = var.ami
  instance_type                  = var.instance_type
  key_name                       = aws_key_pair.this.key_name
  subnet_id                      = var.database_sn_id
  associate_public_ip_address    = false
  iam_instance_profile           = "${var.ec2_instance_profile}"
  security_groups                = [var.ems_ops_private_sg]
  tags                           = merge(
                                      {
                                        Name        = "database_ec2.${var.name}"
                                        Environment = var.environment
                                      },
                                      var.tags
                                      )

}



