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
  name = var.example_app_name
  region = "eu"
  stack = "container"
}



# Build code & release to the app
resource "heroku_build" "example" {
  app = heroku_app.example.name

  source {
    url = "https://github.com/PerfectFit-project/perfect-fit-heroku-test/archive/refs/tags/v0.1.tar.gz"
    version = "0.1"
  }
}
