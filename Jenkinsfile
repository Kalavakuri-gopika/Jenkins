pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                git url: 'https://github.com/Kalavakuri-gopika/Jenkins.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Installing Node.js dependencies...'
                bat 'npm install'

                echo 'Building web app...'
                bat 'npm run build'

                echo 'Verifying build output...'
                bat '''
                if exist build\\index.html (
                    echo index.html successfully built
                ) else (
                    echo ERROR: build\\index.html not found
                    exit 1
                )
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'npm test'
            }
        }

        stage('Deploy via Streamlit') {
            steps {
                echo 'Launching Streamlit server...'
                bat 'streamlit run streamlit_app.py --server.port 8501'
            }
        }
    }

    post {
        success {
            echo 'Deployment complete! Access your Streamlit app at http://<jenkins-agent-ip>:8501'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
