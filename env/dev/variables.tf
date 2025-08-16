provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = "cn-beijing"
}


variable "alicloud_access_key" {
  type = string
}

variable "alicloud_secret_key" {
  type = string
}

