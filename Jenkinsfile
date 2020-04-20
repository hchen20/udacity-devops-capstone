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
                sh "tidy -q -e *.html"
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

        stage("Create EKS cluster") {
            steps {
                withAWS(credentials: 'eks-admin', region: 'us-east-1') {
					echo "Hello AWS"
					sh "sh ./create_eks.sh prod-$BUILD_NUMBER"
				}
            }
        }

        stage("Set EKS Context") {
            steps {
                withAWS(credentials: 'eks-admin', region: 'us-east-1') {
					echo "Hello Set Context"
					sh "aws eks --region us-east-1 update-kubeconfig --name prod-$BUILD_NUMBER"
					sh "/home/ubuntu/kubectl get svc"
				}
                
            }
        }

        stage("Deploy Container") {
            steps {
                withAWS(credentials: 'eks-admin', region: 'us-east-1') {
					sh 'cat app.yml | sed -e "s/BUILD/$BUILD_NUMBER/g" | /home/ubuntu/kubectl create -f -'
                    sh '/home/ubuntu/kubectl get svc nginx-deployment -o jsonpath="{.status.loadBalancer.ingress[*].hostname}"'
                }
            }
        }

    }
}