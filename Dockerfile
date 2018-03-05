FROM golang:1.10 as build

RUN go get -u github.com/mazebuhu/multi-docker-build

WORKDIR /go/src/github.com/mazebuhu/multi-docker-build

RUN GOOS=linux go build -o hello main.go

FROM alpine:latest

COPY --from=build /go/src/github.com/mazebuhu/multi-docker-build/hello .
CMD ["/hello"]