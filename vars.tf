variable "site_domain" {
  type        = "string"
  description = "The domain name to use for the static site"
  default     = "srdan.nz"
}

variable "aws_region" {
  type        = "string"
  description = "The AWS region to put the bucket into"
  default     = "ap-southeast-2"
}

variable "cloudflare_zone_id" {
  type        = "string"
  description = "The ID of the zone that we are adding the site CNAME record to"
  default     = "srdan.nz"
}

variable "aws_access_key" {
  type        = "string"
  description = "The access key ID for AWS"
}

variable "aws_secret_key" {
  type        = "string"
  description = "The secret API key for AWS"
}

variable "cloudflare_api_token" {
  type        = "string"
  description = "The API key for the CloudFlare account"
}
