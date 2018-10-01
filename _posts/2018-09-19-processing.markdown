---
layout: post
title: Processing (lang)
date:   2018-09-19 22:25:52 +0100
categories: processing, java
---
.pde files

void setup() size(1000, 500); //size(400, 400, PDF, \"output.pdf\");
background(0, 64, 0); fill(127,0,0);
//saveFrame(\"output-\#\#\#\#.png\"); int xcount = 100; int ycount = 50;
int x = width/xcount; int y = height/ycount; for (int j = 0; j \<
ycount; j++) for (int i = 0; i \< xcount; i++) fill(int(random(255)),
int(random(255)), int(random(255))); rect(i\*x,j\*y,x+(i\*x),y+(j\*y));
saveFrame(\"output-\#\#\#\#.png\");

void setup()

size(70, 70); //size(400, 400, PDF, \"output.pdf\"); background(0, 64,
0); fill(127,0,0); stroke(0); //saveFrame(\"output-\#\#\#\#.png\"); int
xcount = 7; int ycount = 7; int x = width/xcount; int y = height/ycount;
for (int j = 0; j \< ycount; j++) for (int i = 0; i \< xcount; i++)
fill(int(random(255)), int(random(255)), int(random(255)));
rect(i\*x,j\*y,x+(i\*x),y+(j\*y));

textSize(70);

fill(127); textAlign(RIGHT); text(\"h\", width-19, height-1);
text(\"t\", width-1, height-1); saveFrame(\"output2-\#\#\#\#.png\");

fill(255); // Fill color white textAlign(RIGHT); text(\"h\", width-18,
height); text(\"t\", width, height);
saveFrame(\"output2-\#\#\#\#.png\");
