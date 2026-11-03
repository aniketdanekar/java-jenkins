pipeline {
    agent any

    environment {
        IMAGE_NAME     = "java-addition-app"
        CONTAINER_NAME = "java-addition-run"
        REPO_URL       = "https://github.com/aniketdanekar/python-program.git" // Change this if you made a new repo
    }

    stages {
        stage('Fetch Code') {
            steps {
                // Clones the main branch from your GitHub repository
                git branch: 'main', url: "${env.REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "=== Building the Java Docker Image ==="
                sh "docker build -t ${env.IMAGE_NAME} ."
            }
        }

        stage('Run and Verify Output') {
            steps {
                echo "=== Cleaning up any old container ==="
                sh "docker rm -f ${env.CONTAINER_NAME} || true"

                echo "=== Running the Container ==="
                // Runs the container and captures the console text output
                script {
                    def output = sh(script: "docker run --name ${env.CONTAINER_NAME} ${env.IMAGE_NAME}", returnStdout: true).trim()
                    echo "Program Output:\n${output}"
                    
                    // Verifies if the correct mathematical output is present
                    if (output.contains("is: 15")) {
                        echo "Verification Success! The addition program output is correct."
                    } else {
                        error "Verification Failed! Unexpected output received: ${output}"
                    }
                }
            }
        }
    }
    
    post {
        always {
            echo "=== Cleaning up build container ==="
            sh "docker rm -f ${env.CONTAINER_NAME} || true"
        }
    }
}

