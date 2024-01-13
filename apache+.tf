# Create a null resource to create a user
resource "null_resource" "create_user" {
  provisioner "local-exec" {
    command  = "sudo useradd -m -s /bin/bash choncey"
    interpreter = ["bash", "-c"]
    environment = {
      PATH = "/usr/sbin:/usr/bin:/sbin:/bin"
    }
  }
}

# Create a null resource to install Apache2
resource "null_resource" "install_apache2" {
  provisioner "local-exec" {
    command = "sudo apt install -y apache2"
  }
  depends_on = [null_resource.create_user]
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

# Create a null resource to apply Terraform
resource "null_resource" "apply_terraform" {
  provisioner "local-exec" {
    command = "sudo terraform apply"
  }
  depends_on = [null_resource.install_postgres]
}

# Check if sudo is installed
data "external" "check_sudo" {
  program = ["bash", "-c", "command -v sudo || true"]
}

# Install sudo if not already installed
resource "null_resource" "install_sudo" {
  triggers = {
    check_sudo = data.external.check_sudo.result
  }

  provisioner "local-exec" {
    command  = "sudo apt-get update && sudo apt-get install -y sudo"
    interpreter = ["bash", "-c"]
    when = create
  }
}

# Create a null resource to update apps
resource "null_resource" "update_apps" {
  provisioner "local-exec" {
    command = "/usr/bin/sudo apt update"
  }
}
