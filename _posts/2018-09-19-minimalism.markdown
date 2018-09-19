---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Minimalism
==========

#### Less is more, more or less

The basic premises of Minimalism as an approach to software development
are to write as little code as possible, to leave everything with the
default settings until a change is needed, and to defer adding any
features, functions, UI elements, validation or anything else not
explicitly defined in the acceptance criteria, wireframes, visual
designs.

Commonly this is mistaken for lazy, but takes an incredible amount of
hard work and dedication to achieve. It's always tempting to
add-this-to-that, refine-this, and defensively code to protect against
conditions that can never happen.

#### Leave it alone

If you can avoid changing something, it's generally better to avoid
changing it. For example, it would be fairly straightforward to create a
CSS pre-processor just for correcting the horrible and ugly incorrect
spelling of 'color'. Unfortunately we are stuck with this mistake
universally across all web browsers and will have to live with it, and
creating something that allows us to code with the correct spelling of
'colour' would be nothing more than code for codes sake.

Another area where this applies is system defaults. If you don't have a
value-driven reason to alter something then leave it alone. Optimisation
is another area where this applies, particularly with JVM options and
garbage collection settings. Just leave it alone until forced to make a
change.

#### Unless you have a reason, it doesn't matter

for a code-minimalist, the only legitimate reasons to make a change have
a quantifiable business value in the form of cost savings, increased
revenue, or improvements to the development turnaround that outweigh the
effort to make the change. Without this, it's unwelcome code.

#### YAGNI++

Seriously though, there are things you need but are far too easily
missed from the requirements. Security is often a casualty, and so can
performance both in terms of scalability and concurrency. Functionality
takes priority as it's easier to rationalise.

Design can suffer from this when constrained to a framework like
Bootstrap, but this seems to be less of a problem as most designers seem
to conform to the 960px 12-column grid.
