// Jenkinsfile for Continuous Integration (CI) only

pipeline {
    // 1. Agent: Specifies where the pipeline will run. 'any' means any available agent.
    agent any

    // Optional: Define tools needed globally (requires the corresponding Jenkins plugin, e.g., NodeJS Plugin)
    tools {
        // You may need to replace 'node-20' with the name you configured in Manage Jenkins -> Global Tool Configuration
        nodejs 'node-20' 
    }

    // 2. Stages: Define the sequence of CI steps.
    stages {
        stage('Checkout') {
            steps {
                echo 'Starting code checkout from GitHub...'
                // FIX: Explicitly specify the correct repository URL and the 'main' branch.
                git url: 'https://github.com/Kalavakuri-gopika/Jenkins.git', branch: 'main'
                echo 'Code checkout complete.'
            }
        }

        stage('Build') {
            steps {
                echo 'Installing Node.js dependencies...'
                // 'npm install' downloads dependencies defined in package.json
                sh 'npm install'
                
                echo 'Building the web application...'
                // 'npm run build' runs the build script (e.g., creating the 'build/' folder)
                sh 'npm run build'
                
                // Optional: Print the contents of the final HTML file for verification
                sh 'echo "--- Built HTML Content in Build Directory ---"'
                sh 'cat build/index.html'
                sh 'echo "-----------------------------------------------"'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests...'
                // 'npm test' runs your test suite (e.g., Jest, Mocha)
                sh 'npm test' 
                echo 'Tests complete.'
            }
        }
        
        // Deployment stages are intentionally omitted
    }
    
    // 3. Post-Actions: Define actions after the main stages complete.
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
