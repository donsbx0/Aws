terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

# Khởi tạo bucket với tên là sub_domain.root_domain (demo.codestar-s3-web-0000)

resource "aws_s3_bucket" "demo" {
  bucket = "${var.sub_domain}.${var.root_domain}"
}

# Enable chế độ website cho s3

resource "aws_s3_bucket_website_configuration" "demo" {
    bucket = aws_s3_bucket.demo.id 
    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
    
}

# Change quyền từ private sang public cho bucket

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.demo.id
  acl    = "public-read"
}

# Upload file từ thư mục html lên s3 bucket aws_s3_bucket.demo.id

resource "aws_s3_object" "upload_object"{
    for_each = fileset("html/", "*")
    bucket = aws_s3_bucket.demo.id
    key = each.value
    source = "html/${each.value}"
    etag = filemd5("html/${each.value}")
    content_type = "text/html"
}

# Khai báo s3 policy

resource "aws_s3_bucket_policy" "read_access_policy" {
  bucket = aws_s3_bucket.demo.id

  policy = <<POLICY
{
	"Version": "2012-10-17",
	"Id": "Policy1668780341178",
	"Statement": [
		{
			"Sid": "Stmt1668780338187",
			"Effect": "Allow",
			"Principal": "*",
			"Action": "s3:GetObject",
			"Resource": "arn:aws:s3:::${aws_s3_bucket.demo.id}/*"
		}
	]
}
POLICY
}


