pipeline {
    agent any

    parameters {
        string(name: 'registry_url', defaultValue: '')
	    string(name: 'image_name', defaultValue: 'st_base_image')
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
        //         sh "aws ecr get-login"
        //         sh "docker image push ${params.registry_url}:latest"
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
