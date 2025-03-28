output "instance_public_ip" {
  value = aws_instance.petclinic_ec2.public_ip
}
