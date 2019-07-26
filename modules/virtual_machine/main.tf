resource "azurerm_virtual_machine" "virtual_machine" {
  name                          = "${var.name}-vm"
  location                      = "${var.location}"
  resource_group_name           = "${var.resource_group_name}"
  network_interface_ids         = ["${var.network_interface_ids}"]
  vm_size                       = "${var.vm_size}"
  delete_os_disk_on_termination = "${var.delete_os_disk_on_termination}"

  storage_image_reference {
    publisher = "${var.storage_image_reference_publisher}"
    offer     = "${var.storage_image_reference_offer}"
    sku       = "${var.storage_image_reference_sku}"
    version   = "${var.storage_image_reference_version}"
  }
  storage_os_disk {
    name              = "${var.storage_os_disk_name}"
    caching           = "${var.storage_os_disk_caching}"
    create_option     = "${var.storage_os_disk_create_option}"
    managed_disk_type = "${var.storage_os_disk_managed_disk_type}"
    disk_size_gb      = "${var.storage_os_disk_size_gb}"
  }
  os_profile {
    computer_name  = "${var.os_profile_computer_name}"
    admin_username = "${var.os_profile_admin_username}"
    admin_password = "${var.os_profile_admin_password}"
  }
  os_profile_linux_config {
    disable_password_authentication = "${var.os_profile_linux_config_disable_password}"

    ssh_keys {
      path     = "/home/${var.os_profile_admin_username}/.ssh/authorized_keys"
      key_data = "${var.ssh_keys_data}"
    }
  }

  # Copy files to remote VM
  provisioner "file"{
    source = "${var.source_file}"
    destination = "${var.destination_file}"

    connection {
      type = "ssh"
      host = "${var.connection_host}"
      user = "${var.connection_user}"
      agent = "${var.connection_agent}"
      timeout = "${var.connection_timeout}"
      private_key = "${var.connection_private_key}"
    }
  }

  tags = "${var.tags}"
}