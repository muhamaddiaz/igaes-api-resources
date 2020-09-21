variable "stage" {
  description = "Stage for your development or production"
  default = "dev"
  type = string
}

variable "tags" {
  description = "Tags for your infrastructure"
  default = {}
  type = object({})
}
