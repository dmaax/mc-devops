#!/bin/bash

# Function to run Ansible playbook
function run_playbook() {
  local argument=($(echo "$@" | sed 's/ /\n/g'))
  local playbook_file="playbooks/${argument[1]}"

  if [ -z "$playbook_file" ]; then
    display_error "Ansible playbook file path is missing."
  fi

  cd "${ANSIBLE_DIR}" || display_error "Failed to change directory to ${ANSIBLE_DIR}."

  if [ ! -f "$playbook_file" ]; then
    display_error "Ansible playbook file not found: $playbook_file"
  fi

  ansible-playbook -i inventory/${argument[0]} $playbook_file || display_error "Ansible playbook execution failed."
  cd .. || display_error "Failed to change back to the project root directory."
}
