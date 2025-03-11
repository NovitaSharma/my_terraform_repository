# In your Terraform configuration file (e.g., main.tf), define the remote backend.
terraform {
  backend "s3" {
    bucket         = "novita-terraform-state-bucket"
    key            = "novita/terraform.tfstate"
    region         = "us-west-2"
    lock_table     = "terraform_lock"
  }
}
