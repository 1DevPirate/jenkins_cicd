# Create a local user
resource "null_resource" "choncey" {
  provisioner "local-exec" {
    command = "sudo useradd -m -s /bin/bash choncey"
  }
}

# Create a sudoers file for the user
resource "null_resource" "choncey" {
  provisioner "local-exec" {
    command = <<-EOT
      echo 'username ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/username
      sudo chmod 440 /etc/sudoers.d/choncey
    EOT
  }

  depends_on = [null_resource.create_user]
}
