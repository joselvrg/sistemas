
FROM golang:1.23.5 AS build

WORKDIR /app


COPY go.mod ./
RUN go mod download


COPY . ./


RUN CGO_ENABLED=0 GOOS=linux go build -o /chat ./cmd/chat

ENTRYPOINT ["/chat"]
