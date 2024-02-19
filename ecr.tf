resource "aws_ecr_repository" "tc-poc" {
  name = "tc-poc"
  image_tag_mutability = "MUTABLE"  
}

output "repository_url" {
  value = aws_ecr_repository.tc-poc.repository_url
}
