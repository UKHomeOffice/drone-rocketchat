FROM quay.io/ukhomeofficedigital/python-alpine:3.7.6-alpine3.11
RUN mkdir -p /APP/scripts/
RUN apk -Uuv add curl ca-certificates
WORKDIR /APP/scripts/
COPY scripts/ /APP/scripts/
RUN chmod -R +x /APP/scripts
RUN chmod -R 777 /APP/scripts
ENTRYPOINT sh /APP/scripts/run.sh
