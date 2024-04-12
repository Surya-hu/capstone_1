pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Change permissions of build.sh before executing
                    sh 'chmod +x build.sh'
                    // Execute build.sh to build Docker images
                    sh './build.sh'
                }
            }
        }
        
        stage('Deploy Docker Image') {
            steps {
                script {
                    // Change permissions of deploy.sh before executing
                    sh 'chmod +x deploy.sh'
                    // Execute deploy.sh to deploy Docker images
                    sh './deploy.sh'
                }
            }
        }
    }
}

