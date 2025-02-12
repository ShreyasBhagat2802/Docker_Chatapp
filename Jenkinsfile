pipeline {
    agent any

    environment {
        DOCKER_SERVER = "ubuntu@10.0.3.221"  // Update with your Docker server IP
        PROJECT_DIR = "/home/ubuntu/chatapp"  // Directory on the Docker Server
        GIT_REPO = "https://github.com/ShreyasBhagat2802/Docker_Chatapp.git"
        SSH_KEY = "/home/jenkins/.ssh/id_rsa"
    }

    stages {
        stage('🛠️ Pull Code from GitHub') {
            steps {
                script {
                    echo "Cloning the application repository on the Master Node..."
                    git branch: 'main', url: "${GIT_REPO}"
                }
            }
        }

        stage('📤 Sync Files to Docker Server (rsync)') {
            steps {
                script {
                    echo "Syncing files to the backend server from the Build-Agent..."
                    sh """
                    rsync -avz -e "ssh -i ${SSH_KEY}" \$(pwd)/ ${DOCKER_SERVER}:${PROJECT_DIR} || { echo 'ERROR: File sync failed. Please check the SSH connection and directory permissions.'; exit 1; }
                    """
                }
            }
        }

        stage('🐳 Build & Start Containers on Docker Server') {
            steps {
                script {
                    sh '''
                    ssh -o StrictHostKeyChecking=no $DOCKER_SERVER << EOF
                    cd $PROJECT_DIR
                    docker kill -f $(docker ps -aq)
                    docker rmi -f $(docker images -q)
                    docker compose --env-file .env up -d 
                    EOF
                    '''
                }
            }
        }

        stage('✅ Check Running Containers') {
            steps {
                script {
                    sh 'ssh -o StrictHostKeyChecking=no $DOCKER_SERVER "docker ps"'
                }
            }
        }
    }
}
