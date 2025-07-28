---
title: Overview
date: 2012-05-23T03:04:25+00:00
layout: app_help
---
## Chapter 1: Overview

### 1.1 What is CogTool?
CogTool is a user interface (UI) prototyping tool that can produce
quantitative predictions of how users will behave when the prototype
is ultimately implemented. Thus, CogTool provides you with a rapid and
inexpensive way to explore a large variety of UI ideas, compare them,
and narrow down the options to a handful of designs to be empirically
tested with users. You can rapidly analyze competitor's products as
part of a competitive analysis and compare new ideas with an existing
version of the system to ensure that the new design is better than the
old one.

CogTool's prototyping tool follows the HCI maxim "Make frequent tasks
easy and infrequent tasks possible". That is, it is fast and easy to
construct a UI prototype with standard UI widgets like menus, context
menus, buttons, links, check boxes, radio buttons, pull-down lists,
etc. It is possible, although slightly more labor-intensive, to mockup
more unusual interfaces like pie menus or the slide bar on the iPhone. CogTool also exports prototypes to HTML, so you can share your designs
with colleagues or perform quick & dirty user tests.

CogTool's quantitative predictions are based on extensive prior
research in cognitive psychology. CogTool uses a "cognitive
architecture" called ACT-R (Anderson and Lebiere, 1998) to simulate
the cognitive, perceptual and motor behavior of humans interacting
with the prototype to accomplish tasks the UI designer has defined. CogTool reliably predicts the task execution time for skilled users of
the UI (John, et. al., 2004; Luo & John, B., 2005). Recent research
has demonstrated the ability to predict the exploration behavior of
novice users (Teo & John, 2008a,b; Teo, John & Pirolli, 2007) and the
power consumption profile of mobile devices dependent on the methods
user choose to accomplish tasks (Luo, 2008; Luo & Siewiorek, 2007);
these research results will migrate into the released version of
CogTool as time and funding allow.

### 1.2 How CogTool Works

There are three steps to producing quantitative predictions of human
performance with CogTool:

1.  Create any number of prototypes of interface designs you'd like to
    compare.

2.  Demonstrate any number of tasks on the prototyped designs.

3.  Compute human performance predictions and analyze the results.

As a prototyping tool, CogTool was inspired by James Landay's SYLK and
DENIM systems (Landay and Meyers, 1995; Lin, et. al., 2000). It
represents the states of a UI as a storyboard of frames; transitions
between those frames represent the actions a user can take to move
from one state to another. Each frame can contain widgets (e.g.,
buttons and menus) that users can act on, as well as ubiquitous input
devices like a keyboard or microphone, through which a user could also
change the state of the UI. A storyboard can be made from screenshots
of an existing product for benchmarking or competitive analysis, from
sketches of ideas you have drawn on paper or a whiteboard and then
digitized, or be created directly in CogTool on a blank canvas with
its widget creation tools.. You can use a storyboard as documentation
of your design ideas in either CogTool files (.cgt) or you can export
to HTML.

<figure markdown="1">

![](/assets/user-guide/media/image20.png)
    
<figcaption>Figure 1-1: Three windows from a CogTool Project comparing two tasks
on two designs. The Project window displays a grid where each column
is a different design, each row is a different task, and the
intersection of each column and row shows the prediction of skilled
execution time for that task on that design. The Design window is
where frames and the transitions between them are created. The Frame
window is where widgets are placed to represent how the design appears
in a particular state. (Designs and tasks in this example are from Nielsen & Phillips, 1993)</figcaption>
</figure>

To make predictions of how long it will take a skilled user to execute
a task on a UI design, simply demonstrate the task on the design.
CogTool uses the storyboard and the demonstration to produce a
computational cognitive model of a skilled user's performance. The
model that CogTool creates is based on the Keystroke-Level Model (KLM;
Card, Moran, and Newell, 1980) and implemented "under the hood" in
ACT-R (Anderson and Lebiere, 1998). KLM has been verified to be
reliable within 20% of observed human performance times in over 100
papers in the HCI literature. CogTool inherits at least this accuracy,
but is likely to be even more accurate because it generates the model
automatically, removing the need for the analyst to be trained in the
theory and practice of KLM (John, et. al., 2004).

<figure markdown="1">
![](/assets/user-guide/media/image21.jpg)
<figcaption>Figure 1-2: Three other windows from a CogTool Project comparing two
tasks on two designs. The Project window, as above, displays the grid
of designs, tasks and predictions. The Script window is where CogTool
records your demonstration of a task on a design and creates the
cognitive model. The Visualization window is you can see what ACT-R is
doing "under the hood" to produce the prediction.</figcaption>
</figure>

### 1.3 Uses of CogTool

As a prototyping tool, CogTool design storyboards can be used to

* Build and record design ideas in an interactive form
* Communicate interactive behavior to development teams or management
* Produce HTML for quick-and-dirty user testing.

While CogTool predictions are not intended to replace all user testing
if accurate estimates of skilled performance time is highly valuable
to your enterprise (e.g., if every second of a users time translates
into hundreds of thousands of dollars a year of revenue or expense, or
if a split second difference in performance time can save a life),
they can be used to

-   Compare design ideas, allowing you to explore widely, but only
    conduct expensive user tests with the few most promising ideas.
-   Compare competitors' products to your own during a competitive
    analysis or for marketing purposes.
-   Provide quantitative benchmarks for internal use during development
    to ensure that a new design is at least as efficient as the previous
    version.
-   Determine requirements during acquisition and test that the
    delivered system will meet those requirements.
-   Analyze an existing system for bottlenecks in user behavior,
    focussing your redesign effort on the aspects of the interface that
    need it most.

We hope you find CogTool useful in your work and would love to hear
from you with testimonials or suggestions. If you would like to share
your experience with us, please visit the CogTool website
({{ site.weburl }}/) and participate in our User Forums or send email
to cogtool\@cs.cmu.edu.
