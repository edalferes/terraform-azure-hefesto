resource "null_resource" "file_copy" {

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
}
