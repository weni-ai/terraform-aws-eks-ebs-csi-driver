variable "enabled" {
  type    = bool
  default = true
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster."
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account."
}

variable "helm_chart_name" {
  type        = string
  default     = "aws-ebs-csi-driver"
  description = "Amazon EBS CSI Driver chart name."
}

variable "helm_chart_release_name" {
  type        = string
  default     = "aws-ebs-csi-driver"
  description = "Amazon EBS CSI Driver release name."
}

variable "helm_chart_repo" {
  type        = string
  default     = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver/"
  description = "Amazon EBS CSI Driver repository name."
}

variable "helm_chart_version" {
  type        = string
  default     = "2.19.0"
  description = "Amazon EBS CSI Driver chart version."
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create k8s namespace with name defined by `namespace`."
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "Kubernetes namespace to deploy EBS CSI Driver Helm chart."
}

variable "service_account_name" {
  type        = string
  default     = "aws-ebs-csi-driver"
  description = "Amazon EBS CSI Driver service account name."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "settings" {
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://github.com/kubernetes-sigs/aws-ebs-csi-driver."
}

