#ariable "client_id" {
# type        = string
#
#
#ariable "client_secret" {
# type        = string
# sensitive   = true
#
#
#ariable "tenant_id" {
# type        = string
#
#
#ariable "subscription_id" {
# type        = string
#

variable "vm_name" {
  default = "iustinghitan"
  type = string
}

#variable "vm_password" {
#  sensitive = true
#  type = string
#}
#
variable "vm_count" {
  default = 2
}  
