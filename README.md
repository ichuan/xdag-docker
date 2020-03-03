# xdag-docker
Dockerfile for xdag (<https://github.com/XDagger/xdag>)


# Building

```bash
docker build -t xdag .
```

# Running

```bash
# block dir
mkdir data
# first time, generate keys
docker run --restart always -it --name xdag -v `pwd`/data:/opt/data -p 7667:7667 xdag
# later, just run as daemon
docker run --restart always -itd --name xdag -v `pwd`/data:/opt/data -p 7667:7667 xdag
# You can overwrite pool address by env `pool_addr`
docker run --restart always -itd --name xdag -e "pool_addr=solo.xdag.org:13655" -v `pwd`/data:/opt/data -p 7667:7667 xdag
```


# Using pre-built docker image

```bash
docker run --restart always -itd --name xdag -v `pwd`/data:/opt/data -p 7667:7667 mixhq/xdag
```
