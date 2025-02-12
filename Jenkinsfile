pipeline {
    agent any

    environment {
        DOCKER_HOST = "tcp://10.0.3.221:2375"
        MYSQL_ROOT_PASSWORD = "root@1234"
        DB_HOST = "mysql_db"
        DB_NAME = "myrdsdb"
        DB_USER = "admin"
        DB_PASSWORD = "Shreyas28"
        DB_PORT = "3306"
    }

    stages {
        stage('🛠️ Pull Code from GitHub') {
            steps {
                script {
                    sh 'git clone https://github.com/ShreyasBhagat2802/Docker_Chatapp.git /home/ubuntu/chatapp || cd /home/ubuntu/chatapp && git pull'
                }
            }
        }

        stage('🐳 Build & Start Containers') {
            steps {
                script {
                    sh '''
                    cd /home/ubuntu/chatapp
                    docker-compose down || true
                    docker-compose build
                    docker-compose up -d
                    '''
                }
            }
        }

        stage('✅ Check Running Containers') {
            steps {
                script {
                    sh 'docker ps'
                }
            }
        }
    }
}
