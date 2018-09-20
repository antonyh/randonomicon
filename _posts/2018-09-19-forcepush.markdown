---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: git
---
Force push
==========

To 'force push' is exactly as it sounds, to forcefully push your changes
onto a remote. Opinions are split on this feature, as it is considered
highly hazardous.

On one hand, this is a useful feature to change the history to correct
an error.

On the other hand, this doesn't guarantee that everyone can accept those
changes - particularly if they have branched or committed updated with
the expectation that history does not change.

I fall into the latter camp; force-push is an evil that has no place in
the vast majority of projects and should be outlawed. The edge case is
when you actually do need to remove something from the history, usually
large binaries or passwords. Having had the misfortune to have to do
this, I know first hand how error-prone and difficult this is, and how
easy it is for the removed history to reappear from a clone of the
remote.

In order to force push, you use a git push command with an option to
cause it to replace the data on the remote:

    git push --force
    # or
    git push --force-with-lease

The first variant is a full-on overwrite of history on the remote. This
is the darkest kind of evil.

The second variant --force-with-lease is a milder but still bastardly
thing to do. It will overwrite history on the remote if the histories
align. This only means that the remote you are using has no updates - it
doesn't mean that others working on the same code haven't done changes
but not yet pushed them. It's entirely possible to have branches that
can neither pull nor push as you've just changed the premise upon which
they were built.

So please, I beg you, just use pull & merge, have a few extra commits in
the log, and avoid all the stresses that are attached to this evil
feature. There are ways to do it safely, but this is beyond most and
just adds too much complexity what should be an otherwise simple
development workflow. I for one don't need the headaches that --force
brings. Thankfully, this can be controlled by the administrators of some
Git servers like Stash, GitHub Enterprise, and GitLab to block and
force-push updates, and it is possible to use git hooks to manage this
as well. There's an example here that might be helpful -
<https://gist.github.com/pixelhandler/5718585>
