FROM golang:1.21-alpine

WORKDIR /opt/build

COPY . .

RUN go mod download

RUN go build -o main .

RUN mkdir -p /opt/bin/
COPY --chown=0:0 --from=builder /opt/build/main /opt/bin/
COPY --chown=0:0 --from=builder /opt/build/entrypoint.sh /opt/bin/

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
