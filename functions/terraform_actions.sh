#!/bin/bash

# Function to run `terraform init`
function terraform_init() {
  cd "${TERRAFORM_DIR}" || display_error "Failed to change directory to ${TERRAFORM_DIR}."
  terraform init || display_error "Failed to initialize Terraform."
  cd .. || display_error "Failed to change back to the project root directory."
}

# Function to run `terraform plan`
function terraform_plan() {
  cd "${TERRAFORM_DIR}" || display_error "Failed to change directory to ${TERRAFORM_DIR}."
  terraform plan || display_error "Failed to run Terraform plan."
  cd .. || display_error "Failed to change back to the project root directory."
}

# Function to run `terraform apply`
function terraform_apply() {
  cd "${TERRAFORM_DIR}" || display_error "Failed to change directory to ${TERRAFORM_DIR}."
  terraform apply -auto-approve || display_error "Failed to apply Terraform configuration."
  cd .. || display_error "Failed to change back to the project root directory."
}

# Function to run `terraform destroy`
function terraform_destroy() {
  cd "${TERRAFORM_DIR}" || display_error "Failed to change directory to ${TERRAFORM_DIR}."
  terraform destroy -auto-approve || display_error "Failed to destroy Terraform resources."
  cd .. || display_error "Failed to change back to the project root directory."
}
