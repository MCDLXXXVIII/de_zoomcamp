FROM alpine:3.15
RUN apk --no-cache add postgresql13-client netcat-openbsd
WORKDIR /app
COPY . /app
RUN chmod +x ./run.sh
CMD ["./run.sh"]
