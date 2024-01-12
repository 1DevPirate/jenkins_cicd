resource "null_resource" "update_apps" {
  provisioner "local-exec" {
    command = "/usr/bin/sudo apt update"
  }
}

resource "null_resource" "install_apache2" {
  provisioner "local-exec" {
    command = "/usr/bin/sudo apt install -y apache2"
  }
}

resource "null_resource" "install_mysql" {
  provisioner "local-exec" {
    command = "/usr/bin/sudo apt install -y mysql-server"
  }
}

resource "null_resource" "install_postgres" {
  provisioner "local-exec" {
    command = "/usr/bin/sudo apt install -y postgresql"
  }
}

resource "null_resource" "apply_terraform" {
  provisioner "local-exec" {
    command = "/usr/bin/sudo terraform apply"
  }
}
