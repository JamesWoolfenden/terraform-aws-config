## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delivery_frequency | The frequency with which AWS Config recurringly delivers configuration snapshots. May be one of One_Hour, Three_Hours, Six_Hours, Twelve_Hours, or TwentyFour_Hours | string | `TwentyFour_Hours` | no |
| enable_recorder | Whether the configuration recorder should be enabled or disabled. | string | `true` | no |
| expiration | The number of days to wait before expiring an object | string | `2555` | no |
| input_parameters | A map of strings in JSON format that is passed to the AWS Config rule Lambda function. The map is keyed by the rule names. This is merged with a map contained in locals, with the values supplied here overriding any default values. | map | `<map>` | no |
| log_bucket | The log bucket to write S3 logs to. | string | - | yes |
| name | The name to use when naming resources. | string | - | yes |
| rules | The list of rules to enable in AWS Config. The names are identical to the ones used by AWS. These are used to name the rules and to refence into the input_parameters and source_idenitifers maps. The default is the minimum recommended list. | list | `<list>` | no |
| rules_count | The count of the items in the rules list | string | `8` | no |
| scopes | This is a map of rule names to scope maps. Each scope can have one or both of the following tuples: (compliance_resource_id, compliance_resource_types), (tag_key, tag_value). This map is merged with a default map in locals, with the values in this map overriding the defaults. Defines which resources can trigger an evaluation for the rules. If you do not specify a scope, evaluations are triggered when any resource in the recording group changes. | map | `<map>` | no |
| source_identifiers | A map of rule names to source identifiers. For AWS Config managed rules, a predefined identifier from a list. For example, IAM_PASSWORD_POLICY is a managed rule. This map will be merged with a default list in locals, with values in this list overriding those in locals | map | `<map>` | no |
| tags | A mapping of tags to assign to created resources | map | `<map>` | no |
| transition_to_glacier | The number of days to wait before transitioning an object to Glacier | string | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | The bucket name that config writes output to. |
| bucket_arn | The bucket ARN that config writes output to. |
| delivery_channel_id | The name of the delivery channel. |
| recorder_id | Name of the recorder. |
| rule_arns | The ARNs of the config rules |
| rule_ids | The IDs of the config rules |
| topic_arn | The ARN of the SNS topic AWS Config writes events to. |
