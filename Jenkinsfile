// Jenkinsfile for Continuous Integration (CI) only without NodeJS plugin

pipeline {
    // 1. Agent: Runs on any available agent
    agent any

    // 2. Stages: Define the CI steps
    stages {
        stage('Checkout') {
            steps {
                echo 'Starting code checkout from GitHub...'
                git url: 'https://github.com/Kalavakuri-gopika/Jenkins.git', branch: 'main'
                echo 'Code checkout complete.'
            }
        }

        stage('Build') {
            steps {
                echo 'Installing Node.js dependencies...'
                sh 'npm install'

                echo 'Building the web application...'
                sh 'npm run build'

                echo '--- Built HTML Content in Build Directory ---'
                sh 'cat build/index.html'
                echo '-----------------------------------------------'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests...'
                sh 'npm test'
                echo 'Tests complete.'
            }
        }
    }

    // 3. Post-Actions
    post {
        always {
            echo 'CI Pipeline execution finished.'
        }
        success {
            echo 'Build successful! Ready for manual deployment.'
        }
        failure {
            echo 'Build or Test failed. Please check the logs.'
        }
    }
}
