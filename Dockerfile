FROM golang:1.10.0-alpine

RUN apk update \
  && apk add git make curl perl bash build-base && rm -rf /var/cache/apk/*

# install glide package management.
RUN curl https://glide.sh/get | sh

# install golang tools
RUN go get -u gopkg.in/alecthomas/gometalinter.v1
RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/mattn/goveralls

WORKDIR $GOPATH
