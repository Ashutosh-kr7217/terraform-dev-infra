run:
```sh
cd infra/subnet
terraform init -backend-config="key=network/subnet/terraform.tfstate"
terraform apply -var "cidr_block=10.0.1.0/24" \
                -var "availability_zone=us-east-1a" \
                -var "name=team-subnet"
```
