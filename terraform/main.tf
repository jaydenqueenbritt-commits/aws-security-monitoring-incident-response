
data "aws_caller_identity" "current" {}

# Create a private S3 bucket for CloudTrail logs
resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = "aws-security-lab-cloudtrail-${data.aws_caller_identity.current.account_id}-us-east-1"

  force_destroy = false

  tags = {
    Name        = "AWS Security Lab CloudTrail Logs"
    Project     = "AWS Security Monitoring"
    Environment = "Lab"
  }
}

# Block all public access to the bucket
resource "aws_s3_bucket_public_access_block" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Encrypt stored logs using S3-managed encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Allow CloudTrail to deliver logs to S3
data "aws_region" "current" {}

resource "aws_cloudtrail" "security_lab" {
  name                          = "aws-security-lab-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  enable_log_file_validation    = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }

  tags = {
    Name    = "AWS Security Lab Trail"
    Project = "AWS Security Monitoring"
  }

  depends_on = [
    aws_s3_bucket_policy.cloudtrail
  ]
}

# Grant CloudTrail permission to write logs
resource "aws_s3_bucket_policy" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action   = "s3:GetBucketAcl"
        Resource = aws_s3_bucket.cloudtrail_logs.arn

        Condition = {
          StringEquals = {
            "aws:SourceArn" = "arn:aws:cloudtrail:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:trail/aws-security-lab-trail"
          }
        }
      },
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action = "s3:PutObject"

        Resource = "${aws_s3_bucket.cloudtrail_logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"

        Condition = {
          StringEquals = {
            "s3:x-amz-acl"  = "bucket-owner-full-control"
            "aws:SourceArn" = "arn:aws:cloudtrail:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:trail/aws-security-lab-trail"
          }
        }
      }
    ]
  })
}

# Automatically expire logs after 30 days
resource "aws_s3_bucket_lifecycle_configuration" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  rule {
    id     = "expire-cloudtrail-logs"
    status = "Enabled"

    filter {}

    expiration {
      days = 30
    }
  }
}

# Display the CloudTrail name
output "cloudtrail_name" {
  value = aws_cloudtrail.security_lab.name
}

# Display the S3 logging bucket
output "cloudtrail_bucket" {
  value = aws_s3_bucket.cloudtrail_logs.bucket
}
