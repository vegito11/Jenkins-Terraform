# Jenkins-Terraform
Using any IaC (Terraform/ARM/CFT) create the same infra which is  depictedabove. In this you also need to use the userdata to install the Jenkins and Ansible/Chef/Puppet/etc.

## Prerequisites/Softwares to install

- aws cli
- terraform binary

## How to run

1. Create Key Pair with name `testing-key-pair` in your AWS Account

2. Add new the variables in variables.tf or update the exisiting values in [terraform.auto.tfvars](./management/vpc/terraform.auto.tfvars)

3. Create new AWS profile with name `terra` or use the AWS credentials in [provider.tf](./management/vpc/provider.tf)
   
   ```
   $ aws configure --profile terra
   ```
4. Run below commands to create infra

    ```bash
    $ cd vpc
    $ terraform init
    $ terraform plan
    $ terraform apply
    ```

5. Login to machine and verify if jenkins and ansible is installed or not
  
    ```bash
    $ java --version
    $ systemctl status jenkins
    $ ansible --version
    ```