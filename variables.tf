# variable "ibmcloud_api_key" {}

variable "ibmcloud_region" {
    description = "Preferred IBM Cloud region to use for your infrastructure"
    default = "us-east"
}
variable "environment_name" {
    description = "resource group name"
    default = "blueprint_base"
}

variable "access_group_name_developer_role" {
    default = "Blueprint-Developer-Role-Development"
}

variable "access_group_name_tester_role" {
    default = "Blueprint-Tester-Role-Development"
}

variable "access_group_name_operator_role" {
    default = "Blueprint-Operator-Role-Development"
}

variable "access_group_name_pipeline_role" {
    default = "Blueprint-Pipeline-Role-Development"
}

variable "access_group_description" {
  type = string
  default = "used by the multiple-environments-as-code tutorial"
}

variable "iam_access_members_developers"{
  type = list
  default = ["rchiabra@pe.ibm.com","jninga@pe.ibm.com"]
}

variable "iam_access_members_testers"{
  type = list
  default = []
}

variable "iam_access_members_operators"{
  type = list
  default = []
}

variable "iam_access_members_pipeline"{
  type = list
  default = []
}

variable "resource_group_roles_developer"{
  type = list
  default = []
}

variable "resource_group_roles_operator"{
  type = list
  default = []
}

variable "resource_group_roles_tester"{
  type = list
  default = []
}

variable "resource_group_roles_pipeline"{
  type = list
  default = []
}

variable "platform_access_roles"{
  type = list
  default = []
}

variable "monitoring_service_roles"{
  type = list
  default = []
}

