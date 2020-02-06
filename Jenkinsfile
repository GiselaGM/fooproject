 pipeline{
 agent anystages {
        stage('Checkout') {
        steps {
        git 'https://github.com/USERNAME/REPO.git'
        }
        }
        stage('Build') {
        steps {
        bat "mvn compile"
        }
        }stage('Test') {
        steps {
        bat "mvn test"
        }
        post {
        always {
        junit '**/TEST*.xml'
        }
        }
        }
        }
        }