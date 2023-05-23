data "aws_iam_policy_document" "ebs_csi_driver" {
  count = var.enabled ? 1 : 0

  statement {
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]
    resources = ["*"]
    effect    = "Allow"
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }

  statement {
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "ebs_csi_driver" {
  depends_on  = [var.mod_dependency]
  count       = var.enabled ? 1 : 0
  name        = "${var.cluster_name}-ebs-csi-driver"
  path        = "/"
  description = "Policy for the EBS CSI driver"

  policy = data.aws_iam_policy_document.ebs_csi_driver[0].json
}

# Role
data "aws_iam_policy_document" "ebs_csi_driver_assume" {
  count = var.enabled ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${var.namespace}:${var.service_account_name}",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "ebs_csi_driver" {
  count = var.enabled ? 1 : 0

  name               = "${var.cluster_name}-ebs-csi-driver"
  assume_role_policy = data.aws_iam_policy_document.ebs_csi_driver_assume[0].json
}

resource "aws_iam_role_policy_attachment" "ebs_csi_kms" {
  count = var.enabled ? 1 : 0

  role       = aws_iam_role.ebs_csi_driver[0].name
  policy_arn = aws_iam_policy.ebs_csi_driver[0].arn
}

resource "aws_iam_role_policy_attachment" "ebs_csi_driver" {
  count = var.enabled ? 1 : 0

  role       = aws_iam_role.ebs_csi_driver[0].name
  policy_arn = data.aws_iam_policy.ebs_csi[0].arn
}
