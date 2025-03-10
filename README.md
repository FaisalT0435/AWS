# Infrastructure as Code (IaC) with Terraform and AWS using Jenkins

This repository contains Terraform configurations to provision and manage infrastructure on AWS. The infrastructure is automated using Jenkins for CI/CD pipelines.

---

## Prerequisites

Before using this repository, ensure you have the following installed and configured:

1. **Terraform**: Install Terraform from [here](https://www.terraform.io/downloads.html).
2. **AWS CLI**: Install and configure the AWS CLI with your credentials. Follow the guide [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
3. **Jenkins**: Set up a Jenkins server. You can follow the official documentation [here](https://www.jenkins.io/doc/book/installing/).
4. **Git**: Install Git from [here](https://git-scm.com/downloads).

---



## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   
2. Initialize Terraform in the desired environment directory:
   ```bash
   cd environments/dev
   terraform init
   
4. Configure AWS credentials:
   ```bash
   aws configure
   
6. Set up Jenkins:
.
  Install the necessary plugins (e.g., Terraform, AWS, Git).
  Create a new pipeline job and point it to the Jenkinsfile in this repository.


## Contributions are welcome! Please follow these steps:
- Fork the repository.
- Create a new branch for your feature or bugfix.
- Commit your changes.
- Submit a pull request.
