#!/bin/bash

apt update
apt install default-jdk wget git maven -y

# Pobierz i rozpakuj Tomcata
wget -c https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.5/bin/apache-tomcat-11.0.5.tar.gz
tar xzf apache-tomcat-11.0.5.tar.gz
mv apache-tomcat-11.0.5 /opt/tomcat
rm -rf apache-tomcat-11.0.5.tar.gz
git clone https://github.com/hellojeeban/bookstore-boot-app.git
cd bookstore-boot-app/bookstore
mvn install -DskipTests
mvn spring-boot:run
# Nadaj uprawnienia
chmod +x /opt/tomcat/bin/*.sh

# Uruchom Tomcata bez systemd
echo "✅ Uruchamiam Apache Tomcat..."
