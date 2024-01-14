# Create a null resource to install Apache2
resource "null_resource" "install_apache2" {
  provisioner "local-exec" {
    command  = "/usr/bin/sudo apt install -y apache2"
    interpreter = ["bash", "-c"]
  }
}

# Create a null resource to update apps
resource "null_resource" "update_apps" {
  provisioner "local-exec" {
    command  = "/usr/bin/sudo apt update"
    interpreter = ["bash", "-c"]
  }
}


# Create a null resource to install MySQL
resource "null_resource" "install_mysql" {
  provisioner "local-exec" {
    command = "sudo apt install -y mysql-server"
  }
  depends_on = [null_resource.install_apache2]
}

# Create a null resource to install PostgreSQL
resource "null_resource" "install_postgres" {
  provisioner "local-exec" {
    command = "sudo apt install -y postgresql"
  }
  depends_on = [null_resource.install_mysql]
}
