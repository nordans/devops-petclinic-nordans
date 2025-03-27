FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /container


EXPOSE 8080
COPY start.sh ./
# Setup an app user so the container doesn't run as the root user
RUN useradd tomcat
RUN chmod 711 start.sh



CMD ["./start.sh"]
~
