# Provisions an app with name to be provided as argument to terraform apply
# e.g.
# terraform apply -var example_app_name=perfect-fit-heroku-test
#
#

terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 4.0"
    }
  }
}

variable "example_app_name" {
  description = "Name of the Heroku app provisioned as an example"
}

resource "heroku_app" "example" {
  name   = var.example_app_name
  region = "eu"
}
