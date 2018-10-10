provider "aws" {
  access_key            = "${var.aws_access_key}"
  secret_key            = "${var.aws_secret_key}"
  allowed_account_ids   = ["560616450834"]
  region                = "${var.aws_region}"
}

provider "cloudflare" {
  email   = "srdan.dukic@gmail.com"
  token   = "${var.cloudflare_api_token}"
}

resource "aws_s3_bucket" "site" {
  bucket  = "${var.site_domain}"
  acl     = "public-read"
  policy  = "${file("policy.json")}"

  website {
    index_document  = "index.html"
    error_document  = "error.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["https://${var.site_domain}", "http://${var.site_domain}"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_object" "index_file" {
  bucket        = "${aws_s3_bucket.site.id}"
  key           = "index.html"
  source        = "index.html"
  content_type  = "text/html"
}

resource "cloudflare_record" "site_cname" {
  domain    = "${var.cloudflare_zone_id}"
  name      = "${var.site_domain}"
  value     = "${aws_s3_bucket.site.website_endpoint}"
  type      = "CNAME"
  ttl       = 3600
}
