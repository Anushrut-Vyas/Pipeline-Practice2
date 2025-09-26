module "rg-par-module" {
  source       = "../../child-module/resource-group"
  rg-map-child = var.rg-map-parent
}

module "vn-par-module" {
  source       = "../../child-module/virtual-network"
  vn-map-child = var.vn-map-parent
  depends_on   = [module.rg-par-module]

}

module "subnet-par-module" {
  source           = "../../child-module/subnet"
  depends_on       = [module.rg-par-module, module.vn-par-module]
  subnet-map-child = var.subnet-map-parent

}

module "pip-par-module" {
  source = "../../child-module/public-ip"
  depends_on = [ module.rg-par-module ]
  pip-map-child = var.pip-map-parent
}

module "nic-par-module" {
  source = "../../child-module/network-interface-card"
  depends_on = [ module.rg-par-module, module.vn-par-module, module.subnet-par-module, module.pip-par-module ]
  nic-map-child = var.nic-map-parent
}

module "nsg-par-module" {
  source = "../../child-module/network-security-group"
  depends_on = [ module.rg-par-module ]
  nsg-map-child = var.nsg-map-parent  
}

module "sn-nsg-association-par-module" {
  source = "../../child-module/subnet-network-security-group-association"
  depends_on = [ module.vn-par-module, module.subnet-par-module, module.nsg-par-module ]
  sn-nsg-association-map-child = var.sn-nsg-association-map-parent
}

module "vm-par-module" {
  source = "../../child-module/virtual-machine"
  depends_on = [ module.rg-par-module, module.nic-par-module ]
  vm-map-child = var.vm-map-parent  
}