variable "region" {
  type        = string
  description = "default region in this project"
  default     = "europe-north1"
}

variable "zones" {
  type        = list(string)
  description = "list of zones for this project"
  default     = ["europe-north1-a", "europe-north1-b"]
}

variable "project_id" {
  type        = string
  description = "project id"
  default     = "tf-demo-gcp"
}

variable "vm_count" {
  type        = number
  description = "number of VM to create"
  default     = 2
}

variable "vpc-subnet-cidr-block" {
  type        = list(string)
  description = "Cidr blocks for public subnets"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}