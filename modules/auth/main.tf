resource "aws_cognito_user_pool" "igaes_user_pool" {
  name = "${var.stage}-igaes-user-pool"
  password_policy {
    minimum_length = 8
    require_lowercase = true
    require_uppercase = true
    require_numbers = true
    temporary_password_validity_days = 7
  }
  username_attributes = [
    "email"
  ]
  auto_verified_attributes = [
    "email"
  ]
  schema {
    attribute_data_type = "String"
    name = "accountId"
    mutable = true
    string_attribute_constraints {
      min_length = "1"
      max_length = "255"
    }
  }
  schema {
    attribute_data_type = "String"
    name = "accountType"
    mutable = true
    string_attribute_constraints {
      min_length = "1"
      max_length = "255"
    }
  }
  tags = var.tags
}

resource "aws_cognito_user_pool_client" "igaes_user_client" {
  name = "${var.stage}-igaes-user-client"
  user_pool_id = aws_cognito_user_pool.igaes_user_pool.id
  supported_identity_providers = [
    "COGNITO"
  ]
  callback_urls = [
    "http://localhost/callback",
    "http://localhost:3000/callback"
  ]
  default_redirect_uri = var.redirect_uri
  generate_secret = false
  explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]
  allowed_oauth_flows = [
    "code",
    "implicit"
  ]
  allowed_oauth_scopes = [
    "email", "openid"
  ]
}

resource "aws_cognito_identity_pool" "igaes_identity_pool" {
  identity_pool_name = "${var.stage}IgaesIdentityPool"
  allow_unauthenticated_identities = false
  cognito_identity_providers {
    client_id = aws_cognito_user_pool_client.igaes_user_client.id
    provider_name = aws_cognito_user_pool.igaes_user_pool.endpoint
  }
  tags = var.tags
}

resource "aws_iam_role" "authenticated_cognito_role" {
  name = "authenticated_cognito_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "cognito-identity.amazonaws.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.igaes_identity_pool.id}"
        },
        "ForAnyValue:StringLike": {
          "cognito-identity.amazonaws.com:amr": "authenticated"
        }
      }
    }
  ]
}
EOF
  tags = var.tags
}

resource "aws_iam_role_policy" "authenticated_cognito_policy" {
  name = "authenticated_cognito_policy"
  role = aws_iam_role.authenticated_cognito_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "mobileanalytics:PutEvents",
        "cognito-sync:*",
        "cognito-identity:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
  depends_on = [
    aws_iam_role.authenticated_cognito_role
  ]
}

resource "aws_cognito_identity_pool_roles_attachment" "igaes_identity_pool_roles_attachment" {
  identity_pool_id = aws_cognito_identity_pool.igaes_identity_pool.id
  roles = {
    "authenticated" = aws_iam_role.authenticated_cognito_role.arn
  }
  depends_on = [
    aws_cognito_identity_pool.igaes_identity_pool,
    aws_iam_role_policy.authenticated_cognito_policy
  ]
}

resource "aws_cognito_user_pool_domain" "igaes_user_pool_domain" {
  domain = "${var.stage}-igaes"
  user_pool_id = aws_cognito_user_pool.igaes_user_pool.id
  depends_on = [
    aws_cognito_user_pool.igaes_user_pool
  ]
}
