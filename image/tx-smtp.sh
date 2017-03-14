#!/bin/sh

RELAY=${TX_SMTP_RELAY?Missing env var TX_SMTP_RELAY}
USERNAME=${TX_SMTP_RELAY_USERNAME?Missing env var TX_SMTP_RELAY_USERNAME}
PASSWORD=${TX_SMTP_RELAY_PASSWORD?Missing env var TX_SMTP_RELAY_PASSWORD}


# create sasl_passwd.db
echo "${RELAY} ${USERNAME}:${PASSWORD}" > /etc/postfix/sasl_passwd || exit 1
postmap /etc/postfix/sasl_passwd || exit 1
rm /etc/postfix/sasl_passwd || exit 1

# Override what you want here.
postconf "relayhost = ${RELAY}" || exit 1
postconf 'myhostname = tx-smtp.applariat.com' || exit 1

/usr/bin/supervisord -n