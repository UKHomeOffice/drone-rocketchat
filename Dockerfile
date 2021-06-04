FROM quay.io/ukhomeofficedigital/dsa-alpine
RUN mkdir -p /APP/scripts/
RUN apk -Uuv add curl ca-certificates
ENV USERMAP_UID 1000
WORKDIR /APP/scripts/
COPY scripts/ /APP/scripts/run.sh
RUN adduser -D -H 1000 && chown -R 1000:1000 /APP
RUN chmod -R +x /APP/scripts/
RUN chown -R 1000:1000 /APP/scripts
USER ${USERMAP_UID}
ENTRYPOINT run.sh
