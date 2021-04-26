output "instance_ip" {
  description = "The public ip for ssh access"
  value       = aws_instance.instance1.public_ip
}

output "reflect"{
value=local.pvtkeypath
}
