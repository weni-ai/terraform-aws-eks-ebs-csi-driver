## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.13, < 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 1.0, < 3.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.9.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 1.10.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.13, < 5.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 1.0, < 3.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 1.10.0, < 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ebs_csi_kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.kubernetes_ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.kubernetes_ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [aws_iam_policy.ebs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ebs_csi_driver_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_identity_oidc_issuer"></a> [cluster\_identity\_oidc\_issuer](#input\_cluster\_identity\_oidc\_issuer) | The OIDC Identity issuer for the cluster. | `string` | n/a | yes |
| <a name="input_cluster_identity_oidc_issuer_arn"></a> [cluster\_identity\_oidc\_issuer\_arn](#input\_cluster\_identity\_oidc\_issuer\_arn) | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Whether to create k8s namespace with name defined by `namespace`. | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_helm_chart_name"></a> [helm\_chart\_name](#input\_helm\_chart\_name) | Amazon EBS CSI Driver chart name. | `string` | `"aws-ebs-csi-driver"` | no |
| <a name="input_helm_chart_release_name"></a> [helm\_chart\_release\_name](#input\_helm\_chart\_release\_name) | Amazon EBS CSI Driver release name. | `string` | `"aws-ebs-csi-driver"` | no |
| <a name="input_helm_chart_repo"></a> [helm\_chart\_repo](#input\_helm\_chart\_repo) | Amazon EBS CSI Driver repository name. | `string` | `"https://kubernetes-sigs.github.io/aws-ebs-csi-driver/"` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | Amazon EBS CSI Driver chart version. | `string` | `"2.19.0"` | no |
| <a name="input_mod_dependency"></a> [mod\_dependency](#input\_mod\_dependency) | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable. | `any` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace to deploy EBS CSI Driver Helm chart. | `string` | `"kube-system"` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Amazon EBS CSI Driver service account name. | `string` | `"aws-ebs-csi-driver"` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Additional settings which will be passed to the Helm chart values, see https://github.com/kubernetes-sigs/aws-ebs-csi-driver. | `map` | `{}` | no |

## Outputs

No outputs.
