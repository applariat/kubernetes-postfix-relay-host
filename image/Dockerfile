FROM alpine:3.13
MAINTAINER Chris Dornsife <chris@applariat.com>

RUN apk add --no-cache postfix rsyslog supervisor \
    && /usr/bin/newaliases

COPY . /

EXPOSE 25

ENTRYPOINT [ "/tx-smtp-relay.sh" ]

