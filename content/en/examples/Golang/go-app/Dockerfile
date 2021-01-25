# Build executable stage
FROM golang
ADD . /app
WORKDIR /app
RUN go build
ENTRYPOINT /app/app
# Build final image
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /app/app .
CMD ["./app"]
