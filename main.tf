terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "igaes"

    workspaces {
      prefix = "igaes-"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region = var.region
}

module "igaes_database_tables" {
  source = "./modules/database"
  stage = var.stage
  tags = {
    Owner = "infra"
    Project = "igaes"
    Stage = "${var.stage}-igaes"
    Terraform = true
    Type = "database-table"
  }
}

module "igaes_auth" {
  source = "./modules/auth"
  stage = var.stage
  tags = {
    Owner = "infra"
    Project = "igaes"
    Stage = "${var.stage}-igaes"
    Terraform = true
    Type = "auth"
  }
}

module "igaes_bucket" {
  source = "./modules/bucket"
  stage = var.stage
  tags = {
    Owner = "infra"
    Project = "igaes"
    Stage = "${var.stage}-igaes"
    Terraform = true
    Type = "bucket"
  }
}
