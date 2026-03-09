variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "unleash-devops-home-exercise"
}

variable "container_image" {
  description = "Full ECR image URI including tag"
  type        = string
  default     = "532150070616.dkr.ecr.us-east-1.amazonaws.com/unleash-devops-home-exercise:latest"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 3000
}

variable "task_cpu" {
  description = "Fargate task CPU units (256 = 0.25 vCPU)"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Fargate task memory in MiB"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}

variable "s3_bucket_name" {
  description = "Name for the S3 bucket the app checks files against"
  type        = string
  default     = "unleash-devops-home-exercise-app-bucket"
}

variable "my_ip" {
  type        = string
  default     = "0.0.0.0/0"
}