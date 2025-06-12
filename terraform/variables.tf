variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "af-south-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "edson-resume-site-demo"  # change to your unique bucket name
}

variable "mime_types" {
  description = "Map of file extensions to MIME types"
  type        = map(string)
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".pdf"  = "application/pdf"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".gif"  = "image/gif"
  }
}

