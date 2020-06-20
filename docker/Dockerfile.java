FROM ctxsh/base:v1.0

ENV LANG C.UTF-8

ENV JAVA_HOME /opt/java
ENV PATH $JAVA_HOME/bin:$PATH

ARG URL

RUN : \
    && mkdir /opt/java \
    && curl -sL $URL | tar zxf - -C /opt/java --strip-components=1 \
    && :
