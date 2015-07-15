# Elastic docker image

![the-startup-stack](http://aviioblog.s3.amazonaws.com/small-logo-stack.png)

the-startup-stack project [Read More](https://github.com/the-startup-stack/docs#what-is-the-startup-stack)

## Installation

### Pull and run elasticsearch

For the sake of the example `<data-dir>` will be `data` in the current folder.

* Run `docker pull thestartupstack/elasticsearch`
* Create persistent/shared directories `<data-dir>`
* Create Elasticsearch config file at `<data-dir>`.

```
path:
  logs: /data/log
  data: /data/data
```

* Start the container  
```
docker run -p 9200:9200 \
 --name elastic -d -p 9300:9300 \
 -v "$PWD/data":/data \
 thestartupstack/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
```

### Contribution

[Read Here](https://github.com/the-startup-stack/docs#contribution-guide)

## LICENSE

MIT