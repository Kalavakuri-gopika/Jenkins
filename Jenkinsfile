// Jenkinsfile for CI only (Windows Agent)

pipeline {
    agent any

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
                bat 'npm install'

                echo 'Building the web application...'
                bat 'npm run build'

                echo '--- Built HTML Content in Build Directory ---'
                // Only display if file exists
                bat '''
                if exist build\\index.html (
                    type build\\index.html
                ) else (
                    echo build\\index.html not found!
                    exit 1
                )
                '''
                echo '-----------------------------------------------'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests...'
                bat 'npm test'
                echo 'Tests complete.'
            }
        }
    }

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
