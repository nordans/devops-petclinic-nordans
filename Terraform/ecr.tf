resource "aws_ecr_repository" "registrywet" {
  name                 = "wetimagesregistry"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}