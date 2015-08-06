## Authentication and Regional settings
variable "aws_access_key_id" {
  default = "----REPLACE----"
}

variable "aws_secret_access_key" {
  default = "----REPLACE----"
}

variable "aws_region" {
  default = "eu-west-1"
}




## VPC and default network settings
# VPC default IP CIDR range
variable "vpc_cidr_block" {
  default = "10.250.0.0/16"
}

# Availibility Zones
variable "availability_zone" {
  default = {
      primary = "eu-west-1c"
      secondary = "eu-west-1a"
  }
}

# Default Subnets
variable "PubSub_cidr_block" {
  default = {
    PubSub1 = "10.250.1.0/24"
    PubSub2 = "10.250.2.0/24"
  }
}

variable "PrivSub_cidr_block" {
  default = {
    PrivSub1 = "10.250.3.0/24"
    PrivSub2 = "10.250.4.0/24"
  }
}


## SSH key information
# best to use the console to generate the key... terraform only supports key import/export through aws_key_pair resources
# https://www.terraform.io/docs/providers/aws/r/key_pair.html

variable "general_key" {
  default = "GeneralKey"
}


#####################Need some wordpress specific settings#############################################
##Database settings

variable "db_name" {
  default = "wordpress"
}

variable "db_username" {
  default = "wpuser"
}

#Change the password
variable "db_password" {
  default = "----REPLACE----"
}

#DB size GB
variable "db_size" {
  default = "5"
}


##Domain Configuration
# please go to console and check the created name servers and update your dns provider records.
variable "domain_name" {
  default = "----REPLACE----"
}


##FTP settings
variable "ftp_user" {
  default = "wpftp"
}

variable "ftp_pass" {
  default = "----REPLACE----"
}

