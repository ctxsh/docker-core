# Base Containers

Base containers used for ctx.sh kubernetes projects.

## Containers:

### Deploy

The base for all of all ctx.sh containers .  It contains a python minimal installation, jq, and the jinja cli with yaml support for generating configurations from templates. 

* [ctxsh/base:1.0](https://hub.docker.com/layers/ctxsh/base/v1.0/images/sha256-b232cafcadc2c232ad5fd5bbe06a97a41461f6771f53b3bb3a51db5149bcc043?context=explore)

### Java

Java containers providing the AdoptOpenJDK binaries.  Builds for both JDK and JRE are included.

* [ctxsh/java:jdk8](https://hub.docker.com/layers/ctxsh/java/jdk8/images/sha256-54d54094e092a8364a5722533ee12514d7ac662de3212f986a994a30efb47a6b?context=explore)
* [ctxsh/java:jre8](https://hub.docker.com/layers/ctxsh/java/jre8/images/sha256-5f2ad409a59228ce3ce90c1ddd625d9bc68aae26c645ea84013e5463be52c448?context=explore)
* [ctxsh/java:jdk11](https://hub.docker.com/layers/ctxsh/java/jdk11/images/sha256-ced146ac2b9a41eb6102ae53feac5c29258eee7f09cfac6061e88205bec430d7?context=explore)
* [ctxsh/java:jre11](https://hub.docker.com/layers/ctxsh/java/jre11/images/sha256-9122c69a527612aba324ab6296e22a19c564e90edf65395e02d39aae0f55c8d9?context=explore)
* [ctxsh/java:jdk14](https://hub.docker.com/layers/ctxsh/java/jdk14/images/sha256-ca63ffc6c81df640045f3863e5ff6e4b62c0e76138eb406d261f163f61089072?context=explore)
* [ctxsh/java:jre14](https://hub.docker.com/layers/ctxsh/java/jre14/images/sha256-9f610a976e2fb6a5d3bcddf622fa9098020df8663799e9af0615067bd37a12e8?context=explore)