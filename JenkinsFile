pipeline {
    environment {
        registry_url = 'registry_url/' // USE THIS INSTEAD OF 'image_name'
        registry_credentials = ''
        image_name = 'st-base-image'
    }
    agent any
    options {
        ansiColor('xterm')
    }
    stages {
       //  stage('Clone Repo') {
       //     steps {
       //         git 'https://github.com/CodeWonderer/test-pipeline.git'
       //     }
       // }
        stage('Build Image') {
            steps {
                sh 'docker image build --no-cache -t $image_name:latest .'
            }
        }
        // stage('Deploy Image') {
        //     steps {
                // sh 'docker image push $image_name:latest'
        //     }
        // }
        stage('Remove Unused Image') {
            steps{
                sh "docker image rm $image_name:latest"
            }
        }
    }
    post {
        always {
            deleteDir()
            cleanWs()
        }
    }
}
