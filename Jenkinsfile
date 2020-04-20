pipeline {
    agent any

    environment {
        registry = "hchen1991/udacity-devops-capstone"
        registryCredential = 'dockerhub_id'
    }

    stages {
        stage("Checkout Code") {
            steps {
                git "https://github.com/hchen20/udacity-devops-capstone"
            }
        }

        stage("Lint HTML files") {
            steps {
                sh "tidy -q -e *.html."
            }
        }

        stage("Build Image") {
            steps {               
                sh "echo $BUILD_NUMBER"
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
    
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}