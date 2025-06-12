
output "website_url" {
  description = "URL of the deployed S3 static site"
  value       = aws_s3_bucket_website_configuration.resume_site.website_endpoint
}
