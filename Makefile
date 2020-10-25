PREFIX := $(HOME)
MAKE_PATH := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DOCKERHUB_USER ?= ctxsh

.PHONY: all
all: base java

###################################################################################################
# Base
###################################################################################################
.PHONY: base
base:
	@docker build \
		--tag $(DOCKERHUB_USER)/base:v1.1 \
		--file docker/Dockerfile.base \
		docker

.PHONY: release-base
release-base:
	@docker push $(DOCKERHUB_USER)/base:v1.1

###################################################################################################
# Utils
###################################################################################################
.PHONY: utils
utils:
	@docker build \
		--tag $(DOCKERHUB_USER)/utils:v1.0 \
		--file docker/Dockerfile.utils \
		docker

.PHONY: release-utils
release-utils:
	@docker push $(DOCKERHUB_USER)/utils:v1.0

###################################################################################################
# Java
###################################################################################################
.PHONY: java
java: jdk8 jre8 jdk11 jre11 jdk14 jre14

.PHONY: release-java
release-java: release-jdk8 release-jre8 release-jdk11 release-jre11 release-jdk14 release-jre14

###################################################################################################
# Java build and release targets
###################################################################################################
.PHONY: jdk8
jdk8:
	@docker build \
		--build-arg "URL=https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09_openj9-0.20.0/OpenJDK8U-jdk_x64_linux_openj9_linuxXL_8u252b09_openj9-0.20.0.tar.gz" \
		--tag $(DOCKERHUB_USER)/java:jdk8 \
		--file docker/Dockerfile.java \
		docker

.PHONY: release-jdk8
release-jdk8:
	@docker push $(DOCKERHUB_USER)/java:jdk8

.PHONY: jre8
jre8:
	@docker build \
		--build-arg "URL=https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09_openj9-0.20.0/OpenJDK8U-jre_x64_linux_openj9_linuxXL_8u252b09_openj9-0.20.0.tar.gz" \
		--tag $(DOCKERHUB_USER)/java:jre8 \
		--file docker/Dockerfile.java \
		docker

.PHONY: release-jre8
release-jre8:
	@docker push $(DOCKERHUB_USER)/java:jre8

.PHONY: jdk11
jdk11:
	@docker build \
		--build-arg "URL=https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.7%2B10_openj9-0.20.0/OpenJDK11U-jdk_x64_linux_openj9_linuxXL_11.0.7_10_openj9-0.20.0.tar.gz" \
		--tag $(DOCKERHUB_USER)/java:jdk11 \
		--file docker/Dockerfile.java \
		docker

.PHONY: release-jdk11
release-jdk11:
	@docker push $(DOCKERHUB_USER)/java:jdk11

.PHONY: jre11
jre11:
	@docker build \
		--build-arg "URL=https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.7%2B10_openj9-0.20.0/OpenJDK11U-jre_x64_linux_openj9_linuxXL_11.0.7_10_openj9-0.20.0.tar.gz" \
		--tag $(DOCKERHUB_USER)/java:jre11 \
		--file docker/Dockerfile.java \
		docker

.PHONY: release-jre11
release-jre11:
	@docker push $(DOCKERHUB_USER)/java:jre11

.PHONY: jdk14
jdk14:
	@docker build \
		--build-arg "URL=https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.1%2B7_openj9-0.20.0/OpenJDK14U-jdk_x64_linux_openj9_linuxXL_14.0.1_7_openj9-0.20.0.tar.gz" \
		--tag $(DOCKERHUB_USER)/java:jdk14 \
		--file docker/Dockerfile.java \
		docker

.PHONY: release-jdk14
release-jdk14:
	@docker push $(DOCKERHUB_USER)/java:jdk14

.PHONY: jre14
jre14:
	@docker build \
		--build-arg "URL=https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.1%2B7_openj9-0.20.0/OpenJDK14U-jre_x64_linux_openj9_linuxXL_14.0.1_7_openj9-0.20.0.tar.gz" \
		--tag $(DOCKERHUB_USER)/java:jre14 \
		--file docker/Dockerfile.java \
		docker

.PHONY: release-jre14
release-jre14:
	@docker push $(DOCKERHUB_USER)/java:jre14

###################################################################################################
# Utility targets
###################################################################################################
clean:
	@docker rm $(shell docker ps -qa) || true
	@docker rmi $(shell docker images -q $(DOCKERHUB_USER)/base) --force || true
	@docker rmi $(shell docker images -q $(DOCKERHUB_USER)/java) --force || true
	@docker rmi $(shell docker images -q $(DOCKERHUB_USER)/utils) --force || true
