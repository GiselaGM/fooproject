 pipeline{
 agent anystages {
        stage('Checkout') {
        steps {
        git 'https://github.com/USERNAME/REPO.git'
        }
        }
        stage('Build') {
        steps {sh "mvn compile"
        }
        }stage('Test') {
        steps {
        sh "mvn test"
        }
        post {
        always {
        junit '**/TEST*.xml'
        }
        }
        }
        }
        }