pipeline {
    agent any

    stages {
        stage('Build & Run') {
            steps {
                checkout scm

                echo "=== Building the Docker Image ==="
                sh "docker build -t java-app ."

                echo "=== Cleaning up any old container ==="
                sh "docker rm -f java-run || true"

                echo "=== Running the Container ==="
                sh "docker run --name java-run java-app"
            }
        }
    }
}

