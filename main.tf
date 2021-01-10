# ----------------------------------------------------------------------------------------------------
# DEPLOY AN EC2IMAGEBUILDER PIPELINE IN AWS
# This will deploy an EC2ImageBuilder pipeline in AWS that creates a standardised Amazon Machine Image
# ----------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
}


module "ec2ib-component" {
  source = "https://gitlab.com/virtua-galaxy/terraform/ec2ib-component.git"

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

