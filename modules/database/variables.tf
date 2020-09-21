variable "stage" {
  description = "Stage for your development or production"
  default = "dev"
  type = string
}

variable "attendances_table_name" {
  description = "Table name for attendances"
  default = "attendances"
  type = string
}

variable "students_table_name" {
  description = "Table name for students"
  default = "students"
  type = string
}

variable "parents_table_name" {
  description = "Table name for parents"
  default = "parents"
  type = string
}

variable "teachers_table_name" {
  description = "Table name for teachers"
  default = "teachers"
  type = string
}

variable "schools_table_name" {
  description = "Table name for schools"
  default = "schools"
  type = string
}

variable "tags" {
  description = "Tags for your infrastructure"
  default = {}
  type = object({})
}
