variable "project_name" {
  type = string
  description = "project_name"
  #default = "Hash"
}
variable "project_env" {
  type = string
  description = "project_env"
  #default = "dev"
}

variable "instance_ami" {
  type        = string
  description = "ami id of the instance"
  #default     = "ami-02e94b011299ef128"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  #default     = "t2.micro"
}

variable "region" {
  type        = string
  description = "region "
  #default     = "ap-south-1"
}
locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
  image-name      = "${var.project_name}-${var.project_env}-${local.image-timestamp}"
}
