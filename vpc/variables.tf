variable "aws_region" {
  type    = string
  default = ""
}

variable "env" {
  type    = string
  default = ""
}

################################################################################
# Transit Gateway(tgw) Subnets
################################################################################

variable "create_tgw_subnets" {
  type    = bool
  default = false
}

variable "tgw_tags" {
  type    = map(string)
  default = {}
}


################################################################################
# DHCP Options Set
################################################################################
variable "create_dhcp_options" {
  type    = bool
  default = false
}

variable "dhcp_options_domain_name_servers" {
  type    = list(string)
  default = ["AmazonProvidedDNS"]
}

variable "dhcp_options_ntp_servers" {
  type    = list(string)
  default = []
}

variable "dhcp_options_netbios_name_servers" {
  type    = list(string)
  default = []
}

variable "dhcp_options_netbios_node_type" {
  type    = string
  default = ""
}

variable "dhcp_options_tags" {
  type    = map(string)
  default = {}
}

variable "dhcp_options_name" {
  type    = string
  default = ""
}

################################################################################
# VPC
################################################################################
variable "create_vpc" {
  type    = bool
  default = false
}

variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

variable "vpc_name" {
  type    = string
  default = ""
}

################################################################################
# Subnets
################################################################################
variable "create_private_subnets" {
  description = "key is az name, Value is private cidr range. ie {us-east-1a: \"10.160.96.0/20\"}"
  type        = bool
  default     = false
}

variable "create_public_subnets" {
  description = "key is az name, Value is public cidr range. ie {us-east-1a: \"10.160.16.0/20\"}"
  type        = bool
  default     = false
}

variable "private_subnet_cidrs" {
  type    = map(string)
  default = {}
}

variable "public_subnet_cidrs" {
  type    = map(string)
  default = {}
}

variable "subnet_tags" {
  type    = map(string)
  default = {}
}


################################################################################
# NAT and Internet gateways
################################################################################
variable "create_nat_gateway" {
  type    = bool
  default = false
}

variable "nat_gateway_connectivity_type" {
  type    = string
  default = "public"
}

variable "create_igw" {
  type    = bool
  default = false
}

variable "igw_tags" {
  type    = map(string)
  default = {}
}

variable "nat_gateway_tags" {
  type    = map(string)
  default = {}
}

################################################################################
# private and public route table and routes
################################################################################
variable "default_route" {
  type    = string
  default = "0.0.0.0/0"
}

variable "tgw_destination_cidr_block" {
  description = "key is destination cidr range, Value is transit gateway id. ie { 10.160.0.0/16: \"tgw-0f874aece04a857fb\"}"
  type        = map(string)
  default     = {}
}

variable "tgw_destination_prefix_list" {
  description = "key is prefix list ID, Value is transit gateway id. ie { pl-001513635cff63f50: \"tgw-0f874aece04a857fb\"}"
  type        = map(string)
  default     = {}
}

variable "public_tgw_destination_cidr_block" {
  description = "key is destination cidr range, Value is transit gateway id. ie { 10.160.0.0/16: \"tgw-0f874aece04a857fb\"}"
  type        = map(string)
  default     = {}
}
          
variable "public_tgw_destination_prefix_list" {
  description = "key is prefix list ID, Value is transit gateway id. ie { pl-001513635cff63f50: \"tgw-0f874aece04a857fb\"}"
  type        = map(string)
  default     = {}
}

variable "private_route_table_tags" {
  type    = map(string)
  default = {}
}

variable "public_route_table_tags" {
  type    = map(string)
  default = {}
}
