module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>5.7.0"

  # VPC Basic Details   
  name = "vpc-dev"
  cidr = "10.0.0.0/16"
  # azs             = ["ca-central-1a", "ca-central-1b"]
  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  # NAT Gatewats - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true
  #   enable_vpn_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Database Subnets

  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  #   create_database_internet_gateway_route = true
  #   create_database_nat_gateway_route      = true
  database_subnets = ["10.0.15.0/24", "10.0.152.0/24"]

  public_subnet_tags = {
    Name = "Public-subnets"

  }

  private_subnet_tags = {
    Name = "Private-subnets"
  }

  database_subnet_tags = {
    Name = "Database-subnets"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }

  tags = {
    Owner       = "Haggai"
    Terraform   = "true"
    Environment = "dev"
  }
}