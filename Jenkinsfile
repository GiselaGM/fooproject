pipeline
{
    agent any
    stages
    {
        stage('Checkout')
        {
            steps
            {
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
        stage('newman')
        {
               steps
                {
                sh 'newman run "Restful Booker.postman_collection.json" --environment "Restful Booker.postman_environment.json" --reporters cli, junit'
                }
                    post
                    {
                            always
                            {
                                 junit '**/*xml'
                            }
                    }
        }
    }
            post
            {
                always
                {
                    junit '**/TEST*.xml'
                }
            }


}
