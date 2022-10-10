pipeline {
    agent any

    stages {
    stage('Terraform init') {
            steps {
                sh 'pwd'
                dir("infra/terraform") { // this was added - sahi hai ek baar try kro
                sh 'terraform init'
               }
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
