pipeline {
    agent any

    environment {
        REGION = 'ap-southeast-3' // Sesuaikan region
        TARGET_ACCOUNT_ID = '060795900436' // Tambahkan Target Account ID
        TARGET_ACCOUNT_ROLE = 'arn:aws:iam::060795900436:role/EC2-Jenkins' // Tambahkan role ARN
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'Id-Github', url: 'https://github.com/FaisalT0435/AWS'
            }
        }

        stage('Terraform Init') {
            steps {
                withAWS(role: "$TARGET_ACCOUNT_ROLE", roleAccount: "$TARGET_ACCOUNT_ID", region: "$REGION") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withAWS(role: "$TARGET_ACCOUNT_ROLE", roleAccount: "$TARGET_ACCOUNT_ID", region: "$REGION") {
                    sh 'terraform plan -var-file=terraform.tfvars'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withAWS(role: "$TARGET_ACCOUNT_ROLE", roleAccount: "$TARGET_ACCOUNT_ID", region: "$REGION") {
                    sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Success!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}