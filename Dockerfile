
FROM rockylinux:8.8 as reposync
MAINTAINER Vince Skahan "vinceskahan@gmail.com"

RUN yum install -y yum-utils rpm-sign findutils vim pinentry
COPY mirror-repos.sh /tmp
COPY setup.sh /tmp
COPY resign-it.sh /tmp
CMD ["bash", "/tmp/mirror-repos.sh"]

