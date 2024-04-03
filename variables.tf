# Input Variables
# AWS Region

variable "aws_region" {
  type        = string
  description = "default Canadian region"
  default = "ca-central-1"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "RBC"
}