FROM quay.io/ukhomeofficedigital/python-alpine:3.7.6-alpine3.11
RUN mkdir -p /APP/scripts/
ENV USERMAP_UID 1000
WORKDIR /APP/scripts/
RUN apk -Uuv add curl ca-certificates
COPY scripts/ /APP/scripts/run.sh
RUN adduser -D -H 1000 && chown -R 1000:1000 /APP
RUN chmod -R +x /APP/scripts/
RUN chown -R 1000:1000 /APP/scripts
USER ${USERMAP_UID}
ENTRYPOINT /APP/scripts/run.sh
