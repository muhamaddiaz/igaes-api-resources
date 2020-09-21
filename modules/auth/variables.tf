variable "stage" {
  description = "Stage for your development or production"
  default = "dev"
  type = string
}

variable "redirect_uri" {
  description = "Redirect URI when user validated"
  default = "http://localhost:3000/callback"
  type = string
}

variable "tags" {
  description = "Tags for your infrastructure"
  default = {}
  type = object({})
}
