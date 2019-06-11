pipeline {
    agent any

    parameters {
        string(name: 'registry_url')
	    string(name: 'registry_credentials')
	    string(name: 'image_name')
    }

    triggers {
        pollSCM('* * * * *')
    }

    options {
        ansiColor('xterm')
    }

    stages {
        stage('Build Image') {
            steps {
                sh "docker image build --no-cache -t ${params.image_name}:latest ."
            }
        }

        // stage('Deploy Image') {
        //     steps {
        //         sh "docker image push ${params.image_name}:latest"
        //     }
        // }

        stage('Remove Unused Image') {
            steps{
                sh "docker image rm ${params.image_name}:latest"
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
