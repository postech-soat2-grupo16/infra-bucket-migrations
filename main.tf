provider "aws" {
  region = var.aws_region
}

#Configuração do Terraform State
terraform {
  backend "s3" {
    bucket = "terraform-state-soat"
    key    = "infra-script-migration/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-state-soat-locking"
    encrypt        = true
  }
}

### New Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "migrations-script"

  tags = {
    Name  = "MigrationScripts"
    infra = "migration"
  }
}
