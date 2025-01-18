WireGuard Automation with Terraform, Ansible, and GitHub Actions

🛠️ Technologies Involved

    Terraform: Infrastructure as Code (IaC) tool for provisioning AWS resources.
    Ansible: Configuration management tool to set up and deploy WireGuard VPN on the server.
    WireGuard: Modern VPN software used for secure and fast networking.
    GitHub Actions: CI/CD pipeline for automating deployment and teardown of the infrastructure.

📜 Project Overview

This project demonstrates a fully automated process to deploy a WireGuard VPN server on AWS using Terraform, Ansible, and GitHub Actions.
What It Does:

    Provision Infrastructure:
        Creates an AWS Lightsail instance.
        Configures a static IP and opens necessary ports.
    Set Up WireGuard:
        Configures the VPN server and generates client configuration files.
        Enables NAT and IP forwarding for internet access through the VPN.
    CI/CD Automation:
        Uses GitHub Actions to:
            Deploy the infrastructure.
            Configure the VPN server.
            Destroy the infrastructure when no longer needed.

🚀 How It Works
Pipelines:

    Deploy Pipeline:
        Creates the infrastructure.
        Configures the WireGuard VPN server.
        Generates and uploads the client configuration as an artifact.
        Download the client file to upload or configure your client wireguard instance. 
    Destroy Pipeline:
        Tears down the infrastructure, including the server, static IP, and state management resources like the S3 bucket.

📝 Setup Instructions
Prerequisites:

    AWS Account:
        Sign up for an AWS account at AWS.
        Obtain your AWS Access Key ID and AWS Secret Access Key.
    GitHub Account:
        Fork or copy this repository to your GitHub account.

🔑 Adding Secrets to GitHub

    Navigate to your repository's settings on GitHub.
    Go to Secrets and variables > Actions.
    Click New repository secret and add the following secrets:
        AWS_ACCESS_KEY_ID: Your AWS Access Key ID.
        AWS_SECRET_ACCESS_KEY: Your AWS Secret Access Key.

🛠️ Running the Pipelines
1. Deploy Pipeline:

    Push to the main branch or manually trigger the workflow under the "Actions" tab.
    The pipeline will:
        Create the infrastructure.
        Configure the WireGuard server.
        Generate and upload the client configuration as an artifact.

2. Destroy Pipeline:

    Manually trigger the Destroy workflow under the "Actions" tab.
    This will:
        Destroy all resources created by the deploy pipeline.
        Delete the S3 bucket after cleaning its contents.

📂 File Structure

    terraform/:
        Terraform code for AWS Lightsail resources and state management.
    ansible/:
        Ansible playbooks for configuring WireGuard.
    .github/workflows/:
        GitHub Actions workflows for automating deployment and teardown.
    README.md:
        Documentation and setup instructions.

🛡️ Security Notes

    Secrets Management:
        Ensure AWS credentials are stored securely in GitHub Secrets.
    Artifact Handling:
        The client configuration file is uploaded as a GitHub artifact. Download it promptly after deployment to avoid accidental exposure.

