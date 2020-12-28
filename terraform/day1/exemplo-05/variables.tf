variable "image_id" {
    default = ""
    type = string
    description = "The id of het machine image (AMI) to use for the server."

    validation {
        condition = length(var.image_id) >  4 && substr(var.image_id, 0,4) == "ami-"
        erroerror_message = "The image_id value must be a valid AMI "        
    }
  
}