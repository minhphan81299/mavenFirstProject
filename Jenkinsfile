pipeline{
    agent any
    stages {
       stage('Checkout'){
            steps{
                git branch: 'main',credentialsId: 'gitCredential', url: 'https://github.com/minhphan81299/mavenFirstProject.git'
            }
            
        }
        stage('mvn build'){
	        steps {
	  
	            bat 'mvn clean install package'
	        }
	    }
	    stage('Build docker image'){
	        steps {
	            bat 'docker build -t travelblog .'
	        }
	    }
	    stage('Run Docker Container'){
	        steps{
	            bat 'stop-container.sh'
	            bat 'docker container run --name tbcontainer -p 8000:8080 -d travelblog'
	        }
	    }

}
}
