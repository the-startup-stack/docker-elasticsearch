# Elastic docker image

<a href="http://the-startup-stack.com">
  ![the-startup-stack](http://aviioblog.s3.amazonaws.com/logo-black.png)
</a>

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

### Boot2docker

If you are running boot2docker, you need to make sure 9200 and 9300 are exposed

If the image (boot2docker VM) is already running run this command:

```
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port92000,tcp,,9200,,9200"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port9300,tcp,,9300,,9300"
```

If not, run this command

```
  VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port92000,tcp,,9200,,9200"
  VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port9300,tcp,,9300,,9300"
```

### Contribution

[Read Here](https://github.com/the-startup-stack/docs#contribution-guide)

## LICENSE

MIT
