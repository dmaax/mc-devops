# Terraform Directory

This directory contains the Terraform configurations for provisioning and managing your Minecraft Network infrastructure in Vultr. Before running Terraform, please follow the instructions below to ensure a successful deployment:

## Prerequisites

- Terraform: Please make sure you have Terraform installed on your system. You can download it from the [Terraform website](https://developer.hashicorp.com/terraform/downloads) and follow the installation instructions for your operating system.

## Configuration

1. Clone this repository to your local machine.

2. Navigate to the `terraform` directory:

```bash
cd terraform
```

3. Rename the `terraform.tfvars.example` file to `terraform.tfvars`:

```bash
mv terraform.tfvars.example terraform.tfvars
```

4. Open the `terraform.tfvars` file in a text editor and customize the variables according to your environment and requirements. Please update the following variables:

- `VULTR_API_KEY`: Specify your API Key for Vultr.
- `VULTR_PUBLIC_SSH_KEY`: Set this to a public key to be used as a login method on the vm.

Ensure you provide valid and appropriate values for each variable to match your specific Vultr environment.

## Deployment

Once you have updated the `terraform.tfvars` file with the required values, you can proceed to deploy your Minecraft Network infrastructure using Terraform.

1. Initialize Terraform:

```bash
terraform init
```

2. Review the changes that Terraform will apply:

```bash
terraform plan
```

3. If the plan looks correct, apply the changes:

```bash
terraform apply
```

Terraform will create the necessary resources as defined in the configuration files.

## Clean Up

To destroy the created infrastructure and resources, you can use the following command:

```bash
terraform destroy
```

Please exercise caution with this command, as it will permanently delete the resources.

## Contributing

Contributions to this project are welcome! If you encounter any issues or have suggestions for improvements, please create a pull request or open an issue on the repository.

## License

This project is licensed under the [MIT License](../LICENSE).

Thank you for using our Terraform configurations to set up your Minecraft Network infrastructure. If you have any questions or need further assistance, please don't hesitate to reach out. Happy crafting! 🚀