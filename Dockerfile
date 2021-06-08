FROM quay.io/ukhomeofficedigital/python-alpine:3.7.6-alpine3.11
ADD rocket /bin/
RUN apk -Uuv add ca-certificates
ENTRYPOINT /bin/rocket
