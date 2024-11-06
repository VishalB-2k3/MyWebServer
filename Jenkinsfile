pipeline {
    agent any

    environment {
        // Set the Docker image name, replace with your own DockerHub username and image name
        DOCKER_IMAGE = "vishalvb06/mywebapp"
    }

    stages {
        // Stage 1: Checkout the code from the Git repository
        stage('Checkout') {
            steps {
                // Replace with your Git repository URL
                git url: 'https://github.com/VishalB-2k3/MyWebServer.git', branch: 'main'
            }
        }

        // Stage 2: Build the Java application using Maven
        stage('Build') {
            steps {
                // Runs Maven to clean and package the application
                sh 'mvn clean package'
            }
        }

        // Stage 3: Build the Docker image
        stage('Docker Build') {
            steps {
                // Build the Docker image using the Dockerfile in the repository
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        // Stage 4: Push the Docker image to DockerHub
        stage('Docker Push') {
            steps {
                // Use Jenkins credentials for DockerHub login
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        // Log into DockerHub with credentials
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        // Push the Docker image to DockerHub
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }
    }
}
