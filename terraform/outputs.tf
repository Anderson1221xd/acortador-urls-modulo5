output "form_frontend_url" {
  value       = "http://${aws_s3_bucket_website_configuration.web_config.website_endpoint}"
  description = "URL principal para que los usuarios acorten sus links"
}