variable "image_id" {
  default     = "ami-0be3f0371736d5394"
  type        = string
  description = "The id of het machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  } # test: terraform plan -var image_id="ame-1123123" -out plan

}
