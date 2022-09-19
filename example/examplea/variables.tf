variable "common_tags" {
  type = map(any)
  default = {
    Name = "Security-config"
  }
}

variable "name" {
  type = string
}
