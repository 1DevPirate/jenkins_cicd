# Create a local user
resource "null_resource" "create_user" {
  provisioner "local-exec" {
    command = "sudo useradd -m -s /bin/bash choncey"
  }
}

# Create a sudoers file for the user
resource "null_resource" "create_sudoers" {
  provisioner "local-exec" {
    command = <<-EOT
      echo 'username ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/choncey
      sudo chmod 440 /etc/sudoers.d/choncey
    EOT
  }

  depends_on = [null_resource.create_user]
}
