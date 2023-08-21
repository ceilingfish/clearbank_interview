# Summary

This terraform code defines sufficient code to deploy a couple of Azure Service Bus namespaces. It can be executed like this:


    cd /path/to/this/readme/
    cd components/servicebus
    az login
    terraform init
    terraform plan -var-file='../../envs/test.tfvars' -out plan.tfplan
    # Stop to review the plan here
    terraform apply plan.tfplan