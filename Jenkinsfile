pipeline {
    agent any

    environment {
        IMAGE_NAME = "tadka-express"
        CONTAINER_NAME = "tadka-express"
        HOST_PORT = "8090"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
            }
        }

        stage('Deploy') {
            steps {
                sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:80 ${IMAGE_NAME}:${BUILD_NUMBER}
                """
            }
        }
    }

    post {
        success {
            echo "Live at http://<your-server-ip>:${HOST_PORT}  (build #${BUILD_NUMBER})"
        }
    }
}
