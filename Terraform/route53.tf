resource "aws_route53_zone" "k8s_zone" {
  name = "petclinic.normandev.xyz"

  tags = {
    Name    = "petclinic-subdomain-zone"
    Project = "ProjectN"
  }
}
