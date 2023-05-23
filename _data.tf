data "aws_iam_policy" "ebs_csi" {
  count = var.enabled ? 1 : 0

  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
