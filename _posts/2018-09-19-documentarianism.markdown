---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Documentarianism
================

#### If it isn't written down, it doesn't exist

There are some who believe that the only way to develop software is to
have specifications. It doesn't matter if this is in a formal document
in PDF or Work format, a Google Doc, a Wiki such as Confluence, or in
Jira tickets. It also doesn't matter if it's as elevator pitch format, a
list of acceptance criteria, a formal style or just a bullet list of
rules that the code must follow. The point is that they will code to the
letter of what is in writing, considering that if it's not set in stone
then it doesn't matter.

#### Everything becomes a specification

The upshot of this is that you have a fair idea what the code will do
before you build it. The downside is that anything that you don't ask
for is basically 'unspecified', which in software terms can be and often
is wildly variable. It can have far reaching consequences, ranging from
a lack of consistency in the UI to developers making assumptions on form
field validation (we all know what is said about assumptions). It's
usually the small things but they can quickly mount up - the large
features are always discussed at length or at the very least covered in
the task description in a way to make it clear enough what is needed.
It's the things that aren't needed or are expected to be as default,
standard, or 'best practice' that are open to interpretation, and
subsequently will be the points of contention later,
post-implementation.

#### Tool-centric behaviour

Unsurprisingly, this mindset tends to lean heavily on documentation and
task management tools, particularly with a focus on online collaboration
features. Trello, Jira, Confluence, Google Docs, and to some degree
online chat tools that keep a record (HipChat, Slack, Skype, Hangouts,
etc) all are used to capture requirements. This isn't for the sake of
the conversation - this philosophy isn't really concerned about the why,
only the values that are needed. The important part is that X=3, without
recording the rationale.

#### Can we ever have complete documentation?

As a result of recording the facts and figures but not the rationale,
documentation is usually concise but not necessarily complete. It tends
towards filling the perceived gaps during implementation - the
definitions of the edges of the system such as validation rules and what
is considered to be non-obvious logic. It may result in documentation
needing to be done up front breaking agile processes. It can result in
fragmentation of documentation, and in creating reference material that
will never be reviewed or read. Without the 'why' it can be hard to
understand the design decisions that have been made or even in some
cases who made them.
