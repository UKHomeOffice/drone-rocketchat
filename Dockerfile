FROM quay.io/ukhomeofficedigital/dsa-alpine
ADD run.sh /bin/
RUN chmod +x /bin/run.sh
RUN apk -Uuv add curl ca-certificates
ENTRYPOINT /bin/run.sh
