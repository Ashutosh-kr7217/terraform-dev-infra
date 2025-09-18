run:
```sh
cd infra/vpc
terraform init -backend-config="key=network/vpc/terraform.tfstate"
terraform apply -var "cidr_block=10.0.0.0/16" -var "name=team-vpc"
```
