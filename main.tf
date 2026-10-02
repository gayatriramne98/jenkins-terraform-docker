terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "hello" {
  name = "hello-world:latest"
}

resource "docker_container" "hello" {
  name      = "hello-from-terraform"
  image     = docker_image.hello.image_id
  must_run  = false
  attach    = true
  logs      = true
}

output "container_logs" {
  value = docker_container.hello.container_logs
}
