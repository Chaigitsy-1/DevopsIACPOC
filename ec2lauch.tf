locals {
ssh_user="ubuntu"
pvtkeypath="${var.pvtkeypath}"
}

resource "aws_instance" "instance1" {
ami = "ami-033405fef856aa050"
key_name      = "${var.keyname}"
instance_type = "t2.micro"
vpc_security_group_ids = [ aws_security_group.terrasecure.id ]
subnet_id = aws_subnet.subnetterraform.id


tags = {
Name = "terraubuntu"
}

provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(local.pvtkeypath)
      host        = aws_instance.instance1.public_ip
    }
  }
provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.instance1.public_ip}, --private-key ${local.pvtkeypath} ansibleplaybooks/py.yml"
  }
provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.instance1.public_ip}, --private-key ${local.pvtkeypath} ansibleplaybooks/mysql.yml"
  }



provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.instance1.public_ip}, --private-key ${local.pvtkeypath} ansibleplaybooks/project.yml"
  }



}
