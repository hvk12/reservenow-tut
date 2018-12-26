resource "aws_sqs_queue" "terrafor_sqs_queue" {
 name = "${var.sqs_queue_name}"
 fifo_queue= "false" #This is optional field, if not specified its std queue
 

}