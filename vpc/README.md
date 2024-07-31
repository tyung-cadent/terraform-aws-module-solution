# AWS VPC Terraform module

  This terraform module creates VPC, dhcp option set, igw, nat gateway, vpc endpoints, subnets and route table.

## Usage

  Since Cadent uses Azure DevOps(ADO) for its CI/CD tool, ADO requires variable names in upper case.
  The below variable assignment will allow ADO to supply variable value during deployment. 

```hcl
module "vpc" {
  source = "git::https://dev.azure.com/cadent-tv/DevOps/_git/terraform-aws-modules//vpc/v1_00"

  env = var.ENV

  create_dhcp_options = var.CREATE_DHCP_OPTIONS
  dhcp_options_name   = var.DHCP_OPTIONS_NAME
  aws_region          = var.AWS_REGION

  vpc_cidr   = var.VPC_CIDR
  create_vpc = var.CREATE_VPC
  vpc_name   = var.VPC_NAME
  vpc_tags   = var.VPC_TAGS

  create_tgw_attachment = var.CREATE_TGW_ATTACHMENT
  create_tgw_subnets    = var.CREATE_TGW_SUBNETS
  tgw_tags              = var.TGW_TAGS

  create_igw = var.CREATE_IGW
  igw_tags   = var.IGW_TAGS

  create_private_subnets = var.CREATE_PRIVATE_SUBNETS
  create_public_subnets  = var.CREATE_PUBLIC_SUBNETS
  private_subnet_cidrs   = var.PRIVATE_SUBNET_CIDRS
  public_subnet_cidrs    = var.PUBLIC_SUBNET_CIDRS

  create_nat_gateway            = var.CREATE_NAT_GATEWAY
  nat_gateway_connectivity_type = var.NAT_GATEWAY_CONNECTIVITY_TYPE
  default_route                 = var.DEFAULT_ROUTE

  tgw_destination_cidr_block        = var.TGW_DESTINATION_CIDR_BLOCK
  tgw_destination_prefix_list       = var.TGW_DESTINATION_PREFIX_LIST
  public_tgw_destination_cidr_block = var.PUBLIC_TGW_DESTINATION_CIDR_BLOCK
  transit_gateway_id                = var.TRANSIT_GATEWAY_ID

  nat_gateway_tags = var.NAT_GATEWAY_TAGS

  private_route_table_tags = var.PRIVATE_ROUTE_TABLE_TAGS
  public_route_table_tags  = var.PUBLIC_ROUTE_TABLE_TAGS

}
```





## Authors

Module is maintained by Teddy Yung tyung@cadent.tv 



## Bug
VPC Endpoint update fails when Route Table in same config is destroyed first
https://github.com/hashicorp/terraform-provider-aws/issues/26502