variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "location" {
  type        = string
  description = "The location of the resources"
}

variable "name" {
  type        = string
  description = "The canonical name to use for the resources"
}

variable "queues" {
  type        = set(string)
  description = "The names of a set of queues to create"
}

variable "cost_center" {
  type        = string
  description = "The human-readable cost center name"
}

variable "product_name" {
  type        = string
  description = "The human-readable product name"
}
