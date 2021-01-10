# ----------------------------------------------------------------------------------------------------
# DEPLOY AN EC2IMAGEBUILDER PIPELINE IN AWS
# This will deploy an EC2ImageBuilder pipeline in AWS that creates a standardised Amazon Machine Image
# ----------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
}


module "ec2ib-component" {
  # source = "git::git@github.com:johngraham660/aws-ec2imagebuilder.git//modules/ec2ib-component?ref=v0.0.1"
  source = "git::git@github.com:johngraham660/aws-ec2imagebuilder.git//modules/ec2ib-component?ref=development"

  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
  name = "RHEL7_OS_Update"
  platform = "Linux"
  version = "0.0.1"
  description = "Updates the base rhel image to the latest patch release provided by RHUI"
}

