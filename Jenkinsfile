pipeline {
    agent {label 'test_slave'}
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the Git 
                checkout scm
                sh 'git checkout develop'
            }
        }
        
        stage('Build Only') {
            when {
                 expression {
                    branch 'develop'
                }
                // Trigger on commits to master 
                
            }
            steps {
                // Build and publish the website to port 82
                sh 'echo "Builded Successfully"'
            }
        }
        
       
    }
    
    post {
        success {
            // Cleanup and notifications on success
            // sh 'sudo docker stop xyzcontainer'
            // sh 'sudo docker rm xyzcontainer'
            echo 'Build completed successfully!'
        }
        failure {
            // Cleanup and notifications on failure
            
            echo 'Build  failed!'
        }
    }
}
