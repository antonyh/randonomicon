---
layout: post
date: 2023-12-30 08:59:59 +000
title: GCP (Google Cloud) notes 
description: When using the gcloud tool with CloudSQL and CloudRun, if you really want to get ahead, use the command line instead of the slow and cumbersome web interface.
categories: gcp,devops,cloud
comments: true
sharing: true
icon: cloud
navigable: true
---

Often the most efficient way to handle cloud services is through the shell. Typing commands has precision and an efficiency of speed that is unmatched by GUI or TUI interfaces. It has the huge advantage of integration with CI/CD pipelines and can have templates applied, dynamic commands generated, or interactions controlled by other systems such as Jenkins. On top of all that, it's human-readable and human-modifiable - a significant factor when developing systems that must be understood by people and machines. 

# Formats available for import/export in gcloud

We can learn about the current available import/export formats for gcloud cli with a simple topics command.

    gcloud topic formats

At the time of writing this the list of formats is as follows:

* config 
* csv 
* default 
* diff 
* disable
* flattened 
* get 
* json 
* list 
* multi 
* none 
* object 
* table 
* text 
* value 
* yaml

Notable in its absence is XML but this is unlikely to cause problems for the majority of use-cases. For the most part, YAML presents itself as the best option when interacting with the gcloud tools.

# USing cloudsql and postgresql

## List the available databases in postgresql

    gcloud sql databases list --instance=«postgresql-instance»

## Create a database in postgresql

    gcloud sql databases create «db-name» --instance=«postgresql-instance»

# Working with cloudrun services

## How to list your services

We can list services across all regions with one simple command.

    gcloud run services list

Usefully, this will also tell us which region for each service. This is vital for the other commands.

## Importing and exporting service definitions

### How to export as yaml

Note the lack of .yaml in the exported filename.

Region is required along with service-name.

    gcloud run services describe «service-name» --region=«region» --format=yaml > «service-name»

### How to import as yaml

This requires cloud resource manager API `[cloudresourcemanager.googleapis.com]` to work.

Imports the «service-name» file into the service. It should match exactly, without .yaml extension. Similar to the export command, we must inform gcloud which region the service resides in otherwise the request will fail.

    gcloud run services replace «service-name» --region=«region»

