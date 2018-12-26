variable "aws_access_key" {

}

variable "aws_secret_key" {

}

variable "aws_region" {
    type= "string"
    default = "us-east-1"

}
variable "sqs_queue_name" {
    default = "BookingInfoQueue"
}

variable "aws_plugin_version" {
    default = "~>1.54"
}