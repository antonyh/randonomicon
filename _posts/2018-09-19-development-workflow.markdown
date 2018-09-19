---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
digraph G

graph\[compound=true\]; node \[shape=hexagon, style=\"filled\",
fontname=\"Verdana\", fontsize=10\];

subgraph EXTERNAL node \[fillcolor=lightyellow\]; info
\[shape=underline, label=\"The development workflow\",
fillcolor=lightgrey\] \# person \[label=\"Person\", shape=tripleoctagon,
fillcolor=lightyellow\]; \# SCM \[label=\"SCM\", shape=egg,
fillcolor=lightpink\];

subgraph FeatureDevelopment

node \[fillcolor=lightblue\]; dev \[label=\"Programmer\",
shape=tripleoctagon, fillcolor=lightyellow\]; releaser
\[label=\"Releaser\", shape=tripleoctagon, fillcolor=lightyellow\];

featurebranch \[label=\"Feature \", shape=egg, fillcolor=lightpink\];
masterbranch \[label=\"Master \", shape=egg, fillcolor=lightpink\];
ansiblebundle \[label=\"Ansible \", shape=egg, fillcolor=lightpink\]
demobranch \[label=\"Demo \", shape=egg, fillcolor=lightpink\];

branchsync \[shape=rounded\]

jenks \[label=\"Jenkins CI \", shape=circle\]; democloud
\[label=\"DemoCloud Stack\", fillcolor=palegreen\] nexus \[label=\"Nexus
server\", shape=circle\]; portaladmin \[label=\"Portaladmin \",
shape=circle\]; int \[label=\"INT AEM Stack\", fillcolor=palegreen\];

dev -\> featurebranch \[label=\"Commit feature branch\"\]; featurebranch
-\> jenks \[label=\"Build on change\"\]; nexus -\> jenks
\[label=\"Supply Maven artefacts\"\];

releaser -\> nexus \[label=\"Cut release\"\]; releaser -\> masterbranch
\[label=\"Cut release\"\];

featurebranch -\> demobranch;

demobranch -\> releaser \[label=\"Merge tested changeset\"\];
masterbranch -\> jenks \[label=\"Build on change\"\]; demobranch -\>
jenks \[label=\"Build on change\"\];

ansiblebundle -\> jenks \[label=\"Deploy demo/int\"\];

jenks -\> portaladmin \[label=\"Run Ansible\"\]; jenks -\> democloud
\[label=\"Run Ansible\"\]; portaladmin -\> int;

jenks -\> branchsync -\> jenks;

nexus -\> portaladmin \[label=\"Supply build artefacts\"\];
