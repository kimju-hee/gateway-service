FROM gitpod/workspace-full

# Helm 설치
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# kubectl 설치
RUN sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && \
    sudo apt-get update && \
    sudo apt-get install -y kubectl

# Azure CLI 설치
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Java & Maven
RUN sudo apt-get install -y openjdk-17-jdk maven

COPY init.sh /init.sh
RUN chmod +x /init.sh
