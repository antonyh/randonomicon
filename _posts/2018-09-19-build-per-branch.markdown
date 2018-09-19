---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jenkins
---
Jenkins build per branch
========================

<http://entagen.github.io/jenkins-build-per-branch/>

1\. install plugins

git gradle, known as \"Gradle plugin\" groovy, known as \"Hudson Groovy
plugin\"

2\. hit update on plugins page otherwise it doesn't download gradle.

in fact, anytime you see 'invalid tool id' when you are trying to
auto-install things like gradle, maven, and other external tools that
are set up via global config, this seems to be the solution. This rather
helpfulling converts the text boxes for version into dropdown lists,
making it much easier to select a valid option.

3\. add a installer for gradle, version 1.8, in the global system
configuration. It doesn't seem to work with v2.0 or later.

If you do try Gradle 2, you'll get a message like

    Could not find method groovy() for arguments [org.codehaus.groovy:groovy-all:1.8.8] on root project

source: <https://github.com/entagen/jenkins-build-per-branch/issues/68>

4\. create a freestyle job, named 'SyncYOURPROJECTGitBranchesWithJenkins'

5\. tell the job to use git, and clone
'https://github.com/entagen/jenkins-build-per-branch.git'

6\. add a build step to run a gradle script. Add these details:

Invoke Gradle, Gradle Version 1.8 - this will have the name you entered
in the global configuration.

Switches:

    -DjenkinsUrl=http://localhost:8080/jenkins -DgitUrl=git@github.com:mygithandle/myproject.git -DtemplateJobPrefix=MyProject -DtemplateBranchName=master -DnoViews=true -DdryRun=true

Tasks: syncWithRepo

As 'dryRun=true' it won't make any changes, but to be safe you should
have a good backup just in case.

7\. Make sure you have a template job that builds, using the 'master'
branch (unless you changed it in the switches settings in step 6 to use
a different branch). Create the templates in the format
\"Project-Task-Branch\", such as \"MyProject-build-master\"

8\. Create a view and give it a useful name like 'MyProject'. Set this to
use a regex to display jobs,

    (MyProject).*

This will show all the related jobs in a view.

Troubleshooting.

As with installing any new Jenkins plugins;

1\. be prepared to remove/restore jenkins to a prior good state.

2\. restarting jenkins solves a whole bunch of problems.

3\. try hitting 'update' on the plugin page - it has side effects that
can help.

4\. read the job console messages, they often have the answer.

5\. if you get a failure with status code 404, check the url to jenkins
in the switches, and the url to the git repo.

6\. If you get an exception similar to this message

    Exception in thread "main" java.lang.AssertionError: Unable to find any jobs matching template regex: ^(MyProject-[^-]*)-(master)$
    You need at least one job to match the templateJobPrefix and templateBranchName suffix arguments. Expression: (templateJobs?.size() > 0)

then this indicates that it was unable to find the template you use for
the master branch to apply it to the other branches. You need to check
names and spelling carefully of both the template job and in the
switches setting.

7\. it doesn't do anything

Have you removed the dry run option? Strangely, setting it to false
still causes a dry run and prevents changes, so you need to remove the
option completely.
