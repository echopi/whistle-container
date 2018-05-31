# whitle-container

Dockerizing whistle.

## start whistle

```sh
# pull image
docker pull jiewei/whistle-container:1.0.0-alpha

# start
docker run -dit --rm \
  --name whistle \
  -p 8899:8899 \
  jiewei/whistle-container:1.0.0-alpha

# enter whistle container

docker exec -it whistle /bin/bash
```

## How to build

```sh
docker  build . -t jiewei/whistle-container:1.0.0-alpha
```

## 常见问题

端口被防火墙拦截了？

```sh
# 注意替换 $port
firewall-cmd --zone=public --add-port=$port/tcp --permanent
```

[To expose the container's port on your localhost's port](https://github.com/wsargent/docker-cheat-sheet#exposing-ports):

```sh
# 注意替换 $port
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' whistle | { read ip; iptables -t nat -A DOCKER -p tcp --dport $port -j DNAT --to-destination $ip:8899 ; echo ip=$ip}
```
