# Create a null resource to create a user
resource "null_resource" "create_user" {
  # Omitted the local-exec provisioner for user creation
}

# Create a null resource to install Apache2
resource "null_resource" "install_apache2" {
  provisioner "local-exec" {
    command = "apt install -y apache2"
  }
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

# Omitted the null resource for updating apps
