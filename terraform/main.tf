provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "s3_devel_bucket" {
  bucket = "challenge-devel-bucket-2345345345"
}

resource "aws_s3_bucket_ownership_controls" "s3_devel_bucket_ownership" {
  bucket = aws_s3_bucket.s3_devel_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_devel_bucket_access" {
  bucket = aws_s3_bucket.s3_devel_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_devel_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_devel_bucket_ownership,
    aws_s3_bucket_public_access_block.s3_devel_bucket_access,
  ]

  bucket = aws_s3_bucket.s3_devel_bucket.id
  acl    = "public-read"
}


resource "aws_s3_bucket" "s3_stage_bucket" {
  bucket = "challenge-stage-bucket-2345345345"
}

resource "aws_s3_bucket_ownership_controls" "s3_stage_bucket_ownership" {
  bucket = aws_s3_bucket.s3_stage_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_stage_bucket_access" {
  bucket = aws_s3_bucket.s3_stage_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_stage_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_stage_bucket_ownership,
    aws_s3_bucket_public_access_block.s3_stage_bucket_access,
  ]

  bucket = aws_s3_bucket.s3_stage_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket" "s3_prod_bucket" {
  bucket = "challenge-prod-bucket-2345345345"
}

resource "aws_s3_bucket_ownership_controls" "s3_prod_bucket_ownership" {
  bucket = aws_s3_bucket.s3_prod_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_prod_bucket_access" {
  bucket = aws_s3_bucket.s3_prod_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_prod_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_prod_bucket_ownership,
    aws_s3_bucket_public_access_block.s3_prod_bucket_access,
  ]

  bucket = aws_s3_bucket.s3_prod_bucket.id
  acl    = "public-read"
}