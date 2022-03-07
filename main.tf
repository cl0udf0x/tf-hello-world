variable "greeting" {
    description = "Greetings variable"
    type = string
    default = "dummy"
}

terraform {
  required_version = ">= 0.12.26"
}

# website::tag::1:: The simplest possible Terraform module: it just outputs "Hello, World!"
output "hello_world" {
  value = var.greeting
}