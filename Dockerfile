FROM ubuntu:16.04
LABEL maintainer="w3bt00lz"

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y libldns-dev git build-essential wget libglib2.0-dev php7.0 nano python-requests python-dnspython python-argparse dnsutils

RUN wget https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz && \
    tar xvf go1.10.1.linux-amd64.tar.gz && \
    mv go /usr/local

ENV GOPATH "/root/work"
ENV PATH "$PATH:/usr/local/go/bin:$GOPATH/bin"
ENV GOBIN "$GOPATH/bin/"

RUN go get github.com/w3bt00lz/meg && go get github.com/w3bt00lz/waybackurls

RUN git clone https://github.com/w3bt00lz/megplus.git

WORKDIR /megplus
RUN chmod 777 megplus.sh
RUN git clone https://github.com/w3bt00lz/Sublist3r.git

ENTRYPOINT ["./megplus.sh"]
