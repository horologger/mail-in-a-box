FROM ubuntu:22.04
LABEL maintainer="horologger <horologgerprotonmail.com>"

RUN apt-get -y update && \
    apt-get install -y htop lsof wget && \
    apt-get install -y curl jq vim && \
    VERSION=v0.0.1 && \
#    curl -sLk https://github.com/yudai/gotty/releases/download/$VERSION/gotty_linux_amd64.tar.gz \
#    | tar xzC /usr/local/bin && \
#    apt-get purge --auto-remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*


    
EXPOSE 80
EXPOSE 15888
EXPOSE 17888
EXPOSE 17935
EXPOSE 19888
EXPOSE 8080

#ENTRYPOINT ["/usr/local/bin/gotty"]

#CMD ["--permit-write","--reconnect","/bin/bash"]

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
