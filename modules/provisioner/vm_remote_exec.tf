provider "null_resource" "vm_remote_exec" {
  provisioner "remote-exec" {
    inline = "${var.remote_exec_list}"

    connection {
      type        = "ssh"
      host        = "${var.connection_host}"
      user        = "${var.connection_user}"
      agent       = "${var.connection_agent}"
      timeout     = "${var.connection_timeout}"
      private_key = "${var.connection_private_key}"
    }
  }
}
