
module "aks" {
  source              = "./aks"
  location            = var.location_aks
  resource_group_name = var.resource_group_name
  aks_node_count      = var.aks_node_count
  aks_vm_size         = var.aks_vm_size
  acr_name            = var.acr_name
  aks_name            = var.aks_name
  dns_prefix          = var.dns_prefix
  acr_sku             = var.acr_sku
}


module "vm" {
  source              = "./vm"
  location            = var.location
  resource_group_name = var.vm_resource_group_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  #  admin_password      = var.admin_password
  os_publisher        = var.os_publisher
  os_offer            = var.os_offer
  os_sku              = var.os_sku
  os_version          = var.os_version
  ssh_public_key_path = var.ssh_public_key_path
}
