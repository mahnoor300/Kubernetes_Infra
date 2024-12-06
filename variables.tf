# Define variables
variable "resource_group_name" {
  type =  string
}

variable "resource_group_location" {
  type = string  
}


variable "aks_name" {
    type = string
}

variable "dns_prefix" {
    type = string
  
}
variable "nodepool_name" {
  type = string
}

variable "acr_name" {
    type = string
  
}

