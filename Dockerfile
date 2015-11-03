FROM quay.io/njuaplusplus/ubuntu:14.04
MAINTAINER Shengwei An (njuasw#gmail.com)

COPY run.sh /app/

RUN chmod u+x /app/run.sh

CMD ["/app/run.sh"]
