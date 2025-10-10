pipeline {
    agent any

    // Schedule the pipeline to run every day at 8:00 AM
    triggers {
        cron('0 8 * * *') // Correct cron syntax: minute hour day month weekday
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull code from GitHub repository
                git branch: 'master',
                    url: 'https://github.com/Diishita/git-assignment-.git'
            }
        }

        stage('Compile Java Code') {
            steps {
                // Compile the Java file
                bat 'javac file1.java'
            }
        }

        stage('Run Java Program') {
            steps {
                // Run the compiled Java program
                bat 'java file1'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed'
        }
        success {
            echo 'Pipeline succeeded'
        }
    }
}
