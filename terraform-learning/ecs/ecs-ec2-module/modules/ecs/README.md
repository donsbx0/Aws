## ECS

Configuration in this module creates the ECS cluster with provided Task defination via Container_defination.json file.

## Defining the Module in *main.tf*

```hcl

module "ecs" {
  source               = "/modules/ecs"
  ENV                  = "dev" # Product Environment
  VPC_NAME             = "fusion" # Product Name
  vpc_id               = "${module.main-vpc.vpc_id}"
  public-subnet-1      = "${module.main-vpc.public_subnets-1}"
  public-subnet-2      = "${module.main-vpc.public_subnets-2}"
  appname              = "ecs-demo" # Application Name
  min_size             = "1" # default 1, Minimum no of Instance node (ASG)
  max_size             = "4" # default 4, Maximum no of Instance node (ASG)
  desired_capacity     = "2" # default 2, number of Amazon EC2 instances that should be running
  keyname              = "ecskey"# key Name
  pubkey               = "ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # Public key
  instance_type        = "t2.micro" # default t2.micro
  applicationPort      = "80" # Application port no (for security group)
  target_group         = "${module.alb.tagetGroup}"
  container_name       = "demo-ecs-container" # Container Name
  container_port       = "80"
  ecs_task_family      = "nginx" # Task defination name
  container_definitions= "${file("container_definition.json")}"
  desired_count        = "2" # default 1
  launch_type          = "EC2" # valid values are EC2 and FARGATE, default is EC2
  iam_policy_name      = "ecs-policy"     #Policy Name
  iam_instance_profile = "ecs-profile"    # Instance profile Name
  iam_role             = "fusion-dev-ecs" # Role Name
}

```

## Directory Structure

- Development
  - main.tf
  - vars.tf
  - provider.tf
  - output.tf
- modules
  - vpc
  - bastion
- Production
  - main.tf
  - vars.tf
  - provider.tf
  - output.tf

## Usage

To run this main.tf you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply

```