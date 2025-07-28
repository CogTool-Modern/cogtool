---
title: Front matter
date: 2012-05-23T03:04:25+00:00
layout: app_help
---
# User Guide

**Version 1.2**

**May 23, 2012**

Bonnie E. John<br>
IBM T. J. Watson Research Center<br>
Software Productivity<br>
19 Skyline Drive, Hawthorne NY 10532<br>
{{ site.weburl }}<br>
Addendum to CogTool Version 1.2 © IBM 2012<br>
CogTool User Guide Version 1.1 © Bonnie E. John and Carnegie Mellon University 2008, 2009

### Addendum for CogTool Version 1.2 

CogTool 1.2 is essentially the same as CogTool 1.1 for making
storyboards and predicting skilled performance time. Therefore, this
User Guide presents the new features of CogTool 1.2 here and then the
User Guide for version 1.1 follows in its entirety.

### New platforms for CogTool 1.2 

CogTool 1.2 now runs in Windows 7, Mac OS 10.6 (Snow Leopard), and Mac
OS 10.7 (Lion).

### Improvements to the GUI in CogTool 1.2 

**Widget Tool Tips**
In response to user requests, we have expanded the tool tips on the
Widget Toolbar in
Frame Editing windows. The tooltips now contain the prose in
**Appendix B: Types of Widgets and When to Use Them** (but continue to
refer to that appendix if you want to see pictures of example
widgets).
![](/assets/user-guide/media/image2.jpg)
**Transition Properties Pane now contains source & destination
information** Formerly only available by rolling over a transition in
a Design window, the source and destination of a transition are now
displayed in the transition's property pane as well.
![](/assets/user-guide/media/image5.png)

### Changed or new functionality in CogTool 1.2 

**Default starting position of the hands**
Formerly defaulting to starting on the keyboard, our users told us
that most of their tasks start with the user's hand on the mouse.
CogTool 1.2 now defaults to starting with the hand on the mouse, if a
mouse is one of the available devices.
(This will not effect the initial starting position of the hands in
existing models made with versions prior to 1.2.)
**Numeric results in the Project Window can now be changed in the**
**Preferences dialog**
Prior to v1.2, the Project window always displayed the predictions of
skilled task execution time in seconds with three decimal places.
Users of CogTool found this misleading because the predictions are
known to be within +-10% of what you would find if you could collect
data of skilled users performing these tasks. To make communicating
the results more plausible, we have added two adjustments in the
Preferences dialog box.
![](/assets/user-guide/media/image8.png)
Setting the number of decimal places to 3 and not checking the
"Display range" box retains the Project window as it appeared prior to
version 1.2, as shown below.

![](/assets/user-guide/media/image9.png)

But you can now change this presentation of results. For example,
setting the number of decimal places to 1 and checking the "Display
range" box highlights the fact that GoogleNotebook is faster than the
other two designs for this task, but Gmail and Wetpaint are not
sufficiently different to be detected by CogTool models.

![](/assets/user-guide/media/image10.png)

You can reset all parameters to CogTool's default values (displaying 1
decimal place, but no range) by clicking the new "Reset to Default
Values" button.
**Modeling dragging on touch screen devices.**
You can now model dragging on touch screen devices with transitions
called "Up Tap" and "Down Tap." Just use a Down-Tap self-transition on
the widget where the drag starts and an Up-Tap transition on a widget
where the drag ends. (See this explained for dragging with a mouse in
Section 4.4.6.3 Dragging Over Text to Highlight It.)
**Widgets can now have a remote label**
Most widgets can now have what we call a "remote label" which will
make using CogTool as a prototyping tool more realistic. For example,
a group of check boxes often has some text asking a question that the
user can answer by checking one or more of the checkboxes. This test
is represented as a remote label of a standard checkbox widget, as
shown below. The remote label is connected to the widget (or widget
group) that owns it with a dashed line.
![](/assets/user-guide/media/image12.png)
The remote label is itself a widget of Type Text, so you can model
interacting with it as you would any other text in an interface.
If your interface is complex, it is possible that the remote label
might be quite far from the widget that owns it, so when a widget is
selected, you can find its remote label by clicking on the
[Find] link, which will select the remote label (below).
Likewise, when a remote label is selected, you can always find its
owner by clicking on the link below
"Remote Label Owner:"
![](/assets/user-guide/media/image14.png)

![](/assets/user-guide/media/image16.jpg)

**CogTool User Guide**

**Version 1.1**

**17 September 2009**

Bonnie E. John, Principle Investigator
Human-Computer Interaction Institute
School of Computer Science
Carnegie Mellon University {{ site.weburl }}

© 2008, 2009 Bonnie E. John and Carnegie Mellon University

CogTool User Guide • 1

### Acknowledgments

The following people have contributed to CogTool. We would like to thank
them for their hard work and patience with the process.

Gus Prevas, Ken Koedinger, Peter Centgraf, Mike Horowitz, Alex Eiser,
Alex Faaborg, Sandy Esch, Jason Cornwell, Lily Cho, Don Morrison,
Samantha Konwinski, Carmen Jackson, Josh Ehlke, Ryan Myers, Diana Dill,
Leigh Johnston, Chris Monti, Melissa Gallagher, Annie Luo, Brett Harris,
Khaled Ziyaeen, Alonso Vera, Collin Green, Guy Pryzak, Mike Feary, Rick
Lewis, Mason Smith, Andrew Howes, Peter Pirolli, Wai-Tat Fu, Victoria
Bellotti, Dario Salvucci, Lance Sherry, Maricel Medina Mora, Marylin
Hughes Blackmon, Peter Polson, Karl Fennel, and all the students in HCI
Methods and Cognitive Crash Dummies courses at Carnegie Mellon, Stanford
and professional conferences.

This research was supported by funds from the Office of Naval Research,
N00014-03-1-0086, NASA Ames Research Center, DSO National Laboratories,
the Boeing Corp., NEC, and IBM. The views and conclusions contained in
this document are those of the authors and should not be interpreted as
representing the official policies, either expressed or implied, of the
Office of Naval Research, NASA, DSO National Laboratories, Boeing, NEC,
IBM or the U. S. Government.

### Conventions for this User Guide

CogTool runs on both Macintosh (10.3 and above) and Windows (XP and
Vista) operating systems. Unless otherwise stated, this User Guide
uses pictures from the Macintosh version, but it operates and looks
almost the same on Windows platforms.
There are several ways to accomplish most tasks in CogTool, often
using menus from the menu bar, keyboard shortcuts, or context menus.
In the body of this user guide, we generally present the procedures
for these tasks using the menus from the menu bar, but we also list
available shortcut keys in the left margin next to the appropriate
commands as well as in **Appendix G: CogTool Shortcut Keys**. We list
context menus in **Appendix H: CogTool Context Menus.**
We capitalize the first letter of words that have specific meaning in
CogTool, (e.g., Project, Frame, and Widget) and bold commands (e.g.,
From the **File** menu, choose **New Project**). When we reference
another section or appendix, we write the full name (with number and
subtitle) and bold it (as in the previous paragraph).

We use special graphics to denote the following items:
<ul>
<li class="icon fyi">Notes that explain the behavior of CogTool</li>
<li class="icon tip">Tips for efficient or alternative ways to complete tasks</li>
<li class="icon warning">Warnings of potential problems and ways to avoid them</li>
<li class="icon remember">Information to remember while using CogTool</li>
<li class="icon bug">Documented bugs in CogTool (bugs are fixed more often than the User Guide is revised, and so you may not encounter these bugs in your version of CogTool)</li>
</ul>



 
