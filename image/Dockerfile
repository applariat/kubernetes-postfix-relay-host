FROM alpine:3.4
MAINTAINER Chris Dornsife <chris@applariat.com>

RUN apk add --no-cache postfix rsyslog supervisor \
    && /usr/bin/newaliases \
    && postconf 'mynetworks = 10.0.0.0/8,127.0.0.0/8,172.17.0.0/16' \
    && postconf 'smtp_sasl_auth_enable = yes' \
    && postconf 'smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd' \
    && postconf 'smtp_sasl_security_options =' \
    && postconf 'smtputf8_enable = no' \
    && postconf 'always_add_missing_headers = yes'

COPY . /

EXPOSE 25

ENTRYPOINT [ "/tx-smtp.sh" ]

