FROM golang:1-alpine as builder
WORKDIR /go/src/app
COPY . .
RUN go build /go/src/app/rocks.go

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app /go/src/app
CMD ["/go/src/app/rocks"]