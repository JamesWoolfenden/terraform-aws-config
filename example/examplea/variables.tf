variable "common_tags" {
  type = map
  default = {
    Name = "Security-config"
  }
}

variable "name" {
  type = string
}

variable "log_bucket" {
  type = string
}
