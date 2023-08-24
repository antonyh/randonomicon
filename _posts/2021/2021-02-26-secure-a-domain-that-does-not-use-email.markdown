---
layout: post
date: 2021-01-26 08:59:59 +000
title: A guide for securing domains that don't send or receive email
description: What should you do to prevent bad actors abusing domains that don't send email.
categories: email, sysops, devops, security
comments: true
sharing: true
icon: envelope-o
---
What should you do for email settings on vanity or parked domains that will neither send nor receive email? It's fairly simple to lock them down and reduce the risk introduced by bad actors sending you messages that you don't want or impersonating your domain to send out spam.

### Prevent your domain from receiving email

This one is easy. All you need to do is remove the MX records from your DNS entries and there's no way for your domain to receive mail. 

### Mark your domain as not sending mail

This is a little more complex but still a one line change to DNS records. You need to use SPF to inform other mail services who is permitted to send email on behalf of your domain. In this case, nobody. Add this record to DNS:

    @ 10800 IN TXT "v=spf1 -all"

That's a TXT record for '@' with a value of "v=spf1 -all"

### Bonus: DKIM/DMARC blocking

It's not strictly needed, but I also add these to further enhance the blocks and help make fake email get marked as spam:

    *._domainkey 1800 IN TXT "v=DKIM1; p="
    _dmarc 1800 IN TXT "v=DMARC1;p=reject;sp=reject;adkim=s;aspf=s;fo=1;"

This should help reject even more email. 


### Where did these ideas come from

I've used the ideas from https://www.gov.uk/guidance/protect-domains-that-dont-send-email with some alterations. 

Notably, there's no need to set empty MX records - they just need to be removed.

### Checking email configuration

It's important to validate DNS settings to know they will be interpreted correctly. The UK GOV article suggests a NCSC check service tool but sadly this is only available for use by the UK public sector. 

The best tool available online appears to be https://mxtoolbox.com/SuperTool.aspx

Commandline tools that can help validate the DNS entries include nslookup and dig, but only if you know how to interpret the results. There's plenty of information online already such as http://knowledge.ondmarc.redsift.com/en/articles/1519838-looking-up-spf-dkim-and-dmarc-records-in-dns so their's little need to repeat it here.

There's also online versions of nslookup and dig, like the ones at http://www.kloth.net/ that are valuable because they run online and use different DNS servers. 

Finally, you can test in the obvious way - by sending email as if it was from an email address on the protected domain, and by sending an email to the domain. Naturally both should fail and bounce.

