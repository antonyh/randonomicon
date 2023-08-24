---
layout: post
title: Adobe AEM - Sightly drop targets
date:   2018-09-19 22:25:52 +0100
categories: adobe-aem, revise
---
Drop targets
============

<http://stackoverflow.com/questions/25143752/sightly-and-cqdroptargets>

Drop target is configured using node cq:dropTargets node under the
cq:editConfig and it doesn't depend on the used markup language.

The only thing that markup has to produce is a \<div\> tag with class
cq-dd-CONFIGNAME which will be used as a drop zone. Sightly can easily
generate such markup (below example will show it only in the edit mode):

    <div data-sly-test="${wcmmode.edit}" class="cq-dd-images">Drop image here</div>

<http://docs.adobe.com/docs/en/cq/5-6-1/developing/components.html#Configuring%20with%20cq:EditConfig%20Child%20Nodes>

<http://stackoverflow.com/questions/25185809/having-multiple-cqdroptargets-in-one-component>
