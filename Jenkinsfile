pipeline {
    agent any

    stages {
    stage('Git Clone'){
        steps {
        git branch: 'main', credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/MehrajPatel/terraform-gke.git'
        }
    }
    stage('Terraform init') {
            steps {
                sh 'pwd'
                dir("infra/terraform") { // this was added
                    sh 'terraform init'
               }
                
                 
            }
        } 
     stage('Terraform deploy') {
            steps {
                 sh 'pwd'
                dir("infra/terraform") {
                sh 'terraform apply --auto-approve'
                }
           }
        } 
    }
 }
