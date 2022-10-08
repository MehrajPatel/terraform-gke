pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                echo 'Building java app'
            }
        }
        stage('Build Docker') {
            steps {
                echo 'Building docker image and pushing into ECR'
            }
        }
        stage('Deploy EKS') {
            steps {
                echo 'Deploying EKS cluster using terraform'
            }
        }
        stage('Deploy App') {
            steps {
                echo 'Deploying app into the EKS'
            }
        }
    }
}
