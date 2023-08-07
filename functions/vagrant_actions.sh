#!/bin/bash

# Function to start Vagrant VM
function start_vagrant() {
  cd "${VAGRANT_DIR}" || display_error "Failed to change directory to ${VAGRANT_DIR}."
  vagrant up || display_error "Failed to start Vagrant VM."
  cd .. || display_error "Failed to change back to the project root directory."
}

# Function to halt Vagrant VM
function halt_vagrant() {
  cd "${VAGRANT_DIR}" || display_error "Failed to change directory to ${VAGRANT_DIR}."
  vagrant halt || display_error "Failed to halt Vagrant VM."
  cd .. || display_error "Failed to change back to the project root directory."
}

# Function to destroy Vagrant VM
function destroy_vagrant() {
  cd "${VAGRANT_DIR}" || display_error "Failed to change directory to ${VAGRANT_DIR}."
  vagrant destroy || display_error "Failed to destroy Vagrant VM."
  cd .. || display_error "Failed to change back to the project root directory."
}

# Function to SSH into Vagrant VM
function ssh_vagrant() {
  cd "${VAGRANT_DIR}" || display_error "Failed to change directory to ${VAGRANT_DIR}."
  vagrant ssh || display_error "Failed to SSH into Vagrant VM."
  cd .. || display_error "Failed to change back to the project root directory."
}