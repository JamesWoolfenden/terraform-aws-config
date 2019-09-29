# terraform-aws-config [![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-config.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-config) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-config.svg)](https://github.com/JamesWoolfenden/terraform-aws-config/releases/latest)

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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| common\_tags | A mapping of tags to assign to created resources | map | n/a | yes |
| delivery\_frequency | The frequency with which AWS Config recurringly delivers configuration snapshots. May be one of One_Hour, Three_Hours, Six_Hours, Twelve_Hours, or TwentyFour_Hours | string | `"TwentyFour_Hours"` | no |
| enable\_recorder | Whether the configuration recorder should be enabled or disabled. | string | `"true"` | no |
| expiration | The number of days to wait before expiring an object | string | `"2555"` | no |
| input\_parameters | A map of strings in JSON format that is passed to the AWS Config rule Lambda function. The map is keyed by the rule names. This is merged with a map contained in locals, with the values supplied here overriding any default values. | map | `{ "iam-password-policy": "{\n  \"RequireUppercaseCharacters\": \"true\",\n  \"RequireLowercaseCharacters\": \"true\",\n  \"RequireSymbols\": \"true\",\n  \"RequireNumbers\": \"true\",\n  \"MinimumPasswordLength\": \"30\",\n  \"PasswordReusePrevention\": \"24\",\n  \"MaxPasswordAge\": \"30\"\n}\n" }` | no |
| log\_bucket | The log bucket to write S3 logs to. | string | n/a | yes |
| name | The name to use when naming resources. | string | n/a | yes |
| rules | The list of rules to enable in AWS Config. The names are identical to the ones used by AWS. These are used to name the rules and to refence into the input_parameters and source_idenitifers maps. The default is the minimum recommended list. | list | `[ "cloudtrail-enabled", "iam-password-policy", "restricted-ssh", "root-account-mfa-enabled", "s3-bucket-logging-enabled", "s3-bucket-public-read-prohibited", "s3-bucket-public-write-prohibited", "s3-bucket-ssl-requests-only" ]` | no |
| rules\_count | The count of the items in the rules list | string | `"8"` | no |
| scopes | This is a map of rule names to scope maps. Each scope can have one or both of the following tuples: (compliance_resource_id, compliance_resource_types), (tag_key, tag_value). This map is merged with a default map in locals, with the values in this map overriding the defaults. Defines which resources can trigger an evaluation for the rules. If you do not specify a scope, evaluations are triggered when any resource in the recording group changes. | map | `{ "default": [ { "tag_key": "", "tag_value": "" } ] }` | no |
| source\_identifiers | A map of rule names to source identifiers. For AWS Config managed rules, a predefined identifier from a list. For example, IAM_PASSWORD_POLICY is a managed rule. This map will be merged with a default list in locals, with values in this list overriding those in locals | map | `{ "acm-certificate-expiration-check": "ACM_CERTIFICATE_EXPIRATION_CHECK", "approved-amis-by-tag": "APPROVED_AMIS_BY_TAG", "aproved-amis-by-id": "APPROVED_AMIS_BY_ID", "autoscaling-group-elb-healthcheck-required": "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED", "cloudformation-stack-notification-check": "CLOUDFORMATION_STACK_NOTIFICATION_CHECK", "cloudtrail-enabled": "CLOUD_TRAIL_ENABLED", "cloudwatch-alarm-action-check": "CLOUDWATCH_ALARM_ACTION_CHECK", "cloudwatch-alarm-resource-check": "CLOUDWATCH_ALARM_RESOURCE_CHECK", "cloudwatch-alarm-settings-check": "CLOUDWATCH_ALARM_SETTINGS_CHECK", "codebuild-project-envvar-awscred-check": "CODEBUILD_PROJECT_ENVVAR_AWSCRED_CHECK", "codebuild-project-source-repo-url-check": "CODEBUILD_PROJECT_SOURCE_REPO_URL_CHECK", "db-instance-backup-enabled": "DB_INSTANCE_BACKUP_ENABLED", "desired-instance-tenancy": "DESIRED_INSTANCE_TENANCY", "desired-instance-type": "DESIRED_INSTANCE_TYPE", "dynamodb-autoscaling-enabled": "DYNAMODB_AUTOSCALING_ENABLED", "dynamodb-throughput-limit-check": "DYNAMODB_THROUGHPUT_LIMIT_CHECK", "ebs-optimized-instance": "EBS_OPTIMIZED_INSTANCE", "ec2-instance-detailed-monitoring-enabled": "EC2_INSTANCE_DETAILED_MONITORING_ENABLED", "ec2-instance-managed-by-ssm": "EC2_INSTANCE_MANAGED_BY_SSM", "ec2-instances-in-vpc": "INSTANCES_IN_VPC", "ec2-managedinstance-applications-blacklisted": "EC2_MANAGEDINSTANCE_APPLICATIONS_BLACKLISTED", "ec2-managedinstance-applications-required": "EC2_MANAGEDINSTANCE_APPLICATIONS_REQUIRED", "ec2-managedinstance-association-compliance-status-check": "EC2_MANAGEDINSTANCE_ASSOCIATION_COMPLIANCE_STATUS_CHECK", "ec2-managedinstance-inventory-blacklisted": "EC2_MANAGEDINSTANCE_INVENTORY_BLACKLISTED", "ec2-managedinstance-patch-compliance-status-check": "EC2_MANAGEDINSTANCE_PATCH_COMPLIANCE_STATUS_CHECK", "ec2-managedinstance-platform-check": "EC2_MANAGEDINSTANCE_PLATFORM_CHECK", "ec2-volume-inuse-check": "EC2_VOLUME_INUSE_CHECK", "eip-attached": "EIP_ATTACHED", "elb-acm-certificate-required": "ELB_ACM_CERTIFICATE_REQUIRED", "elb-custom-security-policy-ssl-check": "ELB_CUSTOM_SECURITY_POLICY_SSL_CHECK", "elb-predefined-security-policy-ssl-check": "ELB_PREDEFINED_SECURITY_POLICY_SSL_CHECK", "encrypted-volumes": "ENCRYPTED_VOLUMES", "fms-webacl-resource-policy-check": "FMS_WEBACL_RESOURCE_POLICY_CHECK", "fms-webacl-rulegroup-association-check": "FMS_WEBACL_RULEGROUP_ASSOCIATION_CHECK", "guardduty-enabled-centralized": "GUARDDUTY_ENABLED_CENTRALIZED", "iam-group-has-users-check": "IAM_GROUP_HAS_USERS_CHECK", "iam-password-policy": "IAM_PASSWORD_POLICY", "iam-policy-blacklisted-check": "IAM_POLICY_BLACKLISTED_CHECK", "iam-user-group-membership-check": "IAM_USER_GROUP_MEMBERSHIP_CHECK", "iam-user-no-policies-check": "IAM_USER_NO_POLICIES_CHECK", "lambda-function-public-access-prohibited": "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED", "lambda-function-settings-check": "LAMBDA_FUNCTION_SETTINGS_CHECK", "rds-multi-az-support": "RDS_MULTI_AZ_SUPPORT", "rds-snapshots-public-prohibited": "RDS_SNAPSHOTS_PUBLIC_PROHIBITED", "rds-storage-encrypted": "RDS_STORAGE_ENCRYPTED", "redshift-cluster-configuration-check": "REDSHIFT_CLUSTER_CONFIGURATION_CHECK", "redshift-cluster-maintenancesettings-check": "REDSHIFT_CLUSTER_MAINTENANCESETTINGS_CHECK", "required-tags": "REQUIRED_TAGS", "restricted-common-ports": "RESTRICTED_INCOMING_TRAFFIC", "restricted-ssh": "INCOMING_SSH_DISABLED", "root-account-mfa-enabled": "ROOT_ACCOUNT_MFA_ENABLED", "s3-blacklisted-actions-prohibited": "S3_BLACKLISTED_ACTIONS_PROHIBITED", "s3-bucket-logging-enabled": "S3_BUCKET_LOGGING_ENABLED", "s3-bucket-policy-not-more-permissive": "S3_BUCKET_POLICY_NOT_MORE_PERMISSIVE", "s3-bucket-public-read-prohibited": "S3_BUCKET_PUBLIC_READ_PROHIBITED", "s3-bucket-public-write-prohibited": "S3_BUCKET_PUBLIC_WRITE_PROHIBITED", "s3-bucket-replication-enabled": "S3_BUCKET_REPLICATION_ENABLED", "s3-bucket-server-side-encryption-enabled": "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED", "s3-bucket-ssl-requests-only": "S3_BUCKET_SSL_REQUESTS_ONLY", "s3-bucket-versioning-enabled": "S3_BUCKET_VERSIONING_ENABLED" }` | no |
| transition\_to\_glacier | The number of days to wait before transitioning an object to Glacier | string | `"30"` | no |

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
