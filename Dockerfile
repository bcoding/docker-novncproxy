FROM ubuntu:latest

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install python git && \
  rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/kanaka/noVNC.git

# Set environment variables.
ENV HOME /root
EXPOSE 6080

# Define working directory.
WORKDIR /root

CMD /noVNC/utils/launch.sh --vnc $VNC_HOST:$VNC_PORT
