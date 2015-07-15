FROM java:8

ENV ES_VERSION elasticsearch-1.6.0

RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_VERSION.tar.gz && \
  tar xvzf $ES_VERSION.tar.gz && \
  rm -f $ES_VERSION.tar.gz && \
  mv /$ES_VERSION /elasticsearch

VOLUME ["/data"]

ADD config/entrypoint.sh /entrypoint.sh
COPY config/elasticsearch.yml /elasticsearch.yml
RUN chmod +x /entrypoint.sh
RUN chmod +x /elasticsearch.yml

WORKDIR /data
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/elasticsearch/bin/elasticsearch"]

EXPOSE 9200
EXPOSE 9300