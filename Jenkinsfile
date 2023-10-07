pipeline {
    agent {label 'test_slave'}
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the Git repository
                checkout scm
            }
        }
        
        stage('Build and Publish') {
            when {
                // Trigger on commits to master branch
                branch 'master'
            }
            steps {
                // Build and publish the website to port 82
                sh 'docker run -d --name xyzcontainer -p 82:80 -v $PWD:/var/www/html httpd'
            }
        }
        
       
    }
    
    post {
        success {
            // Cleanup and notifications on success
            sh 'docker stop xyzcontainer'
            sh 'docker rm xyzcontainer'
            echo 'Build and/or publish completed successfully!'
        }
        failure {
            // Cleanup and notifications on failure
            sh 'docker stop xyzcontainer'
            sh 'docker rm xyzcontainer'
            echo 'Build and/or publish failed!'
        }
    }
}
