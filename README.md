# Ignite.dev DevOps Intern Project

## Overview

This repository showcases the Ignite DevOps Intern Project, demonstrating the setup and deployment of a Kubernetes cluster using Kind (Kubernetes in Docker). We also deploy a sample Node.js application using Terraform, containerize a simple Hello World Express app, and deploy it to Docker Hub. In addition, we provide a Kubernetes deployment manifest for the Node.js application and use Terraform to apply it programmatically to the Kind cluster.

## Table of Contents

- [Ignite.dev DevOps Intern Project](#ignitedev-devops-intern-project)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
    - [Cluster Setup](#cluster-setup)
    - [Node.js Application Deployment](#nodejs-application-deployment)
  - [Project Structure](#project-structure)

## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- Kind (Kubernetes in Docker)
- Terraform
- Docker
- kubectl

## Getting Started

### Cluster Setup

1. Run the provided Bash script to set up a Kubernetes cluster locally using Kind.
   by running the following command:

   ```./cluster```
2. Download the kubeconfig for the cluster and securely store it for later use.

### Node.js Application Deployment

1. Deploy a sample Node.js application to the cluster using Terraform.

## Project Structure

- `cluster`: Bash script for local Kubernetes cluster setup using Kind.
  