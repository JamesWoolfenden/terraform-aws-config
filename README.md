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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | A mapping of tags to assign to created resources | `map` | n/a | yes |
| delivery\_frequency | The recurring frequency with which AWS Config delivers configuration snapshots. May be one of One\_Hour, Three\_Hours, Six\_Hours, Twelve\_Hours, or TwentyFour\_Hours | `string` | `"TwentyFour_Hours"` | no |
| enable\_recorder | Whether the configuration recorder should be enabled or disabled. | `string` | `true` | no |
| expiration | The number of days to wait before expiring an object | `string` | `2555` | no |
| input\_parameters | A map of strings in JSON format that is passed to the AWS Config rule Lambda function. The map is keyed by the rule names. This is merged with a map contained in locals, with the values supplied here overriding any default values. | `map` | <pre>{<br>  "iam-password-policy": "{
  \"RequireUppercaseCharacters\": \"true\",
  \"RequireLowercaseCharacters\": \"true\",
  \"RequireSymbols\": \"true\",
  \"RequireNumbers\": \"true\",
  \"MinimumPasswordLength\": \"30\",
  \"PasswordReusePrevention\": \"24\",
  \"MaxPasswordAge\": \"30\"
}
"<br>}</pre> | no |
| log\_bucket | The log bucket to write S3 logs to. | `string` | n/a | yes |
| name | The name to use when naming resources. | `string` | n/a | yes |
| rules | The list of rules to enable in AWS Config. The names are identical to the ones used by AWS. These are used to name the rules and to refence into the input\_parameters and source\_idenitifers maps. The default is the minimum recommended list. | `list` | <pre>[<br>  "cloudtrail-enabled",<br>  "iam-password-policy",<br>  "restricted-ssh",<br>  "root-account-mfa-enabled",<br>  "s3-bucket-logging-enabled",<br>  "s3-bucket-public-read-prohibited",<br>  "s3-bucket-public-write-prohibited",<br>  "s3-bucket-ssl-requests-only"<br>]</pre> | no |
| rules\_count | The count of the items in the rules list | `string` | `8` | no |
| scopes | This is a map of rule names to scope maps. Each scope can have one or both of the following tuples: (compliance\_resource\_id, compliance\_resource\_types), (tag\_key, tag\_value). This map is merged with a default map in locals, with the values in this map overriding the defaults. Defines which resources can trigger an evaluation for the rules. If you do not specify a scope, evaluations are triggered when any resource in the recording group changes. | `map` | <pre>{<br>  "default": {<br>    "tag_key": "",<br>    "tag_value": ""<br>  }<br>}</pre> | no |
| source\_identifiers | A map of rule names to source identifiers. For AWS Config managed rules, a predefined identifier from a list. For example, IAM\_PASSWORD\_POLICY is a managed rule. This map will be merged with a default list in locals, with values in this list overriding those in locals | `map` | <pre>{<br>  "acm-certificate-expiration-check": "ACM_CERTIFICATE_EXPIRATION_CHECK",<br>  "approved-amis-by-tag": "APPROVED_AMIS_BY_TAG",<br>  "aproved-amis-by-id": "APPROVED_AMIS_BY_ID",<br>  "autoscaling-group-elb-healthcheck-required": "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED",<br>  "cloudformation-stack-notification-check": "CLOUDFORMATION_STACK_NOTIFICATION_CHECK",<br>  "cloudtrail-enabled": "CLOUD_TRAIL_ENABLED",<br>  "cloudwatch-alarm-action-check": "CLOUDWATCH_ALARM_ACTION_CHECK",<br>  "cloudwatch-alarm-resource-check": "CLOUDWATCH_ALARM_RESOURCE_CHECK",<br>  "cloudwatch-alarm-settings-check": "CLOUDWATCH_ALARM_SETTINGS_CHECK",<br>  "codebuild-project-envvar-awscred-check": "CODEBUILD_PROJECT_ENVVAR_AWSCRED_CHECK",<br>  "codebuild-project-source-repo-url-check": "CODEBUILD_PROJECT_SOURCE_REPO_URL_CHECK",<br>  "db-instance-backup-enabled": "DB_INSTANCE_BACKUP_ENABLED",<br>  "desired-instance-tenancy": "DESIRED_INSTANCE_TENANCY",<br>  "desired-instance-type": "DESIRED_INSTANCE_TYPE",<br>  "dynamodb-autoscaling-enabled": "DYNAMODB_AUTOSCALING_ENABLED",<br>  "dynamodb-throughput-limit-check": "DYNAMODB_THROUGHPUT_LIMIT_CHECK",<br>  "ebs-optimized-instance": "EBS_OPTIMIZED_INSTANCE",<br>  "ec2-instance-detailed-monitoring-enabled": "EC2_INSTANCE_DETAILED_MONITORING_ENABLED",<br>  "ec2-instance-managed-by-ssm": "EC2_INSTANCE_MANAGED_BY_SSM",<br>  "ec2-instances-in-vpc": "INSTANCES_IN_VPC",<br>  "ec2-managedinstance-applications-blacklisted": "EC2_MANAGEDINSTANCE_APPLICATIONS_BLACKLISTED",<br>  "ec2-managedinstance-applications-required": "EC2_MANAGEDINSTANCE_APPLICATIONS_REQUIRED",<br>  "ec2-managedinstance-association-compliance-status-check": "EC2_MANAGEDINSTANCE_ASSOCIATION_COMPLIANCE_STATUS_CHECK",<br>  "ec2-managedinstance-inventory-blacklisted": "EC2_MANAGEDINSTANCE_INVENTORY_BLACKLISTED",<br>  "ec2-managedinstance-patch-compliance-status-check": "EC2_MANAGEDINSTANCE_PATCH_COMPLIANCE_STATUS_CHECK",<br>  "ec2-managedinstance-platform-check": "EC2_MANAGEDINSTANCE_PLATFORM_CHECK",<br>  "ec2-volume-inuse-check": "EC2_VOLUME_INUSE_CHECK",<br>  "eip-attached": "EIP_ATTACHED",<br>  "elb-acm-certificate-required": "ELB_ACM_CERTIFICATE_REQUIRED",<br>  "elb-custom-security-policy-ssl-check": "ELB_CUSTOM_SECURITY_POLICY_SSL_CHECK",<br>  "elb-predefined-security-policy-ssl-check": "ELB_PREDEFINED_SECURITY_POLICY_SSL_CHECK",<br>  "encrypted-volumes": "ENCRYPTED_VOLUMES",<br>  "fms-webacl-resource-policy-check": "FMS_WEBACL_RESOURCE_POLICY_CHECK",<br>  "fms-webacl-rulegroup-association-check": "FMS_WEBACL_RULEGROUP_ASSOCIATION_CHECK",<br>  "guardduty-enabled-centralized": "GUARDDUTY_ENABLED_CENTRALIZED",<br>  "iam-group-has-users-check": "IAM_GROUP_HAS_USERS_CHECK",<br>  "iam-password-policy": "IAM_PASSWORD_POLICY",<br>  "iam-policy-blacklisted-check": "IAM_POLICY_BLACKLISTED_CHECK",<br>  "iam-user-group-membership-check": "IAM_USER_GROUP_MEMBERSHIP_CHECK",<br>  "iam-user-no-policies-check": "IAM_USER_NO_POLICIES_CHECK",<br>  "lambda-function-public-access-prohibited": "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED",<br>  "lambda-function-settings-check": "LAMBDA_FUNCTION_SETTINGS_CHECK",<br>  "rds-multi-az-support": "RDS_MULTI_AZ_SUPPORT",<br>  "rds-snapshots-public-prohibited": "RDS_SNAPSHOTS_PUBLIC_PROHIBITED",<br>  "rds-storage-encrypted": "RDS_STORAGE_ENCRYPTED",<br>  "redshift-cluster-configuration-check": "REDSHIFT_CLUSTER_CONFIGURATION_CHECK",<br>  "redshift-cluster-maintenancesettings-check": "REDSHIFT_CLUSTER_MAINTENANCESETTINGS_CHECK",<br>  "required-tags": "REQUIRED_TAGS",<br>  "restricted-common-ports": "RESTRICTED_INCOMING_TRAFFIC",<br>  "restricted-ssh": "INCOMING_SSH_DISABLED",<br>  "root-account-mfa-enabled": "ROOT_ACCOUNT_MFA_ENABLED",<br>  "s3-blacklisted-actions-prohibited": "S3_BLACKLISTED_ACTIONS_PROHIBITED",<br>  "s3-bucket-logging-enabled": "S3_BUCKET_LOGGING_ENABLED",<br>  "s3-bucket-policy-not-more-permissive": "S3_BUCKET_POLICY_NOT_MORE_PERMISSIVE",<br>  "s3-bucket-public-read-prohibited": "S3_BUCKET_PUBLIC_READ_PROHIBITED",<br>  "s3-bucket-public-write-prohibited": "S3_BUCKET_PUBLIC_WRITE_PROHIBITED",<br>  "s3-bucket-replication-enabled": "S3_BUCKET_REPLICATION_ENABLED",<br>  "s3-bucket-server-side-encryption-enabled": "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED",<br>  "s3-bucket-ssl-requests-only": "S3_BUCKET_SSL_REQUESTS_ONLY",<br>  "s3-bucket-versioning-enabled": "S3_BUCKET_VERSIONING_ENABLED"<br>}</pre> | no |
| transition\_to\_glacier | The number of days to wait before transitioning an object to Glacier | `string` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | The bucket name that config writes output to. |
| bucket\_arn | The bucket ARN that config writes output to. |
| delivery\_channel\_id | The name of the delivery channel. |
| recorder\_id | Name of the recorder. |
| rule\_arns | The ARNs of the config rules |
| rule\_ids | The IDs of the config rules |
| topic\_arn | The ARN of the SNS topic AWS Config writes events to. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
