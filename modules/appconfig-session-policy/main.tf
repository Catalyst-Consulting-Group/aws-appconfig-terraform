data "aws_region" "current" {}
data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "this" {
  name        = var.name
  description = var.description
  policy      = data.aws_iam_policy_document.this.json

  tags = var.tags
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "appconfig:StartConfigurationSession",
      "appconfig:GetLatestConfiguration",
    ]

    resources = [
      format(
        "arn:%s:appconfig:%s:%s:application/%s/environment/%s/configuration/%s",
        data.aws_partition.current.id,
        data.aws_region.current.id,
        data.aws_caller_identity.current.account_id,
        var.application_id,
        var.environment_id,
        var.configuration_profile_id,
      )
    ]
  }
}
