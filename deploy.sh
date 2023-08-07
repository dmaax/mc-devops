#!/usr/bin/bash

# Basic directories
ANSIBLE_DIR="ansible"
CONFIG_DIR="config"
FUNCTIONS_DIR="functions"
SCRIPTS_DIR="scripts"
TERRAFORM_DIR="terraform"
VAGRANT_DIR="vagrant"

# Basic files
ANSIBLE_INVENTORY="${ANSIBLE_DIR}/inventory/hosts"
ANSIBLE_PLAYBOOK="${ANSIBLE_DIR}/playbooks/main.yml"
CONFIG_FILE="${CONFIG_DIR}/main.conf"

# Function to display script usage
function show_usage() {
  echo "Usage: ./deploy.sh [tool] [action] [extra]"
  echo "  [tool]: The tool to use (vagrant, terraform, ansible)"
  echo "  [action]: The action to perform for the specified tool"
  echo "  [extra]: Additional parameters or arguments for specific actions"
  echo ""
  echo "Example:"
  echo "  To start Vagrant VM: ./deploy.sh vagrant up"
  echo "  To run Terraform plan: ./deploy.sh terraform plan"
  echo "  To run Ansible playbook: ./deploy.sh ansible run playbook.yml"
}

# Function to display error messages and exit
function display_error() {
  echo "ERROR: $1" >&2
  exit 1
}

# Function to detect the environment and set options accordingly
function set_options() {
  if [[ "$ENVIRONMENT" == "production" ]]; then
    set -euxo pipefail
  else
    set -e
  fi
}

# Source functions from the functions directory
source "${FUNCTIONS_DIR}/vagrant_actions.sh"
source "${FUNCTIONS_DIR}/terraform_actions.sh"
source "${FUNCTIONS_DIR}/ansible_actions.sh"

# Main Script

# If you are running the script locally, you can change this to local
ENVIRONMENT="production"  
set_options

# Check if required tools are installed
command -v vagrant >/dev/null 2>&1 || display_error "Vagrant is not installed. Please install Vagrant."
command -v terraform >/dev/null 2>&1 || display_error "Terraform is not installed. Please install Terraform."
command -v ansible >/dev/null 2>&1 || display_error "Ansible is not installed. Please install Ansible."

# Check for the correct number of arguments
if [ $# -lt 2 ]; then
  show_usage
  display_error "Invalid number of arguments."
fi

# Parse command-line arguments
tool="$1"
action="$2"
extra="${@:3}"

case "$tool" in
  "vagrant")
    case "$action" in
      "destroy")
        halt_vagrant
        destroy_vagrant
        ;;
      "up")
        start_vagrant
        ;;
      "halt")
        halt_vagrant
        ;;
      "ssh")
        ssh_vagrant
        ;;
      *)
        show_usage
        display_error "Invalid action for Vagrant. Use [start|halt|ssh]."
        ;;
    esac
    ;;
  "terraform")
    case "$action" in
      "init")
        terraform_init
        ;;
      "plan")
        terraform_plan
        ;;
      "apply")
        terraform_apply
        ;;
      "destroy")
        terraform_destroy
        ;;
      *)
        show_usage
        display_error "Invalid action for Terraform. Use [init|plan|apply|destroy]."
        ;;
    esac
    ;;
  "ansible")
    case "$action" in
      "run")
        run_playbook "$extra"
        ;;
      *)
        show_usage
        display_error "Invalid action for Ansible. Use [run playbook.yml]."
        ;;
    esac
    ;;
  *)
    show_usage
    display_error "Invalid tool. Use [ansible|terraform|vagrant]."
    ;;
esac

