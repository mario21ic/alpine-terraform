FROM alpine:3.6
MAINTAINER Mario Inga <mario@yarkan.pe>

RUN apk update && apk add wget ca-certificates && wget -O /tmp/terraform.zip "https://releases.hashicorp.com/terraform/0.11.0/terraform_0.11.0_linux_amd64.zip" &&\
  unzip /tmp/terraform.zip && cp terraform /usr/sbin/terraform && rm -rf /tmp/terraform.zip &&\
  mkdir /app 

WORKDIR /app

COPY entrypoint.sh /etc/entrypoint.sh
ENTRYPOINT ["/etc/entrypoint.sh"]
