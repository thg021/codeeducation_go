FROM golang:1.16.3-alpine3.13 AS builder

WORKDIR /usr/src/app 

COPY ./app . 

RUN go build -a hello .

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/hello .

CMD [ "./hello" ]
