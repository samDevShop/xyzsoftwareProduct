pipeline {
    agent {label 'test_slave'}
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the Git repository
                checkout scm
                sh 'git checkout master'
            }
        }
        
        stage('Build and Publish') {
            when {
                 expression {
                    branch 'master'
                }
                // Trigger on commits to master 
                
            }
            steps {
                // Build and publish the website to port 82
                sh 'sudo docker run -d --name xyzcontainer -p 82:80 -v $PWD:/var/www/html httpd'
            }
        }
        
       
    }
    
    post {
        success {
            // Cleanup and notifications on success
            // sh 'sudo docker stop xyzcontainer'
            // sh 'sudo docker rm xyzcontainer'
            echo 'Build and/or publish completed successfully!'
        }
        failure {
            // Cleanup and notifications on failure
            sh 'sudo docker stop xyzcontainer'
            sh 'sudo docker rm xyzcontainer'
            echo 'Build and/or publish failed!'
        }
    }
}
