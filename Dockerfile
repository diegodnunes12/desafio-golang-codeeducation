FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -mod vendor -o main main.go


FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["/app/main"] 
