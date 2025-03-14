resource "aws_cloudfront_distribution" "my_distribution" {
  aliases             = ["resume.helipatel.com"]
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  staging             = false
  wait_for_deployment = true
  web_acl_id          = null

  tags = {
    project = "cloud resume challenge"
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    default_ttl     = 0
    max_ttl         = 0
    min_ttl         = 0
    target_origin_id = "cloud-resume-challenge-bucket1.s3.us-east-1.amazonaws.com"
    viewer_protocol_policy = "https-only"
  }

  origin {
    connection_attempts      = 3
    connection_timeout       = 10
    domain_name              = "cloud-resume-challenge-bucket1.s3.us-east-1.amazonaws.com"
    origin_access_control_id = "E2R215R6GBF803"
    origin_id                = "cloud-resume-challenge-bucket1.s3.us-east-1.amazonaws.com"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:183631323298:certificate/7fbc1424-d699-4840-9828-08fbeb05d9e2"
    cloudfront_default_certificate = false
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}
