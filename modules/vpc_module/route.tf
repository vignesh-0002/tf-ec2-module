#Public_Route Table for the Custom VPC
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.public_rt_cidr
    gateway_id = aws_internet_gateway.IGW.id
  }

   tags = merge(
    {
      Name        = "public_rt.${var.name}"
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table_association" "public-rt" {
  subnet_id      = aws_subnet.public_sn.id
  route_table_id = aws_route_table.public_rt.id
}

#private_route_table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.Private_rt_cidr
    nat_gateway_id = aws_nat_gateway.gw.id
  }

   tags = merge(
    {
      Name        = "private_rt.${var.name}"
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table_association" "private-rt" {
  subnet_id      = aws_subnet.private_sn_1.id
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.Private_rt_cidr
    nat_gateway_id = aws_nat_gateway.gw.id
  }

   tags = merge(
    {
      Name        = "private_rt_2.${var.name}"
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table_association" "private-rt_2" {
  subnet_id      = aws_subnet.private_sn_2.id
  route_table_id = aws_route_table.private_rt_2.id
}


#database_route_table

resource "aws_route_table" "database_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.database_rt_cidr
    nat_gateway_id = aws_nat_gateway.gw.id
  }

   tags = merge(
    {
      Name        = "database_rt.${var.name}"
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table_association" "database-rt" {
  subnet_id      = aws_subnet.database_sn.id
  route_table_id = aws_route_table.database_rt.id
}  
