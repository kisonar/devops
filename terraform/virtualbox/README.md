## Terraform to be used with VirtualBox

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
terraform init
terraform plan
terraform apply -auto-approve
```

#### Image
```  
https://www.linuxvmimages.com/images/fedora-34/#download-links fedora/fedora

https://www.osboxes.org/fedora/#fedora-34-info
Username: osboxes
Password: osboxes.org
```