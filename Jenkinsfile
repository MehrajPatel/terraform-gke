pipeline {
    agent any
tools {
  terraform 'terraform'
}


    stages {
        stage('Git_Clone') {
            steps {
            git branch: 'main', credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/quadrimuzammil/terraform-gke-01.git'
          }
        }
        
        stage ('Terraform init') {
           steps{
                sh 'terraform init'
                   
           }
        }
   
   
    }
}
