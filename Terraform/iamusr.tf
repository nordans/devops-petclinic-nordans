resource "aws_iam_role" "kops_nodes_role" {
  name = "kops-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name    = "kops-nodes-role"
    Project = "ProjectN"
  }
}
# Dostęp do ECR (Docker Registry)
resource "aws_iam_role_policy_attachment" "ecr_access" {
  role       = aws_iam_role.kops_nodes_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Dostęp do S3 (dla Kops State Store i ew. assetów)
resource "aws_iam_role_policy_attachment" "s3_access" {
  role       = aws_iam_role.kops_nodes_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
resource "aws_iam_instance_profile" "kops_nodes_profile" {
  name = "kops-nodes-profile"
  role = aws_iam_role.kops_nodes_role.name
}
