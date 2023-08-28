# Ansible Directory

This directory contains the Ansible configurations for managing your Minecraft Network infrastructure (development server or production server). Before running Terraform, please follow the instructions below to ensure a successful deployment:

## Prerequisites

- Ansible: Please make sure you have Ansible installed on your system. You can find the instructions to install ansible [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) and follow the installation instructions for your operating system.

## Configuration

1. Clone this repository to your local machine.

2. Navigate to the `ansible` directory:

```bash
cd ansible
```

3. Edit the file `ansible.cfg` to match your python interpreter location.

4. You can modify the production inventory file, which is located at `inventory/production.ini`. Please update the following variables:

- `ansible_ssh_private_key_file`: Specify the location of your private ssh key used to connect to the prodcution server.

Please do not modify the file `inventory/development.ini` as this will break the Vagrant script. If you wish to modify it anyway do not forget to change the Vagrant file located at `../vagrant/Vagrantfile`.

## Running playbooks

Once you have updated the files with the required values, you can proceed to run the ansible. There are two ways to run the playbooks, the first is to run them directly from this folder with this structure: `ansible-playbook -i inventory/<inventory>.ini playbooks/<playbook>.yml`. The other way is to run via the `deploy.sh` script located at the project root.

1. Running directly from the ansible folder:

```bash
ansible-playbook -i inventory/development.ini playbooks/everything-playbook.yml
```

or

```bash
ansible-playbook -i inventory/production.ini playbooks/vultr-playbook.yml
```

2. Running from the project root via the `deploy.sh` script:

```bash
cd ..
```

```bash
./deploy.sh ansible run development.ini everything-playbook.yml
```

or

```bash
./deploy.sh ansible run production.ini vultr-playbook.yml
```

Please note that the deploy script calls the playbooks and inventory files without their folders as it assumes they are located under `inventory/` and `playbooks/`.

## Contributing

Contributions to this project are welcome! If you encounter any issues or have suggestions for improvements, please create a pull request or open an issue on the repository.

## License

This project is licensed under the [MIT License](../LICENSE).

Thank you for using our Terraform configurations to set up your Minecraft Network infrastructure. If you have any questions or need further assistance, please don't hesitate to reach out. Happy crafting! 🚀