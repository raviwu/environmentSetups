.PHONY: jenkins-initialize jenkins-run jenkins-remove

jenkins-initialize:
	make jenkins-remove
	mkdir -p ${HOME}/.jenkins/init.groovy.d
	cp jenkins/loadPlugins.groovy ${HOME}/.jenkins/init.groovy.d/loadPlugins.groovy
	java -Djenkins.install.runSetupWizard=false -Djenkins.CLI.enabled=true -jar jenkins/jenkins-2.138.3.war --httpPort=9090

jenkins-run:
	java -Djenkins.install.runSetupWizard=false -Djenkins.CLI.enabled=true -jar jenkins/jenkins-2.138.3.war --httpPort=9090

jenkins-remove:
	rm -rf ${HOME}/.jenkins
