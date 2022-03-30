FROM bde2020/hadoop-base:2.0.0-hadoop2.7.4-java8
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:50070/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name

RUN curl -LO http://mirror.vorboss.net/apache/pig/pig-0.17.0/pig-0.17.0.tar.gz
RUN tar xzf pig-0.17.0.tar.gz

ENV PATH $PATH:/pig-0.17.0/bin

VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50070

CMD ["/run.sh"]
