FROM golang:1.12.7-stretch

LABEL MAINTAINER Edmilson Alferes <edmilson.alferes@gmail.com>

# Install azure-cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install packages
RUN apt-get update && apt-get install zip -y

# Install go dep
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh 

# Install terraform
RUN wget https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip
RUN unzip terraform_0.12.5_linux_amd64.zip && mv terraform /usr/local/bin && rm -rf terraform_0.12.5_linux_amd64.zip

# Copy source code
RUN mkdir /go/src/terraform-azure-resources
COPY . /go/src/terraform-azure-resources