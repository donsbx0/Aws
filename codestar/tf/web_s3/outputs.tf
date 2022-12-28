# Hiển thị link website cuối cùng sau khi apply
output "s3_bucket_id" {
  value = aws_s3_bucket_website_configuration.demo.website_endpoint
}