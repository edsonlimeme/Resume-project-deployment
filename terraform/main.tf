provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "resume_site" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "resume_site" {
  bucket = aws_s3_bucket.resume_site.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "resume_site" {
  bucket = aws_s3_bucket.resume_site.id

  block_public_acls   = false
  block_public_policy = false
  restrict_public_buckets = false
  ignore_public_acls = false
}

resource "aws_s3_bucket_policy" "resume_site" {
  bucket = aws_s3_bucket.resume_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.resume_site.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "website_files" {
  for_each = fileset("${path.module}/../resume-site", "**/*.*")

  bucket       = aws_s3_bucket.resume_site.id
  key          = each.key
  source       = "${path.module}/../resume-site/${each.key}"
  content_type = lookup(var.mime_types, regex("\\.[^.]+$", each.key), "text/plain")
  etag         = filemd5("${path.module}/../resume-site/${each.key}")
}
