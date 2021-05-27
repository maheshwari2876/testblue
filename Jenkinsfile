#!groovy
pipeline {
    agent any
        tools {
            maven 'Maven 3.6.0'
            jdk 'java11'
            dockerTool 'docker'
        }
    environment {
            VERSION = "${BUILD_NUMBER}" 
            PROJECT = "my-java-app"
            IMAGE = "$PROJECT:$VERSION"
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
                sh 'pwd'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Docker Build') {
            steps {
                script{
                    docker.build('$IMAGE')
                } 
            }
        }
        
        stage('Push to ECR') {
            steps {
                script{
                    docker.withRegistry("https://990795894249.dkr.ecr.us-east-1.amazonaws.com/my-java-app", "ecr:us-east-1:CredAws" )
                    {
                         docker.image(IMAGE).push()   
                    }
                }
            }
        }
    }
}
