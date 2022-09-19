# terraform-aws-config

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-config/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-config)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-config.svg)](https://github.com/JamesWoolfenden/terraform-aws-config/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-config.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-config/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-config/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-config&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-config/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-config&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module to provision an AWS config.

---

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "config" {
  source     = "JamesWoolfenden/aws/config"
  name       = "aws-config"
  log_bucket = "config-logs"
  common_tags= var.common_tags
}
```

## Costs

```text
monthly cost estimate

Project: .

 Name                                                        Monthly Qty  Unit                Monthly Cost

 module.config.aws_config_config_rule.rule[0]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_config_rule.rule[1]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_config_rule.rule[2]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_config_rule.rule[3]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_config_rule.rule[4]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_config_rule.rule[5]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_config_rule.rule[6]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_config_rule.rule[7]
 └─ Rule evaluations (first 100K)                        Cost depends on usage: $0.001 per evaluations

 module.config.aws_config_configuration_recorder.config
 ├─ Config items                                         Cost depends on usage: $0.003 per records
 └─ Custom config items                                  Cost depends on usage: $0.003 per records

 module.config.aws_kms_key.s3
 ├─ Customer master key                                                1  months                     $1.00
 ├─ Requests                                             Cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests                     Cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests                     Cost depends on usage: $0.10 per 10k requests

 module.config.aws_s3_bucket.config
 ├─ Glacier
 │  ├─ Storage                                           Cost depends on usage: $0.0045 per GB-months
 │  ├─ PUT, COPY, POST, LIST requests                    Cost depends on usage: $0.03 per 1k requests
 │  ├─ GET, SELECT, and all other requests               Cost depends on usage: $0.00042 per 1k requests
 │  ├─ Lifecycle transition                              Cost depends on usage: $0.03 per 1k requests
 │  ├─ Retrieval requests (standard)                     Cost depends on usage: $0.03 per 1k requests
 │  ├─ Retrievals (standard)                             Cost depends on usage: $0.01 per GB-months
 │  ├─ Select data scanned (standard)                    Cost depends on usage: $0.0084 per GB-months
 │  ├─ Select data returned (standard)                   Cost depends on usage: $0.01 per GB-months
 │  ├─ Retrieval requests (expedited)                    Cost depends on usage: $10.50 per 1k requests
 │  ├─ Retrievals (expedited)                            Cost depends on usage: $0.03 per GB-months
 │  ├─ Select data scanned (expedited)                   Cost depends on usage: $0.02 per GB-months
 │  ├─ Select data returned (expedited)                  Cost depends on usage: $0.03 per GB-months
 │  ├─ Retrieval requests (bulk)                         Cost depends on usage: $0.03 per 1k requests
 │  ├─ Retrievals (bulk)                                 Cost depends on usage: $0.0026 per GB-months
 │  ├─ Select data scanned (bulk)                        Cost depends on usage: $0.00104 per GB-months
 │  ├─ Select data returned (bulk)                       Cost depends on usage: $0.0026 per GB-months
 │  └─ Early delete (within 90 days)                     Cost depends on usage: $0.0045 per GB-months
 └─ Standard
    ├─ Storage                                           Cost depends on usage: $0.02 per GB-months
    ├─ PUT, COPY, POST, LIST requests                    Cost depends on usage: $0.0053 per 1k requests
    ├─ GET, SELECT, and all other requests               Cost depends on usage: $0.00042 per 1k requests
    ├─ Select data scanned                               Cost depends on usage: $0.00225 per GB-months
    └─ Select data returned                              Cost depends on usage: $0.0008 per GB-months

 module.config.aws_sns_topic.config
 └─ Requests                                             Cost depends on usage: $0.50 per 1M requests

 PROJECT TOTAL                                                                                       $1.00
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_config_config_rule.rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_configuration_recorder.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_delivery_channel.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |
| [aws_iam_role.config_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_sns_topic.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A mapping of tags to assign to created resources | `map(any)` | n/a | yes |
| <a name="input_delivery_frequency"></a> [delivery\_frequency](#input\_delivery\_frequency) | The recurring frequency with which AWS Config delivers configuration snapshots. May be one of One\_Hour, Three\_Hours, Six\_Hours, Twelve\_Hours, or TwentyFour\_Hours | `string` | `"TwentyFour_Hours"` | no |
| <a name="input_enable_recorder"></a> [enable\_recorder](#input\_enable\_recorder) | Whether the configuration recorder should be enabled or disabled. | `string` | `true` | no |
| <a name="input_expiration"></a> [expiration](#input\_expiration) | The number of days to wait before expiring an object | `string` | `2555` | no |
| <a name="input_input_parameters"></a> [input\_parameters](#input\_input\_parameters) | A map of strings in JSON format that is passed to the AWS Config rule Lambda function. The map is keyed by the rule names. This is merged with a map contained in locals, with the values supplied here overriding any default values. | `map(any)` | <pre>{<br>  "iam-password-policy": "{
  \"RequireUppercaseCharacters\": \"true\",
  \"RequireLowercaseCharacters\": \"true\",
  \"RequireSymbols\": \"true\",
  \"RequireNumbers\": \"true\",
  \"MinimumPasswordLength\": \"30\",
  \"PasswordReusePrevention\": \"24\",
  \"MaxPasswordAge\": \"30\"
}
"<br>}</pre> | no |
| <a name="input_log_bucket"></a> [log\_bucket](#input\_log\_bucket) | The log bucket to write S3 logs to. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name to use when naming resources. | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | The list of rules to enable in AWS Config. The names are identical to the ones used by AWS. These are used to name the rules and to reference into the input\_parameters and source\_identifiers maps. The default is the minimum recommended list. | `list(any)` | <pre>[<br>  "cloudtrail-enabled",<br>  "iam-password-policy",<br>  "restricted-ssh",<br>  "root-account-mfa-enabled",<br>  "s3-bucket-logging-enabled",<br>  "s3-bucket-public-read-prohibited",<br>  "s3-bucket-public-write-prohibited",<br>  "s3-bucket-ssl-requests-only"<br>]</pre> | no |
| <a name="input_rules_count"></a> [rules\_count](#input\_rules\_count) | The count of the items in the rules list | `string` | `8` | no |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | This is a map of rule names to scope maps. Each scope can have one or both of the following tuples: (compliance\_resource\_id, compliance\_resource\_types), (tag\_key, tag\_value). This map is merged with a default map in locals, with the values in this map overriding the defaults. Defines which resources can trigger an evaluation for the rules. If you do not specify a scope, evaluations are triggered when any resource in the recording group changes. | `map(any)` | <pre>{<br>  "default": {<br>    "tag_key": "",<br>    "tag_value": ""<br>  }<br>}</pre> | no |
| <a name="input_source_identifiers"></a> [source\_identifiers](#input\_source\_identifiers) | A map of rule names to source identifiers. For AWS Config managed rules, a predefined identifier from a list. For example, IAM\_PASSWORD\_POLICY is a managed rule. This map will be merged with a default list in locals, with values in this list overriding those in locals | `map(any)` | <pre>{<br>  "acm-certificate-expiration-check": "ACM_CERTIFICATE_EXPIRATION_CHECK",<br>  "approved-amis-by-id": "APPROVED_AMIS_BY_ID",<br>  "approved-amis-by-tag": "APPROVED_AMIS_BY_TAG",<br>  "autoscaling-group-elb-healthcheck-required": "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED",<br>  "cloudformation-stack-notification-check": "CLOUDFORMATION_STACK_NOTIFICATION_CHECK",<br>  "cloudtrail-enabled": "CLOUD_TRAIL_ENABLED",<br>  "cloudwatch-alarm-action-check": "CLOUDWATCH_ALARM_ACTION_CHECK",<br>  "cloudwatch-alarm-resource-check": "CLOUDWATCH_ALARM_RESOURCE_CHECK",<br>  "cloudwatch-alarm-settings-check": "CLOUDWATCH_ALARM_SETTINGS_CHECK",<br>  "codebuild-project-envvar-awscred-check": "CODEBUILD_PROJECT_ENVVAR_AWSCRED_CHECK",<br>  "codebuild-project-source-repo-url-check": "CODEBUILD_PROJECT_SOURCE_REPO_URL_CHECK",<br>  "db-instance-backup-enabled": "DB_INSTANCE_BACKUP_ENABLED",<br>  "desired-instance-tenancy": "DESIRED_INSTANCE_TENANCY",<br>  "desired-instance-type": "DESIRED_INSTANCE_TYPE",<br>  "dynamodb-autoscaling-enabled": "DYNAMODB_AUTOSCALING_ENABLED",<br>  "dynamodb-throughput-limit-check": "DYNAMODB_THROUGHPUT_LIMIT_CHECK",<br>  "ebs-optimized-instance": "EBS_OPTIMIZED_INSTANCE",<br>  "ec2-instance-detailed-monitoring-enabled": "EC2_INSTANCE_DETAILED_MONITORING_ENABLED",<br>  "ec2-instance-managed-by-ssm": "EC2_INSTANCE_MANAGED_BY_SSM",<br>  "ec2-instances-in-vpc": "INSTANCES_IN_VPC",<br>  "ec2-managedinstance-applications-blacklisted": "EC2_MANAGEDINSTANCE_APPLICATIONS_BLACKLISTED",<br>  "ec2-managedinstance-applications-required": "EC2_MANAGEDINSTANCE_APPLICATIONS_REQUIRED",<br>  "ec2-managedinstance-association-compliance-status-check": "EC2_MANAGEDINSTANCE_ASSOCIATION_COMPLIANCE_STATUS_CHECK",<br>  "ec2-managedinstance-inventory-blacklisted": "EC2_MANAGEDINSTANCE_INVENTORY_BLACKLISTED",<br>  "ec2-managedinstance-patch-compliance-status-check": "EC2_MANAGEDINSTANCE_PATCH_COMPLIANCE_STATUS_CHECK",<br>  "ec2-managedinstance-platform-check": "EC2_MANAGEDINSTANCE_PLATFORM_CHECK",<br>  "ec2-volume-inuse-check": "EC2_VOLUME_INUSE_CHECK",<br>  "eip-attached": "EIP_ATTACHED",<br>  "elb-acm-certificate-required": "ELB_ACM_CERTIFICATE_REQUIRED",<br>  "elb-custom-security-policy-ssl-check": "ELB_CUSTOM_SECURITY_POLICY_SSL_CHECK",<br>  "elb-predefined-security-policy-ssl-check": "ELB_PREDEFINED_SECURITY_POLICY_SSL_CHECK",<br>  "encrypted-volumes": "ENCRYPTED_VOLUMES",<br>  "fms-webacl-resource-policy-check": "FMS_WEBACL_RESOURCE_POLICY_CHECK",<br>  "fms-webacl-rulegroup-association-check": "FMS_WEBACL_RULEGROUP_ASSOCIATION_CHECK",<br>  "guardduty-enabled-centralized": "GUARDDUTY_ENABLED_CENTRALIZED",<br>  "iam-group-has-users-check": "IAM_GROUP_HAS_USERS_CHECK",<br>  "iam-password-policy": "IAM_PASSWORD_POLICY",<br>  "iam-policy-blacklisted-check": "IAM_POLICY_BLACKLISTED_CHECK",<br>  "iam-user-group-membership-check": "IAM_USER_GROUP_MEMBERSHIP_CHECK",<br>  "iam-user-no-policies-check": "IAM_USER_NO_POLICIES_CHECK",<br>  "lambda-function-public-access-prohibited": "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED",<br>  "lambda-function-settings-check": "LAMBDA_FUNCTION_SETTINGS_CHECK",<br>  "rds-multi-az-support": "RDS_MULTI_AZ_SUPPORT",<br>  "rds-snapshots-public-prohibited": "RDS_SNAPSHOTS_PUBLIC_PROHIBITED",<br>  "rds-storage-encrypted": "RDS_STORAGE_ENCRYPTED",<br>  "redshift-cluster-configuration-check": "REDSHIFT_CLUSTER_CONFIGURATION_CHECK",<br>  "redshift-cluster-maintenancesettings-check": "REDSHIFT_CLUSTER_MAINTENANCESETTINGS_CHECK",<br>  "required-tags": "REQUIRED_TAGS",<br>  "restricted-common-ports": "RESTRICTED_INCOMING_TRAFFIC",<br>  "restricted-ssh": "INCOMING_SSH_DISABLED",<br>  "root-account-mfa-enabled": "ROOT_ACCOUNT_MFA_ENABLED",<br>  "s3-blacklisted-actions-prohibited": "S3_BLACKLISTED_ACTIONS_PROHIBITED",<br>  "s3-bucket-logging-enabled": "S3_BUCKET_LOGGING_ENABLED",<br>  "s3-bucket-policy-not-more-permissive": "S3_BUCKET_POLICY_NOT_MORE_PERMISSIVE",<br>  "s3-bucket-public-read-prohibited": "S3_BUCKET_PUBLIC_READ_PROHIBITED",<br>  "s3-bucket-public-write-prohibited": "S3_BUCKET_PUBLIC_WRITE_PROHIBITED",<br>  "s3-bucket-replication-enabled": "S3_BUCKET_REPLICATION_ENABLED",<br>  "s3-bucket-server-side-encryption-enabled": "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED",<br>  "s3-bucket-ssl-requests-only": "S3_BUCKET_SSL_REQUESTS_ONLY",<br>  "s3-bucket-versioning-enabled": "S3_BUCKET_VERSIONING_ENABLED"<br>}</pre> | no |
| <a name="input_transition_to_glacier"></a> [transition\_to\_glacier](#input\_transition\_to\_glacier) | The number of days to wait before transitioning an object to Glacier | `string` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The bucket name that config writes output to. |
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The bucket ARN that config writes output to. |
| <a name="output_delivery_channel_id"></a> [delivery\_channel\_id](#output\_delivery\_channel\_id) | The name of the delivery channel. |
| <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key) | n/a |
| <a name="output_recorder_id"></a> [recorder\_id](#output\_recorder\_id) | Name of the recorder. |
| <a name="output_rule_arns"></a> [rule\_arns](#output\_rule\_arns) | The ARNs of the config rules |
| <a name="output_rule_ids"></a> [rule\_ids](#output\_rule\_ids) | The IDs of the config rules |
| <a name="output_topic_arn"></a> [topic\_arn](#output\_topic\_arn) | The ARN of the SNS topic AWS Config writes events to. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "SNS:CreateTopic",
                "SNS:DeleteTopic",
                "SNS:GetTopicAttributes",
                "SNS:ListTagsForResource",
                "SNS:SetTopicAttributes",
                "SNS:TagResource",
                "SNS:UnTagResource"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "config:DeleteConfigRule",
                "config:DeleteConfigurationRecorder",
                "config:DeleteDeliveryChannel",
                "config:DescribeConfigRules",
                "config:DescribeConfigurationRecorderStatus",
                "config:DescribeConfigurationRecorders",
                "config:DescribeDeliveryChannels",
                "config:ListTagsForResource",
                "config:PutConfigRule",
                "config:PutConfigurationRecorder",
                "config:PutDeliveryChannel",
                "config:StartConfigurationRecorder",
                "config:StopConfigurationRecorder",
                "config:TagResource",
                "config:UntagResource"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeAccountAttributes"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "iam:AttachRolePolicy",
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:DeleteRolePolicy",
                "iam:DetachRolePolicy",
                "iam:GetRole",
                "iam:GetRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRolePolicies",
                "iam:PassRole",
                "iam:PutRolePolicy",
                "iam:TagRole"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor4",
            "Effect": "Allow",
            "Action": [
                "kms:CreateKey",
                "kms:DescribeKey",
                "kms:EnableKeyRotation",
                "kms:GetKeyPolicy",
                "kms:GetKeyRotationStatus",
                "kms:ListResourceTags",
                "kms:ScheduleKeyDeletion",
                "kms:TagResource",
                "kms:UntagResource"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor5",
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketAcl",
                "s3:GetBucketCORS",
                "s3:GetBucketLogging",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetBucketPolicy",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetBucketRequestPayment",
                "s3:GetBucketTagging",
                "s3:GetBucketVersioning",
                "s3:GetBucketWebsite",
                "s3:GetEncryptionConfiguration",
                "s3:GetLifecycleConfiguration",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:GetReplicationConfiguration",
                "s3:ListBucket",
                "s3:PutBucketPolicy",
                "s3:PutBucketPublicAccessBlock"
            ],
            "Resource": "*"
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-config/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-config/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
