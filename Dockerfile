FROM kurron/docker-jetbrains-base:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="RubyMine" org.kurron.ide.version=2016.3.1

ADD https://download.jetbrains.com/ruby/RubyMine-2016.3.1.tar.gz /tmp/ide.tar.gz

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    rm /tmp/ide.tar.gz

ENV RUBYMINE_JDK=/usr/lib/jvm/oracle-jdk-8

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/bin/rubymine.sh"]
