FROM jenkins/jenkins:2.346.2
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN cat /usr/local/bin/install-plugins.sh
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml
RUN rm /var/jenkins_home/casc.yaml
COPY casc.yaml /var/jenkins_home/casc.yaml
