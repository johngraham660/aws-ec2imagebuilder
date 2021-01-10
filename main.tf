# ----------------------------------------------------------------------------------------------------
# DEPLOY AN EC2IMAGEBUILDER PIPELINE IN AWS
# This will deploy an EC2ImageBuilder pipeline in AWS that creates a standardised Amazon Machine Image
# ----------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
}

provider "aws" {
  region = var.aws_region
}

module "ec2imagebuilder_ec2ib-component" {
  source  = "johngraham660/ec2imagebuilder/aws//modules/ec2ib-component"
  version = "0.0.1"

  #name = "RHEL7_OS-Update"
  #platform = "Linux"
  #description = "Updates the base RHEL image from Redhat Update Infrastructure (RHUI)"
  #supported_os_version = "Red Hat Enterprise Linux 7"
}
