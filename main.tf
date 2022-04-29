terraform {
  required_version = ">= 0.12.26"
}

# website::tag::1:: The simplest possible Terraform module: it just outputs "Hello, World!"
output "hello_world" {
  value = var.greeting
}

module "role_ecs_task_exec" {
  source              = "github.com/cloudposse/terraform-aws-iam-role.git?ref=0.16.2"
  enabled             = true
  context             = module.sw-services-iam-label
  role_description    = module.sw-services-iam-label.id
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
}

module "role_ecs_task" {
  source           = "github.com/cloudposse/terraform-aws-iam-role.git?ref=0.16.2"
  enabled          = true
  context          = module.sw-services-iam-label
  role_description = module.sw-services-iam-label.id
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSESFullAccess"
  ]
}
