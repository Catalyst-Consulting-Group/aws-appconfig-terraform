# AWS AppConfig Terraform

## Modules

### `appconfig`

A Terraform module for creating an AWS AppConfig application, including environments and configuration profiles.

Usage:

```terraform
module "foobar_appconfig" {
  source = "github.com/Catalyst-Consulting-Group/aws-appconfig-terraform//modules/appconfig?ref=$TAG"

  name        = "foobar"
  description = "Foobar Configuration"

  environments = {
    main = {}
  }

  configuration_profiles = {
    main = {}
  }
}
```

This will create an AppConfig application named `foobar`, with 1 environment named `main` and 1 profile named `main`.

By default, profiles will be created as `hosted` `AWS.Freeform`, however this can be overridden. 
Please refer to `variables.tf` for more information.

`$TAG` should be replaced with the desired Git tag / version.

### `appconfig-session-policy`

A Terraform module that creates an IAM policy that grants `StartConfigurationSession` and `GetLatestConfiguration`
permissions for a given AppConfig application, environment, and profile.

Usage:

```terraform
module "appconfig_policy" {
  source = "github.com/Catalyst-Consulting-Group/aws-appconfig-terraform//modules/appconfig-session-policy?ref=$TAG"

  name = "foobar-appconfig-policy"

  application_id           = module.foobar_appconfig.id
  environment_id           = module.foobar_appconfig.environment_ids["main"]
  configuration_profile_id = module.foobar_appconfig.configuration_profile_ids["main"]
}
```

You can then attach this policy to any principal that requires it.

`$TAG` should be replaced with the desired Git tag / version.