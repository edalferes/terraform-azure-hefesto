resource "null_resource" "provisioner" {

  # Copy files to remote VM
  provisioner "file" {
    source      = "${var.source_file}"
    destination = "${var.destination_file}"

    connection {
      type        = "ssh"
      host        = "${var.connection_host}"
      user        = "${var.connection_user}"
      agent       = "${var.connection_agent}"
      timeout     = "${var.connection_timeout}"
      private_key = "${var.connection_private_key}"
    }
  }

  provisioner "remote-exec" {
    inline = "${var.remote_exec_list}"

    connection {
      type        = "ssh"
      host        = "${var.connection_host}"
      user        = "${var.connection_user}"
      password    = "${var.connection_password}"
      agent       = "${var.connection_agent}"
      timeout     = "${var.connection_timeout}"
      private_key = "${var.connection_private_key}"
    }
  }
}
