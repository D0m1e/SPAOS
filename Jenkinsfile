pipeline {
    agent any

    environment {
        IMAGE_NAME = 'jenkins-builder'
        RPM_FILE = 'rpm/RPMS/x86_64/calculate-files-1.0-1.x86_64.rpm'
        DEB_FILE = 'deb/calculate-files_1.0-2_amd64.deb'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${IMAGE_NAME} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d --name jenkins-container ${IMAGE_NAME}'
                }
            }
        }

        stage('Install RPM or DEB') {
            steps {
                script {
                    if (fileExists(RPM_FILE)) {
                        sh "docker exec jenkins-container rpm -ivh ${RPM_FILE}"
                    } else if (fileExists(DEB_FILE)) {
                        sh "docker exec jenkins-container dpkg -i ${DEB_FILE}"
                    }
                }
            }
        }

        stage('Execute Script') {
            steps {
                script {
                    sh "docker exec jenkins-container /bin/bash /path/to/calculate-files.bash"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    sh 'docker stop jenkins-container'
                    sh 'docker rm jenkins-container'
                }
            }
        }
    }

    post {
        always {
            sh 'docker rmi ${IMAGE_NAME}'
        }
    }
}
