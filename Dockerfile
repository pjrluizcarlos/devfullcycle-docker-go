FROM golang:alpine3.17 as builder
WORKDIR /src
COPY ./src .
RUN go build

FROM scratch
COPY --from=builder ./src/devfullcycle-docker-go .
ENTRYPOINT [ "./devfullcycle-docker-go" ]
