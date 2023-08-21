variable "AZURE_SUBSCRIPTION_ID" {}
variable "AZURE_CLIENT_ID" {}
variable "AZURE_CLIENT_SECRET" {}
variable "AZURE_TENANT_ID" {}

##########################################################################################
# Variable for VM
variable "vm_resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
}
variable "location" {
  description = "The Azure region where all resources should be created."
  default     = "Canadacentral"
}
variable "vm_name" {
  description = "The name of the virtual machine."
  default     = "myVM"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "The name of the administrative account."
  default     = "adminuser"
}
# Uncheck if you are using password to login
#variable "admin_password" {
#  description = "The password of the administrative account."
#  sensitive   = true
#}

variable "os_publisher" {
  description = "Specifies the publisher of the image used to create the virtual machine."
  default     = "Canonical"
}

variable "os_offer" {
  description = "Specifies the offer of the image used to create the virtual machine."
  default     = "UbuntuServer"
}

variable "os_sku" {
  description = "Specifies the SKU of the image used to create the virtual machine."
  default     = "18.04-LTS"
}

variable "os_version" {
  description = "Specifies the version of the image used to create the virtual machine."
  default     = "latest"
}
variable "ssh_public_key_path" {
  description = "Path to the public SSH key."
  type        = string
}
#####################################################################################

# Variable for AKS

variable "location_aks" {
  description = "Azure region for the resources"
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "gfakxrg"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "gfakxacr"
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  default     = "gfakxaks"
}

variable "dns_prefix" {
  description = "DNS prefix for AKS cluster"
  default     = "gfakxaks"
}

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  default     = "Standard"
}

variable "aks_node_count" {
  description = "Number of nodes in the AKS cluster"
  default     = 2
}

variable "aks_vm_size" {
  description = "VM size for the AKS nodes"
  default     = "Standard_A2_v2"
}