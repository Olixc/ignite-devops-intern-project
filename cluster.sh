#!/bin/bash

# Function to check if Docker is installed
check_docker() {
  if ! [ -x "$(command -v docker)" ]; then
    echo "Error: Docker is not installed." >&2
    exit 1
  fi
}

# Function to check if Kind is installed
check_kind() {
  if ! [ -x "$(command -v kind)" ]; then
    echo "Error: Kind is not installed." >&2
    exit 1
  fi
}

# Function to prompt user for cluster name
prompt_for_cluster_name() {
  read -p "Enter the cluster name (lowercase letters, numbers, dots, or hyphens only): " cluster_name
}

# Function to validate cluster name format
validate_cluster_name() {
  if ! [[ "$cluster_name" =~ ^[a-z0-9.-]+$ ]]; then
    echo "Error: Invalid cluster name format. Cluster names must match '^[a-z0-9.-]+$'." >&2
    return 1
  fi
}

# Function to create Kind cluster
create_kind_cluster() {
  kind create cluster --name "$cluster_name"
}

# Check if Docker and Kind are installed
check_docker
check_kind

# Initialize a flag for retry
retry="yes"

while [ "$retry" == "yes" ]; do
  # Prompt for cluster name
  prompt_for_cluster_name

  # Validate cluster name format
  if validate_cluster_name; then
    # Check if a cluster with the same name already exists
    if kind get clusters | grep -q "$cluster_name"; then
      echo "Error: A Kind cluster with the name '$cluster_name' already exists." >&2
    else
      # Create a Kind cluster with the specified name
      create_kind_cluster

      # Verify cluster creation
      if [ $? -eq 0 ]; then
        echo "Cluster '$cluster_name' created successfully."
        retry="no"
      else
        echo "Error: Cluster creation failed." >&2
      fi
    fi
  else
    # Prompt user if they want to retry
    read -p "Do you want to try again? (yes/no): " retry
  fi
done