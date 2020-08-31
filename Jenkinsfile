pipeline {
	agent any
		stages {
			stage('Build') {
				steps {
					echo "Building.. ${GIT_URL}"
					sh 'make'
				}
			}
			stage('Test') {
				steps {
					echo 'Testing..'
				}
			}
			stage('Deploy') {
				steps {
					echo 'Deploying....'
				}
			}
		}
}
