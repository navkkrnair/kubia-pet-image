FROM openjdk:8-jdk-alpine
ENV APPROOT="/usr/nobody"
WORKDIR $APPROOT    
ADD target/kubia-pet-image-1.0.jar $APPROOT
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*
EXPOSE 8080
ENTRYPOINT ["java"]
CMD ["-jar","-Xmx128m","-Xms128m","-Djava.security.egd=file:/dev/./urandom", "/usr/nobody/kubia-pet-image-1.0.jar"]