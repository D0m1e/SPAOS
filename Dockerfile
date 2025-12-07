FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    rpm \
    dpkg-dev \
    alien \
    git \
    curl \
    && apt-get clean

RUN jenkins-plugin-cli --plugins "workflow-aggregator git"

RUN mkdir -p /var/jenkins_home/workspace

USER jenkins

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
