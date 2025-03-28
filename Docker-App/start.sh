#!/bin/bash

# Update i git
apt update
apt install -y git

# Klon repo
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
rm -rf src/test
# Dodanie skipTests do pom.xml
sed -i '/<\/plugins>/i\
    <plugin>\n\
      <groupId>org.apache.maven.plugins</groupId>\n\
      <artifactId>maven-surefire-plugin</artifactId>\n\
      <version>3.1.2</version>\n\
      <configuration>\n\
        <skipTests>true</skipTests>\n\
      </configuration>\n\
    </plugin>\n\
    <plugin>\n\
      <groupId>org.apache.maven.plugins</groupId>\n\
      <artifactId>maven-failsafe-plugin</artifactId>\n\
      <version>3.1.2</version>\n\
      <configuration>\n\
        <skipTests>true</skipTests>\n\
      </configuration>\n\
    </plugin>\n\
    <plugin>\n\
      <groupId>org.springframework.boot</groupId>\n\
      <artifactId>spring-boot-maven-plugin</artifactId>\n\
      <configuration>\n\
        <excludeDevtools>false</excludeDevtools>\n\
        <fork>true</fork>\n\
        <skip>true</skip>\n\
      </configuration>\n\
    </plugin>' pom.xml

# Budowanie apki bez testów

./mvnw clean package -Dmaven.test.skip=true

# Uruchomienie aplikacji
java -jar target/*.jar

