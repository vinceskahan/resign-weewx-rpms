
FROM rockylinux:8.8 as reposync
MAINTAINER Vince Skahan "vinceskahan@gmail.com"

RUN yum install -y yum-utils rpm-sign findutils vim
COPY mirror-repos.sh /tmp
COPY setup.sh /tmp
COPY resign-it.sh /tmp
CMD ["bash", "/tmp/mirror-repos.sh"]

# this is hideously wrong from a security standpoint
# this is hideously wrong from a security standpoint
# this is hideously wrong from a security standpoint
# this is hideously wrong from a security standpoint
# this is hideously wrong from a security standpoint
FROM reposync as resigner
MAINTAINER Vince Skahan "vinceskahan@gmail.com"
COPY seckey.asc /tmp
COPY pubkey.asc /tmp
