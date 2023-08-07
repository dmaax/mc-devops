<p align="center">
    <h1 align="center">mc-devops</h1>
</p>

<p align="center">
  <a aria-label="Ansible version" href="https://www.ansible.com/">
    <img src="https://img.shields.io/badge/v8.2.0-000.svg?logo=Ansible&labelColor=000&style=for-the-badge">
  </a>
  <a aria-label="Terraform version" href="https://www.terraform.io/">
    <img alt="" src="https://img.shields.io/badge/v1.5.4-000.svg?logo=terraform&logoColor=7B42BC&style=for-the-badge">
  </a>
  <a aria-label="Vagrant version" href="https://www.vagrantup.com/">
    <img alt="" src="https://img.shields.io/badge/v2.3.7-000.svg?logo=vagrant&labelColor=000&logoColor=1868F2&style=for-the-badge">
  </a>
  <a aria-label="VirtualBox version" href="https://www.virtualbox.org/">
    <img alt="" src="https://img.shields.io/badge/v7.0.10-000.svg?logo=virtualbox&labelColor=000&style=for-the-badge">
  </a>
</p>

## Description

Automate your Minecraft Network infrastructure with ease! This project configures and provisions everything a Minecraft Network needs, from firewall rules to databases and even the Pterodactyl game panel. Using Vagrant, Terraform, and Ansible, you can effortlessly manage your Minecraft network, providing a seamless and reliable gaming experience for players.

## Prerequisites

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) - Version 8.2.0 or higher
- [Terraform](https://developer.hashicorp.com/terraform/downloads) - Version 1.5.4 or higher
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads) - Version 2.3.7 or higher
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Version 7.0.10 or higher

- `ansible/`: Contains the Ansible-related files, including the inventory and playbook.
- `functions/`: Contains the shell function files for Vagrant, Terraform, and Ansible actions.
- `terraform/`: Contains the Terraform configuration files.
- `vagrant/`: Contains the Vagrant configuration files.
- `deploy.sh`: The main script/wrapper for all functions.
- `LICENSE`: The project's license file.
- `README.md`: This file provides an overview of the project.
- `TODO.md`: This file tracks pending and completed tasks.

## Usage

1. Ensure you have the prerequisites installed.
2. Clone the repository
```bash
git clone https://github.com/dmaax/mc-devops.git
cd mc-devops
```
3. Run the deployment script with appropriate arguments to manage your Minecraft infrastructure. For example:

To start Vagrant VM:
```bash
./deploy.sh vagrant start
```

To halt Vagrant VM:
```bash
./deploy.sh vagrant halt
```

To run Terraform initialization:
```bash
./deploy.sh terraform init
```

To apply Terraform configuration and create infrastructure:
```bash
./deploy.sh terraform apply
```

To run the Ansible playbook:
```bash
./deploy.sh ansible run main.yml
```

For more examples please refer to the `show_usage` function in `deploy.sh`.

## License

This project is licensed under the [MIT License](LICENSE).