## Terraform to be used with Openstack

### Prerequisite
```
source openstack file from OPENRC
command: source file.openrc
```

#### Usage preparation
```
fill values in main tf
terraform init ==> error
terraform --version ==> Terraform v0.13.5
terraform 0.13upgrade ==> OK
terraform --version  ==> Terraform v0.13.5
```

#### Usage execution
```
terraform plan
terraform apply -auto-approve
```