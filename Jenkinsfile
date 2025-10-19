// Example Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-user/your-repo.git'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Deploy to Staging') {
            steps {
                // Use SSH or a cloud plugin to copy the build files to the staging server
                sh 'scp -r build/ user@staging-server:/var/www/html/staging'
            }
        }
        stage('Deploy to Production') {
            // This stage can be set up to wait for a manual input or a timed delay
            input {
                message "Deploy to production?"
            }
            steps {
                sh 'scp -r build/ user@prod-server:/var/www/html/prod'
            }
        }
    }
}
