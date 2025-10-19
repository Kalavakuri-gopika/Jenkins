// Example Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Kalavakuri-gopika/Jenkins.git'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                // This builds the app and puts index.html into the 'build/' folder
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test' 
            }
        }
        stage('Deploy to Staging') {
            // NOTE: Replace 'user@staging-server' and 'your-staging-domain.com'
            environment {
                STAGING_HOST = 'your-staging-domain.com' // <-- Define the public URL
                STAGING_PATH = '/var/www/html/staging'
            }
            steps {
                sh 'scp -r build/ user@staging-server:/var/www/html/staging' 
                
                // 1. Display the content of the built HTML file for confirmation
                sh 'echo "--- Built HTML Content ---"'
                sh 'cat build/index.html'
                sh 'echo "--------------------------"'
                
                // 2. Print the final public link
                sh "echo 'Web App Deployed to STAGING at:'"
                sh "echo '👉 http://${env.STAGING_HOST}/'" // Print the clickable URL
            }
        }
        stage('Deploy to Production') {
            // NOTE: Replace 'user@prod-server' and 'your-production-domain.com'
            environment {
                PROD_HOST = 'your-production-domain.com' // <-- Define the public URL
            }
            input {
                message "Deploy to production?"
            }
            steps {
                sh 'scp -r build/ user@prod-server:/var/www/html/prod'
                sh "echo 'Web App Deployed to PRODUCTION at:'"
                sh "echo '🚀 http://${env.PROD_HOST}/'" // Print the clickable URL
            }
        }
    }
}
