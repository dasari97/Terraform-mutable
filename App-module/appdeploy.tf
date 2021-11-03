resource "null_resource" "apps" {
  count  = length(local.all_instance_ip)
  triggers = {
    abc = timestamp()
  }
  # remove comment's when you want to run the mongodb null resource
  #triggers = {
   # abc = local.all_instance_ip
  #}
  
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = jsondecode(data.aws_secretsmanager_secret_version.Dev_secret.secret_string)["ssh_user"]
      password = jsondecode(data.aws_secretsmanager_secret_version.Dev_secret.secret_string)["ssh_pass"]
      host     = element(local.all_instance_ip, count.index)
    }
    
    inline = [
      "sudo yum install python3-pip -y",
      "sudo pip3 install pip --upgrade",
      "sudo pip3 install ansible==4.1.0",
      "ansible-pull -i localhost -U https://dasarisaikrishna97@dev.azure.com/dasarisaikrishna97/Roboshop/_git/ansible-roboshop.git roboshop-pull.yml -e COMPONENT=${var.component} -e ENV=${var.env} -e APP_VERSION=${var.APP_VERSION}"
    ]
  }
  
}