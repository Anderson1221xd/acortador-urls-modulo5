variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  description = "Nombre del bucket S3 para el frontend"
  default     = "url-shortener-main-form-anderson-final-2026" 
}