# Terramate reference architecture

A minimal multi-account, multi-region Terraform repository managed with
Terramate. It contains sandbox and production AWS accounts, regional stacks,
AWS provider aliases, and stack-local provider examples.

> Account IDs, AWS profiles, state buckets, and resources are placeholders.
> Replace them before running `terraform apply`.

## Layout

```text
.
├── modules/                         # Reusable Terraform modules
├── stacks/
│   ├── config.tm.hcl                # Repository-wide globals
│   ├── imports/                     # Shared code generators
│   │   ├── 000_terraform.tm.hcl
│   │   ├── 001_providers.tm.hcl
│   │   ├── 009_context.tm.hcl
│   │   └── aws/provider.tm.hcl
│   └── aws/<account>/<region>/<stack>/
└── terramate.tm.hcl
```

Each stack has its own Terraform state. Account and region settings are
inherited from parent directories. State buckets follow this convention:

```text
tf-state[-<account-alias>]-<short-region>-<account-id>
```

The default AWS provider comes from `stacks/imports/aws/provider.tm.hcl`.
Stacks can declare additional providers or aliases in `stack.tm.hcl`; see the
production object-storage stack for AWS aliases plus `random` and `time`.

See [docs/architecture.md](docs/architecture.md) for more detail.

## Generated files

Terramate writes the following files into each stack:

- `000_terramate_generated_terraform.tf`
- `001_terramate_generated_providers.tf`
- `009_terramate_generated_context.tf`

Do not edit them directly. Update the files under `stacks/imports/` and run:

```shell
terramate generate
```

Terraform lockfiles are intentionally ignored.

## Local workflow

Install the pinned tools and hooks:

```shell
mise install
prek install
```

Format and validate:

```shell
terramate generate
prek run --all-files
terramate run -- terraform init -backend=false
terramate run -- terraform validate
```

Inspect stack order:

```shell
terramate list --run-order
```

Before planning, replace the placeholder account configuration, bootstrap the
state buckets and lock tables, and authenticate the AWS profiles.

```shell
terramate run --tags aws -- terraform plan
```
