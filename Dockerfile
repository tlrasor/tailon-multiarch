FROM golang:alpine as build

RUN apk --no-cache add git &&\
    go get -v -u github.com/gvalkov/tailon


FROM alpine:3.7

RUN apk --no-cache add tzdata

WORKDIR /tailon
COPY --from=build /go/bin/tailon /usr/local/bin/tailon

ENTRYPOINT ["/usr/local/bin/tailon"]
EXPOSE 8080