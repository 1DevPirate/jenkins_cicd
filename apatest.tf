# Create a null resource to create a user
resource "null_resource" "create_user" {
  provisioner "local-exec" {
    command      = "useradd -m -s /bin/bash choncey"
    interpreter  = ["bash", "-c"]
    environment  = { PATH = "/usr/sbin:/usr/bin:/sbin:/bin" }
  }
}

# Create a null resource to install Apache2
resource "null_resource" "install_apache2" {
  provisioner "local-exec" {
    command = "apt install -y apache2"
  }
  depends_on = [null_resource.create_user]
}

# Create a null resource to install MySQL
resource "null_resource" "install_mysql" {
  provisioner "local-exec" {
    command = "apt install -y mysql-server"
  }
  depends_on = [null_resource.install_apache2]
}

# Create a null resource to install PostgreSQL
resource "null_resource" "install_postgres" {
  provisioner "local-exec" {
    command = "apt install -y postgresql"
  }
  depends_on = [null_resource.install_mysql]
}

# Create a null resource to update apps
resource "null_resource" "update_apps" {
  provisioner "local-exec" {
    command = "apt update"
  }
}
