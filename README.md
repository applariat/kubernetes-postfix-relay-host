# kubernetes-postfix-relay-host
A SMTP relay host for transactional based emails from within a k8 cluster.
 
## Overview
This repository contains Kubernetes config files and a docker image to easily set up a SMTP relay for services such as SendGrid.

## Background
We needed a simple docker image that can be configured with env vars. Also, the functionality is easily overridded by providing an alternate init script. 

# Quickstart
Run on docker
```
docker run --rm -it -p 2525:25 \
	-e TX_SMTP_RELAY_HOST="smtp.sendgrid.net" \
	-e TX_SMTP_RELAY_PORT=25 \
	-e TX_SMTP_RELAY_MYHOSTNAME=tx-smtp-relay.yourhost.com \
	-e TX_SMTP_RELAY_USERNAME=username \
	-e TX_SMTP_RELAY_PASSWORD=password \
	applariat/tx-smtp-relay

```

Note that all parameters except TX_SMTP_RELAY_PORT are required.  The default value for the port is 25.

Send a test message
<pre>
<b>telnet localhost 2525</b>
220 tx-smtp-relay.yourhost.com ESMTP Postfix
<b>helo localhost</b>
250 tx-smtp-relay.yourhost.com
<b>mail from: noreply@yourhost.com</b>
250 2.1.0 Ok
<b>rcpt to: chris@applariat.com</b>
250 2.1.5 Ok
<b>data</b>
354 End data with <CR><LF>.<CR><LF>
<b>Subject: What?</b>
<b>My hovercraft is full of eels.</b>
<b>.</b>
250 2.0.0 Ok: queued as 982FF53C
<b>quit</b>
221 2.0.0 Bye
Connection closed by foreign host
</pre>
