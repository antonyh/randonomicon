---
layout: post
date: 2020-06-18 08:59:59 +000
title: Pomodoros as Agile Storypoints
categories: agile
comments: true
---

A 'pomodoro' is a tomato, but as part of the Pomodoro Technique it's a unit of time, nominally 25 minutes, where someone can focus exclusively on a single task and defer any interuptions. 

A storypoint is a unit of effort to complete a task.

So, given that most tasks will take more than 25 minutes from start to completion, we can count how many pomodores are needed. If we can count it, it's a useful measure. If we can measure it, we can estimate it. 

Does this fit? We could neatly estimate the effort on the modified Fibonnaci scale commonly used in Agile estimation by the number of pomodores similar tasks have taken based on experience.

Now, depending on workpatterns this gives N pomodores a day. Let's say 8 - four hours of actual working time out of a standard 8 hour day. You might feel this is low, but let's run with it for now. You might think it high, but that depends on the other pressures on your time. 

8 P/day (two in each working hour) means that you'd hope to get a 8 point story done each day. That's just for a sense of scale.

A solid week of work would be 40 points. The next step up is 100 points, a good two weeks and the most you'd ever do in a common two-week sprint. Nothing to stop us going higher if we want - 200, 400, 1000 points - but that's just a clue to break it down further. 

At the other end of the scale, we have the tiny tasks. Things that can be done between meetings, or as 'filler' at the end of the day, or before the morning standup. Naturally, if it's small you already know how to do it and will have a good idea if it's possible in half an hour, or an hour. One or two pomodoro equating to one or two points would be appropriate here. 

The fun starts when we start to take into account stories involving multiple activities or multiple skills. Even if they are done by the same person, they should be estimated and assigned as separate tasks. Break everything down into defined actions. You'll get better estimates, more control, and smoother flow of work.

Imagine you have a story to add a new field to a database. You might have a story to add the field as one pomodoro, another to add an index as one pomodoro, and application code to update taking 40 pomodoros. Then user guides, other documentation, code review (it doesn't happen magically, account for it), testing, and so on. You can estimate, allocate the work, schedule it, sequence it, and track it much better. 

Because it's split into tasks, each team member has their own allocation of tasks. This is far cleaner than having one task and reallocating it when it 'moves down the production line' because that handover happens and momentum is lost or it sits on a queue and the next person has to interrupt the first worker to get context. It also helps with planning capacity and getting work done on schedule, which is hard to achieve when stories haven't been broken down and estimated.

The increase in scale by using the pomodoro as a time/effort unit has a few consequences. Larger numbers reduce the likelihood of underestimation, because the jump is 8 to 13 to 20 to 40, which is one day to 1.6 day to 2.5 day to 5 day. Compare this with the common use of story-points-as-days, this sequence is 1 day to 3 days to 5 days to 8 days to 13 days. Using a smaller unit of effort helps because there's a lot of tasks that can take a small amount of time. Pegging it to a day or half day is poor estimating and slow work.

What was a 3 point story now becomes a 13 point, and we can count the 25-minute blocks to chart progress, and revise future estimates.

Of course this breaks any comparison with historical values, but that would be expected and past performance isn't necessarily a good indicator of future velocity. It does enable comparison with other teams using the same scale concept, and a healthy sense of competition can really invigorate folk to work harder.

The downside is that not everyone will want to work using 25-minute time blocks and there will be some resistance but the benefits of this are wide. Being able to focus on a single task and leave messages until the 25 minutes is done is usually possible and removes elements of context switching that can drain concentration and impede work. You can read more about it here: [pomodorotechnique.com](https://pomodorotechnique.com)

The unanswered question: is the plural of pomodoro, pomodoros pomodores pomodorae or something else in this context?
