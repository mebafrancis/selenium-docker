FROM openjdk:8u191-jre-alpine

RUN apk add curl jq

#workspace
WORKDIR /usr/share/udemy

#Add Jars to image from host
ADD target/selenium-docker.jar selenium-docker.jar
ADD target/selenium-docker-tests.jar selenium-docker-tests.jar
ADD target/libs libs

#Add Suit files
ADD testng.xml  testng.xml

#Add healthcheck.sh
ADD healthcheck.sh healthcheck.sh

ENTRYPOINT sh healthcheck.sh

# ENTRYPOINT java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* -DBROWSER=$BROWSER -DHUB_HOST=$HUB_HOST org.testng.TestNG $MODULE