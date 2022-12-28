variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "us-east-1"
}

# Khai báo tên bucket , trường này tồn tại duy nhất trên aws nên không được trùng so với người khác

variable "root_domain" {
    default = "codestar-s3-web-0000"
}

# Optional - khai báo thêm sub_domain cho tên bucket
variable "sub_domain" {
    default = "demo"
}