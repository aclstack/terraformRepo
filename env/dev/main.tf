locals {
  region = "cn-beijing-f"
  vpc_name = "myvpc"
  ecsList = {
    dev-a = { instance_type = "ecs.e-c1m1.large", image_id = "centos_7_9_x64_20G_alibase_20240628.vhd" }
    dev-b = { instance_type = "ecs.e-c2m2.large", image_id = "centos_7_9_x64_20G_alibase_20240628.vhd" }
    dev-c = { instance_type = "ecs.e-c1m1.large", image_id = "centos_7_9_x64_20G_alibase_20240628.vhd" }
  }
  vpc_cidr_block = "172.80.0.0/12"
  vsw_cidr_block = "172.80.0.0/21"
  dns_record = "xxxxx"
}


module "myVpc" {
  source = "../../modules/vpc"
  vpc_name = local.vpc_name
  vpc_cidr_block =  local.vpc_cidr_block
  vsw_cidr_block = local.vsw_cidr_block
}

# module "myEcs" {
#   source = "../../modules/ecs"
#   ecsList = local.ecsList
#   region = local.region
#   vws_id = module.myVpc.vws_id
#   secgroup_id = [module.mySecgroup.secgroup_id]
# }
#
# module "mySecgroup" {
#   source = "../../modules/secgroup"
#   vpc_id = module.myVpc.vpc_id
# }
#
# module "myDns" {
#   source = "../../modules/dns"
#   dns_record = local.dns_record
#   ecs_ip = module.mySLb.slb_ip_address
# }
#
# module "mySLb" {
#   source = "../../modules/slb"
#   ecsList = module.myEcs.ecsList
#   vws_id = module.myVpc.vws_id
# }