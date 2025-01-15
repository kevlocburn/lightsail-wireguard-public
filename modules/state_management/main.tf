resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_ownership_controls" "terraform_state_ownership" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_policy" "terraform_state_policy" {
  bucket = aws_s3_bucket.terraform_state.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowTerraformUserAccess",
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::834447920541:user/terraform-user"
        },
        Action    = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource  = [
          "arn:aws:s3:::${aws_s3_bucket.terraform_state.id}",
          "arn:aws:s3:::${aws_s3_bucket.terraform_state.id}/*"
        ]
      }
    ]
  })
}

