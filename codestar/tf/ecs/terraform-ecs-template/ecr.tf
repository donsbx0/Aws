# ecr.tf | Elastic Container Repository

#Khởi tạo 1 repo mới trên ECR để lưu image
resource "aws_ecr_repository" "aws-ecr" {
  name = "${var.app_name}-${var.app_environment}-ecr"
  tags = {
    Name        = "${var.app_name}-ecr"
    Environment = var.app_environment
  }
}
