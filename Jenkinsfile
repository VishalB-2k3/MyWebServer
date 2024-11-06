pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/VishalB-2k3/MyWebServer.git'
            }
        }
        stage('Build') {
            steps {
                // Verify the directory structure (make sure pom.xml is present)
                sh 'ls -al'
                
                // Run the Maven build
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                // Docker build steps
                sh 'docker build -t my-app .'
            }
        }
        stage('Docker Push') {
            steps {
                // Docker push steps (ensure you have Docker Hub credentials configured)
                sh 'docker push my-app'
            }
        }
    }
}
