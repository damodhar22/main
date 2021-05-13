
provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudwatch_log_group" "LoGroup" {
  retention_in_days = "${var.RetentionPeriod}"
}

variable "region" {
  description = "AWS region to use"
  default = "us-east-1"
}

variable "RetentionPeriod" {
  description = "Number of days to retain the LogGroup"
}

output "LoGroupName" {
  value = "${aws_cloudwatch_log_group.LoGroup.name}"
}