
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "af-south-1"
}

variable "bucket_name" {
  description = "S3 bucket name"
  default     = "edson-resume-site-demo"  # 🔁 make this unique globally
}

variable "mime_types" {
  description = "MIME types for files"
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".pdf"  = "application/pdf"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
  }
}
