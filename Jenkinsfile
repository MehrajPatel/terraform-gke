pipeline {
    agent any
    
tools {
  maven 'maven 3.8.6'
}

 environment {
    buildNumber = "BUILD_NUMBER"
     PROJECT_ID = 'canvas-rampart-364906'
    CLUSTER_NAME = 'gcp-project'
    LOCATION = 'us-central1-a'
    CREDENTIALS_ID = 'My First Project'
    }

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
   
    stage('Build Packages') {
            steps {
                 sh 'pwd'
                dir("app") {
                sh 'mvn clean package'
                }
           }
        } 
   
   
    stage('Build Docker_image') {
            steps {
             sh 'pwd'
             dir("app") {
            sh 'docker build -t gcr.io/canvas-rampart-364906/my-app:${BUILD_NUMBER} .'    
            } 
            }
    }
   
    stage('Push Docker_image') {
            steps {
             sh 'pwd'
             dir("app") {
       withCredentials([file(credentialsId: 'tf-k8s', variable: 'tf-k8s', url: "https://gcr.io")]) {
    sh 'gcloud auth configure-docker'
    sh 'docker push gcr.io/canvas-rampart-364906/my-app:${BUILD_NUMBER}'
 }
      }
    } 
  }
       stage('Deploy to GKE') {
            steps{
             sh 'pwd'
             dir("app/k8s") {    
                sh "sed -i 's/my-app:latest/my-app:${BUILD_NUMBER}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    } 

    
   
  
  
  
  
    }
 }
