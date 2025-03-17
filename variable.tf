variable "namespace" {
  description = "Namespace for resource naming"
  default     = "change me"
}

variable "location" {
  description = "Azure region for resource deployment"
  default     = "eastus2"
}

variable "tags" {
  description = "Tags for resources"
  default = {
    ASGID             = "ask id value"
    AssignmentGroup   = "assignment group"
    CostCenter        = ""
    Division          = ""
    Portfolio         = ""
    ProductName       = ""
    Component         = ""
    ComponentVersion  = ""
    Environment       = ""
  }
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "subnet-change-me"
}
