FROM golang:1.12.9-stretch

LABEL MAINTAINER Edmilson Alferes <edmilson.alferes@gmail.com>

ENV ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
ENV ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
ENV ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
ENV ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"

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

# Download packages
RUN cd /go/src/terraform-azure-resources/test && dep ensure -v

# Define workdir test
WORKDIR /go/src/terraform-azure-resources/test

CMD go test