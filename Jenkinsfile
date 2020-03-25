pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/GiselaGM/fooproject.git'
            }
        }
        stage('Build')
        {
            steps
            {
                sh "mvn compile"
            }
        }
        stage('Test')
        {
            steps
            {
                sh "mvn test"
            }
        }
        stage('newman') {
               steps{
                sh 'newman run RestfulBooker.postman_collection.json --environment RestfulBooker.postman_environment.json --reporters junit'
               }
                    post{
                            always{
                                 junit '**/*xml'
                            }
                    }
        }

        stage('Robot Framework System tests with Selenium') {
                steps {
                    sh 'robot -d results --variable BROWSER:headlessfirefox ./Tests/infotiv.robot.robot'
                }
                post {
                    always {
                        script {
                              step(
                                    [
                                      $class              : 'RobotPublisher',
                                      outputPath          : 'results',
                                      outputFileName      : '**/output.xml',
                                      reportFileName      : '**/report.html',
                                      logFileName         : '**/log.html',
                                      disableArchiveOutput: false,
                                      passThreshold       : 50,
                                      unstableThreshold   : 40,
                                      otherFiles          : "**/*.png,**/*.jpg",
                                    ]
                              )
                        }
                    }
                }
        }
    post {
        always {
            junit '**/TEST*.xml'
        }
    }
}
