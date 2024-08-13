FROM golang:latest AS builder

WORKDIR /usr

COPY go-project/program.go .

RUN go build -o program program.go

FROM scratch

COPY --from=builder /usr/program /program

CMD ["./program"]

