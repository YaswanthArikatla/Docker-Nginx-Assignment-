FROM golang:1.22-alpine AS builder

WORKDIR /goapp

COPY main.go .

RUN go build -o server main.go

FROM alpine:latest

WORKDIR /app
COPY --from=builder /goapp/server .

EXPOSE 8001

CMD ["./server"]
