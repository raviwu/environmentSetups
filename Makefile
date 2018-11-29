.PHONY: jenkins-initialize jenkins-run jenkins-remove

jenkins-initialize: jenkins-remove jenkins-run

jenkins-run:
	java -jar jenkins/jenkins-2.138.3.war --httpPort=9090

jenkins-remove:
	rm -rf ~/.jenkins
