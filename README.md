[![Slalom][logo]](https://slalom.com)

# terraform-aws-config [![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-config.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-config) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-config.svg)](https://github.com/JamesWoolfenden/terraform-aws-config/releases/latest)

Terraform module to provision an AWS config.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

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
| default_branch | The name of the default repository branch | string | `master` | no |
| depends_on | This is a way to make a module depends on, which isn't built in. | list | `<list>` | no |
| developer_group | An existing Iam Group to attach the policy permissions to | string | - | yes |
| repository_name | The name of your GIT repository | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| clone_url_https | - |
| clone_url_ssh | - |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Instructions

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-config/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-config/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-config&url=https://github.com/jameswoolfenden/terraform-aws-config
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-config&url=https://github.com/jameswoolfenden/terraform-aws-config
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-config
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-config
[share_email]: mailto:?subject=terraform-aws-config&body=https://github.com/jameswoolfenden/terraform-aws-config
