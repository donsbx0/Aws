1. update in main.tf file:  input your bucket name to `` bucket = "<your bucket name>" ``
2. update in terraform.tfvars:
`` aws_region        = "<your region>" ``
`` aws_access_key    = "<your access key>" ``
`` aws_secret_key    = "<your secret key>" ``
`` aws_key_pair_name = "<your key pair name>" ``

3. RUN command:
`` terraform init ``
`` terraform plan ``
`` terraform apply ``
`` terraform destroy ``