run:
```sh
cd infra/security-group
terraform init -backend-config="key=network/security-group/terraform.tfstate"
terraform apply
```
