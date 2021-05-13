
provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudwatch_log_group" "LoGroup" {
  depends_on = ["aws_cloudwatch_log_group.LoGroupTest"]
  retention_in_days = "${var.RetentionPeriod}"
}

resource "aws_cloudwatch_log_group" "LoGroupTest" {
  name = var.Name
  retention_in_days = "1"
}

variable "region" {
  description = "AWS region to use"
  default = "us-east-1"
}

variable "RetentionPeriod" {
  description = "Number of days to retain the LogGroup"
}

variable "Name" {
  description = "Name of log group"
}

output "LoGroupName" {
  value = "${aws_cloudwatch_log_group.LoGroup.name}"
}