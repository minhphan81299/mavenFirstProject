## Project Overview

Deploy a Java web application to tomcat running inside a docker using the Jenkins pipeline. 

---

## Setup the Enviroment

* Environment used is Ubuntu18 in cloud9.
* Jenkins with Blue Ocean Plugin & Pipeline-AWS Plugin.
* AWS account with IAM role created.

### Install Docker on Ubuntu:

* [Install Docker](https://docs.docker.com/engine/install/ubuntu/) 

### Install Java JDK 8 on Windows, Mac or Ubuntu:

* [Documentation by https://www.ntu.edu.sg/](https://www.ntu.edu.sg/home/ehchua/programming/howto/JDK_HowTo.html)

### Install Maven:

* Ubuntu - `sudo apt-get install maven -y`
* Windows - [Documentation by https://maven.apache.org/](https://maven.apache.org/install.html)

## To Deploy through Jenkins(CI/CD):

### Install Jenkins on [Ubuntu](https://pkg.jenkins.io/debian-stable/): or [Refer Documentation for others](https://www.jenkins.io/download/)

* `wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -`
* `sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ >> /etc/apt/sources.list'`
* `sudo apt-get update`
* `wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.204.6_all.deb`
* `sudo apt install ./jenkins_2.204.6_all.deb -y`
* `sudo systemctl start jenkins`
* `sudo systemctl enable jenkins`
* `sudo systemctl status jenkins`

### Set up AWS credentials in Jenkins:

* Click on the “Credentials” link from the sidebar.
* Click on "(global)" from the list, and then "Add credentials" from the sidebar.
* Choose "AWS Credentials" from the dropdown, add ID, description and fill in the AWS Key and Secret Access Key generated when the IAM role was created.

### Creating Jenkins Pipeline:

* In Jenkins, Click "Open Blue Ocean" and click "New Pipeline".
* Select GitHub from the options available, a token needs to be generated. A link to https://github.com/settings/tokens/new?scopes=repo,read:user,user:email,write:repo_hook needs to be clicked to generate a token for Jenkins to use and Make sure you copy the token and save it.
* After pasting the token into the form in Jenkins, click "connect", and your account should show up.
* Next, select the repo that was created, and click "create pipeline."
* In the page where the job shows, there is a gear icon - click on it to edit the job directly. Find the "Scan repository triggers" and click on "Periodically if not otherwise run," and select an interval of 2 minutes.

#### If there is any Docker permission denied:
Like this - Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
* Add the docker group if it doesn't already exist: `sudo groupadd docker`
* Add the user "jenkins" to the docker group: `sudo usermod -a -G docker jenkins`
* Then restart Jenkins: `sudo service jenkins restart`

## To deploy manually inside Docker without Jenkins:

* mvn build - `mvn clean install package`
* Docker image build - `docker build -t travelblog .`
* Remove any running Container - `./stop-container.sh`
* Run Docker Container - `docker container run --name tbcontainer -p 8000:8080 -d travelblog`

## To just run the Java Web-Application in Tomcat:

* mvn build - `mvn clean install package`
* Find out where your tomcat is located.
* Copy your war file into TOMCAT_HOME/webapps - `target/travelblog-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/`
* Start Tomcat - TOMCAT_HOME/bin/startup.sh

## In Webpage:

* Paste the IP and append “/travelblog” on the end in the browser.
