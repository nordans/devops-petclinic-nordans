resource "aws_s3_bucket" "kopsstate" {
  bucket = "normankopsstate8768678"

  tags = {
    Name        = "kopsstate"
    Project     = "ProjectN"
  }
  
}
resource "aws_s3_bucket_versioning" "versioningbucket" {
    
bucket      = aws_s3_bucket.kopsstate.id
versioning_configuration {
    status = "Enabled"
  }
}
