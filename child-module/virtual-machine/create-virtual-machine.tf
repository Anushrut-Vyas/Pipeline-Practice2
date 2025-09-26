resource "azurerm_linux_virtual_machine" "vm-child" {
    for_each = var.vm-map-child
  name                = each.value.virtual-machine-name
  resource_group_name = each.value.rg-name
  location            = each.value.rg-location
  size                = each.value.size
  # 👇 UserID + Password
  admin_username      = each.value.admin-username
  admin_password      = each.value.admin-password
  disable_password_authentication = each.value.disable-pass-auth       # IMPORTANT: Password allow karne ke liye
  network_interface_ids = [
    data.azurerm_network_interface.data-nic[each.key].id
    #azurerm_network_interface.example.id,
  ]

#   SSH key is not required as we are using admin_username and password to login
#   admin_ssh_key {
#     username   = each.value.username
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage-account-type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  # 👇 Custom Script for Nginx installation
  custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
  )  
}