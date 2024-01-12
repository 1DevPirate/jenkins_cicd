resource "null_resource" "update_apps" {
  provisioner "local-exec" {
    command = "sudo apt update"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "install_apache2" {
  provisioner "local-exec" {
    command = "sudo apt install apache2"
  }
}

resource "null_resource" "install_mysql" {
  provisioner "local-exec" {
    command = "sudo apt install mysql-server"
  }
}

resource "null_resource" "install_postgres" {
  provisioner "local-exec" {
    command = "sudo apt install postgresql"
  }
}

sudo terraform apply
