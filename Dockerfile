FROM ubuntu:19.04
WORKDIR /opt
RUN apt update && apt install -y wget libssl-dev libgmp-dev libtool autoconf build-essential
RUN wget https://github.com/XDagger/xdag/archive/0.3.1.tar.gz -O - | tar --strip-components 1 -C /opt -xzf -
RUN cd client && make


FROM ubuntu:19.04
SHELL ["/bin/bash", "-c"]

RUN mkdir -p /opt/coin
WORKDIR /opt/coin
COPY --from=0 /opt/client/xdag .

RUN apt update && apt install -y libssl1.1
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 7667
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
