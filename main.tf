#######################################
# Retrieve the resource group
#######################################
data "ibm_resource_group" "group" {
  name     = var.environment_name
}

#######################################
# Create the resource group
#######################################
#resource "ibm_resource_group" "group" {
#  name     = var.environment_name
#}

###########################################
# Developer access group and access policies
############################################
resource "ibm_iam_access_group" "developer_role" {
  name        = var.access_group_name_developer_role
  description = var.access_group_description
}

resource "ibm_iam_access_group_policy" "resourcepolicy_developer" {
  access_group_id = ibm_iam_access_group.developer_role.id
  roles           = ["Viewer"]

  resources {
    resource_type = "resource-group"
    resource      = data.ibm_resource_group.group.id
  }
}

resource "ibm_iam_access_group_policy" "developer_platform_accesspolicy" {
  access_group_id = ibm_iam_access_group.developer_role.id
  roles        = ["Viewer"]

  resources {
    resource_group_id = data.ibm_resource_group.group.id
  }
}

resource "ibm_iam_access_group_policy" "developer_logging_policy" {
  access_group_id = ibm_iam_access_group.developer_role.id
  roles           = ["Standard Member"]

  resources {
    service           = "logdna"
    resource_instance_id = data.ibm_resource_group.group.id
  }
}

resource "ibm_iam_access_group_members" "developers" {
  access_group_id = ibm_iam_access_group.developer_role.id
  ibm_ids         = var.iam_access_members_developers
}