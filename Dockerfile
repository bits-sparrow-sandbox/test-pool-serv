FROM golang:1.21-alpine

WORKDIR /opt/build

COPY . .

RUN go mod download

RUN go build -o main .

RUN mkdir -p /opt/bin/
RUN cp /opt/build/main /opt/bin/
RUN cp /opt/build/entrypoint.sh /opt/bin/
RUN chmod +x /opt/bin/main
RUN chmod +x /opt/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
