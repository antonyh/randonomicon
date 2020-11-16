---
layout: post
date: 2020-10-01 08:59:59 +000
title: Choices for Web Analytics
categories: saas, seo
comments: true
sharing: true
icon: bath
---
Web analytics are tools to capture data on website visitors, aggregate them, then present them in a way that enables formulation of actionable insights.

There are a number of decent choices for web analytics.

### Google Analytics
Pros: 
* free (as in beer)
* generally good
* easy to install
* baked into many other products
* lots of guides and help online
* the realtime view is good for rapid testing

Cons: 
* uses sampling, does not capture all data.
* Google has general privacy issues
* Somewhat more complex than it needs to be
* The actionable part is questionable.
* has moderate limits after which it needs a subscription
* is now pushing gtag.js to include GTM
* there's a ton of things that just don't work as they should, like search console integration issues, and flaky page speed calculations that are always zero.
* commonly blocked by most ad-blockers and privacy tools, further degrading accuracy of data

### Matomo / Piwik
* free, open source
* cloud SaaS or self-hosted
* Pricing reasonable
* Limited data retention in the lower tiers


### Countly
* Self hosted 'community' edition
* Enterprise, cloud based SaaS option
* Pricing for Enterprise is secret making it hard to gauge



### Fathom



### Adobe Analytics

* Enterprise grade with enterprise pricing

I'll leave that there. 


## Log file analysers

These tools look at the server-side logs to collect data instead of requiring installation into the html/js of the web pages.

* only reads logs
* no frontend aspect
* doesn't really track user interactions in the same way as the others
* caches affect the records
* you need standard format log files, which rules out SaaS and some other ways of hosting.
* not always real time stats, but then again neither are the other forms of analytics

### Analog

https://en.wikipedia.org/wiki/Analog_(program)
https://www.c-amie.co.uk/software/analog/

Well I was surprised to see this still going. Great log file analysis tool, or was back in its heyday. It might not be the best option now, but is worth considering for non-cacheable, personalised, or completely dynamic content.


### Webtrends

This seems to be only for Sharepoint. 

### Webalizer

Super retro cool. 

http://www.webalizer.org/


### AWstats

Another super retro option.

https://github.com/eldy/awstats


## Summary

Everyone has different needs, different objectives, different data to work with. With that in mind, it may be worth using one active (embedded into page) solution combined with a passive (server log) analyser to get the best results.
