pipeline {
    agent any

    stages {
    stage('Terraform init') {
            steps {
                sh 'pwd'
                sh 'cd ./infra/terraform/'
                sh 'terraform init -input=false'
                }
        } 
     stage('Terraform deploy') {
            steps {
                sh 'cd ./infra/terraform/'
                sh 'terraform apply --auto-approve'
           }
        } 
    }
 }
