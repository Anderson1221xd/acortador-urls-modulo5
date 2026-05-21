output "form_frontend_url" {
  value       = "http://${aws_s3_bucket_website_configuration.web_config.website_endpoint}"
  description = "URL principal para que los usuarios acorten sus links"
}

output "cloudfront_url" {
  description = "URL segura de CloudFront para el Frontend del Módulo 5"
  value       = "https://${aws_cloudfront_distribution.frontend_distribution.domain_name}"
}