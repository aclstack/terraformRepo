terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.257.0"
    }
  }
}
variable "vpc_cidr_block" {
}

variable "vpc_name" {
}


variable "vsw_cidr_block" {
}