
variable "key_name" {
  type = string
  default = "ohio"
}



variable "key_path" {
  type = string
  default = "~/.ssh/"
}



variable "user" {
  type = string
  default = "ubuntu"
}




variable "ami_id" {
  type = string
  default = "ami-0c55b159cbfafe1f0"
}



variable "evaluate_target_health" {
  type = bool
  default = false
}


variable "parent_zone_id" {
  type = string
  default = "Z17A719MQ1QIZJ"
}

