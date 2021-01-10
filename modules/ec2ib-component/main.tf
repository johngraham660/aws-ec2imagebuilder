resource "aws_imagebuilder_component" "build_componment" {
  data                  = var.data
  name                  = var.name
  platform              = var.platform
  version               = var.version
  description           = var.description
  supported_os_versions = [ var.supported_os_versions ]
}