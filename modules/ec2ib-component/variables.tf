variable "name" {
    description = "The name of the build component"
    type        = string
    default     = "RHEL7_OS_update"
}

variable "platform" {
    description = "The OS platform"
    type        = string
    default     = "Linux"
}

variable "supported_os_versions" {
    description = "The supported os versions for the build or test component"
    type        = string
    default     = "Red Hat Enterprise Linux 7"
}
