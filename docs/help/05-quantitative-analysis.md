---
title: Quantitative Analysis
date: 2012-05-23T03:04:25+00:00
layout: app_help
---
## Chapter 5: Quantitative Analysis

As discussed in the Overview, CogTool can make predictions of human
performance given the Design and some additional information about
Tasks. While CogTool's predictions of skilled execution time are to
within 20% of actual user data, and are thus not intended to replace
all user testing especially if more accurate time estimates are of
high value to your organization, they can be used to

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

In order to perform quantitative analysis with CogTool, you must
create Tasks and Demonstrations of those Tasks on your Design. Model
visualization illustrates how CogTool produced predictions about the
Tasks.

### 5.1 Tasks and Task Groups

#### 5.1.1 What are Tasks and Task Groups?
CogTool uses the concept of a Task to represent the purpose of a
specific sequence of actions, such as making a purchase on an online
web site or setting a ring tone on your cell phone. The Task is
basically a name for the sequence of steps that you Demonstrate on the
Design, which CogTool records in a Script and uses to compute
predictions.
A Task Group organizes the Tasks into a hierarchy, and can display the
sum, mean, minimum, or maximum prediction times for the Tasks in that
Group.
Tasks are created and manipulated in the Project window. The following
is a Project window with two Designs and two Tasks on those Designs.
These Tasks have not yet been demonstrated, so the cells at the
intersections of Task and Design are still blank.
![](/assets/user-guide/media/image161.jpg)


#### 5.1.2 Creating a New Task

When you create a Project, a Task named "Task 1" is automatically
inserted into the Project.
To create additional Tasks:

+--------------+------------------------------------------------------+
| **Mac:** ⇧T  | • From the **Create** menu, choose **New Task**.   |
|              |                                                      |
| **Win:**     | The new Task will appear below the Task that is      |
|              | currently selected.                                  |
| CTRL+SHIFT+T |                                                      |
|              | ![                                                 |
|              | ](/assets/user-guide/media/image17.jpg) |
|              | There is no limit on |
|              | the number of Tasks in a Project.                  |
|              |                                                    |
|              | ![                                                 |
|              | ](/assets/user-guide/media/image17.jpg) |
|              | When the new Task is |
|              | created, the Task name is already selected and     |
|              | ready for you to type in a meaningful name. The    |
|              | Task name can be anything you wish using the ASCII |
|              | printable character set, but it should be unique   |
|              | in the Task Group and descriptive of the Task. Try |
|              | to use a name that will continue to apply as the   |
|              | Design evolves over time.                          |
+--------------+------------------------------------------------------+

![](/assets/user-guide/media/image38.jpg)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_](http://act-r.psy.cmu.edu/)
[printable\_characters](http://act-r.psy.cmu.edu/) for the list of admissible characters.

#### 5.1.3 Creating a New Task Group
|              | Use Task Groups to organize your Tasks in a          |
|              | hierarchy. The Task Group can represent several      |
|              | different methods for accomplishing the same user    |
|              | goal (e.g., using the menu or a keyboard shortcut to |
|              | invoke a command). In this case, you might want to   |
|              | see the mean, maximum or minimum predicted times of  |
|              | the Tasks that make up the Group. Task Groups can    |
|              | also be used to represent a higher-level goal that   |
|              | is accomplished by performing Tasks in the Group     |
|              | (i.e., subTasks). For example, to send email (the    |
|              | Task Group) from Gmail (the Design), you have to log |
|              | in (subTask 1), compose the message (subTask 2), and |
|              | send (subTask 3). In this case, you would want to    |
|              | see the sum of the predictions of the subTasks in    |
|              | the Task Group.                                      |
|              |                                                      |
To create a Task Group: 

+--------------+------------------------------------------------------+
+==============+======================================================+
| **Mac:** ⇧G  | -   Select the Tasks that should be part of the Task |
|              |     Group.                                           |
| **Win:**     |                                                      |
|              | -   From the **Create** menu, choose **New Task      |
| CTRL+SHIFT+G |     Group**.                                         |
+--------------+------------------------------------------------------+

• The default value to be shown in the Task Group row is Sum. To
change it, right-click (PC ) or CTRL-click (Mac) on the word "Sum" and
select the desired value in the context menu (sum, mean, minimum,
maximum).
A Task Group can be comprised of Tasks and other Task Groups. There is
no limit to the number of Tasks or Task Groups that may be nested
within a Task Group.
![](/assets/user-guide/media/image17.jpg)
 When the new Task Group is created, its
name is already selected and ready for you to type in a meaningful
name. The Task Group name can be anything you wish using the ASCII
printable character set, but it should be unique in the Project and
descriptive of the group. Try to use a name that will continue to
apply as the Design evolves over time.
![](/assets/user-guide/media/image38.jpg)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.

#### 5.1.4 Selecting Tasks or Task Groups

In the Project window, click on a the name of a Task or Task Group to
select it. The entire row will turn bright blue to indicate selection.
![](/assets/user-guide/media/image17.jpg)
 Single-click selects a Task or Task
Group and highlights the whole row in bright blue. Double-click
selects the name of the Task or Task Group and highlights it for
editing in light blue.
To select multiple Tasks or Task Groups
• Shift-click on each Task or Task Group you want to select. Their
rows will turn bright blue to indicate selection.

#### 5.1.5 Cutting, Copying, and Pasting Tasks or Task Groups

To copy one or more Tasks or Task Groups:

-   Select one or more Tasks or Task Groups.

+-----------------+---------------------------------------------------+
| **Mac:** C      | • From the **Edit** menu, choose **Copy Task**  |
|                 | or **Copy Task Group.** The selected Tasks and  |
| **Win:** CTRL+C | Task Groups are on the clipboard, ready for     |
|                 | pasting.                                        |
+-----------------+---------------------------------------------------+

![](/assets/user-guide/media/image17.jpg)
 When you copy a Task or Task Group, it
does not copy any

Demonstrations or computed execution times associated with the Task or
Task Group. If you want to copy the Demonstrations and predictions as
well, duplicate the Task or Task Group instead.
To cut one or more Tasks or Task Groups:

-   Select one or more Tasks or Task Groups.

+-----------------+---------------------------------------------------+
| **Mac:** X      | -   From the **Edit** menu, choose **Cut Task**   |
|                 |     or **Cut Task Group.** The selected Tasks and |
| **Win:** CTRL+X |     Task Groups disappear and are on the          |
|                 |     clipboard, ready for pasting.                 |
| **Mac:** V      |                                                   |
|                 | To paste Tasks and/or Task Groups from the        |
| **Win:** CTRL+V | clipboard:                                        |
|                 |                                                   |
| **Mac:** D      | -   When in the Project window, from the **Edit** |
|                 |     menu, choose **Paste**.                       |
| **Win:** CTRL+D |                                                   |
|                 | ![](.                                           |
| **Mac:** R      | //media/image17.jpg) |
|                 | A Task or Task    |
| **Win:** CTRL+R | Group can be pasted into the same Project or    |
|                 | into a different Project.                       |
|                 |                                                 |
|                 | ![](.                                           |
|                 | //media/image17.jpg) |
|                 | When you paste a  |
|                 | Task into a Task Group or Project that already  |
|                 | has a Task of the same name, the pasted Task    |
|                 | will be given a unique suffix (e.g.             |
|                 | "MyTask\[1\]"). Likewise, when you paste a Task |
|                 | Group into a Project that already has a Task    |
|                 | Group of the same name, the pasted Task Group   |
|                 | will be given a unique suffix.                  |
|                 |                                                   |
|                 | 5.1.6 Duplicating Tasks or Task Groups            |
|                 |                                                   |
|                 | When you copy a Task, the Task name is copied,    |
|                 | but the demonstrations and computed execution     |
|                 | times are not. If you want to make an exact copy  |
|                 | of the Task, including demonstrations and         |
|                 | computed execution times, you should duplicate    |
|                 | the Task.                                         |
|                 |                                                   |
|                 | To duplicate one or more Tasks or Task Groups:    |
|                 |                                                   |
|                 | -   Select one or more Task or Task Group.        |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Duplicate    |
|                 |     Task** or **Duplicate Task Group**.           |
|                 |                                                   |
|                 | ![](.                                           |
|                 | //media/image17.jpg) |
|                 | Duplicated Tasks  |
|                 | are placed beneath the Task that has been       |
|                 | duplicated. The Duplicated Task is given a      |
|                 | unique suffix ("MyTask\[1\]").                  |
|                 |                                                 |
|                 | ![](./                                          |
|                 | /media/image59.png) |
|                 | You can also     |
|                 | duplicate a Task or Task Group by holding       |
|                 | Control (PC) or Option (Mac) while dragging to  |
|                 | a blank area of the Project window.             |
|                 |                                                   |
|                 | 5.1.7 Renaming a Task or Task Group               |
|                 |                                                   |
|                 | To rename a Task or Task Group:                   |
|                 |                                                   |
|                 | -   Select the Task or Task Group.                |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Rename       |
|                 |     Task** or **Rename Task Group**.              |
+-----------------+---------------------------------------------------+

OR

-   Double-click on the name of the Task or Task Group.

![](/assets/user-guide/media/image17.jpg)
 You may name the Task or Task Group
anything you wish using the ASCII printable character set. However,
you can have only one
Task with that name in a Task Group or at the top level of a
Project. Make the name meaningful and descriptive of the Task or
Task Group.
![](/assets/user-guide/media/image162.png)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.

#### 5.1.8 Deleting Tasks or Task Groups

To delete one or more Tasks or Task Groups:

• Select the Task or Task Group.

**Mac:**

**~Win:~** • From the **Edit** menu, choose **Delete Task** or **Delete
Task Group.** CTRL+DELETE

![](/assets/user-guide/media/image17.jpg)
 You will be asked to confirm the
deletion before the Task or Task Group is removed from the Project.
![](/assets/user-guide/media/image38.jpg)
When you delete a Task Group, you will also delete
all Tasks that are within that Group.

#### 5.1.9 Changing the Order of Tasks or Task Groups

You can change the order of Tasks or Task Groups in the Project window
by dragging the Tasks or Task Groups to the desired location.
You can also promote existing Tasks or Task Groups, which moves the
Task or Task Group up one level in the overall schema, or demote
existing Tasks or Task Groups, which moves them down one level.
Promotion or demotion can move a Task or Task Group into or out of a
Task Group.
To promote or demote Tasks or Task Groups:

-   Select the Task or Task Group.

-   To promote the Task or Task Group, press the **Tab** key (or select
    Promote from the Modify menu).

-   To demote the Task or Task Group, press the **Shift** and **Tab**
    key (or select Demote from the Modify menu).

#### 5.1.10 Changing the Display Value of a Task Group

Creating a Task Group allows you to group Tasks together and display
the sum, mean, minimum and maximum times of the Tasks in the Group.
You may wish to see the total time for a suite of benchmark Tasks, or
you may want to see the minimum, maximum, or mean value for all the
Tasks (see Figure 5-1).
To change the computed value for a Task Group:

-   Select the Task Group.

-   From the **Modify** menu, choose the type of value you wish to
    compute.

OR

-   Right-click (PC) or CTRL-click (Mac) on the word label (Sum, Mean,
    Min or Max) and select the desired value in the context menu (sum,
    mean, minimum, maximum)..

![](/assets/user-guide/media/image163.png)

Figure 5-1: The computed value has been set to the mean and is
displayed for all Designs in the Project.

### 5.2 Demonstrating How to Do a Task

CogTool can make predictions of task execution time for a skilled user
on a given Design. To do this, it needs a Design with Frames and
Transitions capable of doing the Task and a Demonstration of how to do
that Task. From this Demonstration, CogTool applies an algorithm
transforming the Demonstration into a Script, which is then turned
into cognitively valid code in a cognitive architecture called ACT-R.
This code is run in ACT-R and it produces a prediction of performance.
Thus, demonstrating how to do the Task is the final step in obtaining
predictions of human performance.

#### 5.2.1 What are Demonstrations and Scripts?
A Demonstration is exactly what it sounds like, you demonstrate how to
do each task on a Design. Your Demonstration is recorded in a Script,
which adds some steps to your Demonstration so that it is cognitively
plausible for a skilled user of your Design. For example, you may
demonstrate typing "ok" on the keyboard. If the user's hand started on
the mouse, then a cognitively plausible Script contains a movement
from the mouse to the keyboard (called "Home") so the "o" can be typed
with the right hand. When you demonstrate how to do your Tasks, you do
not have to remember to put in steps like Home, CogTool does it for
you. CogTool also adds "Think" operators in places where prior
research has shown that people tend to pause before performing
keystrokes or mouse actions; again, it is not necessary for you to
learn the rules for placing these Think operators because those rules
have been encoded into the operation of CogTool.
![](/assets/user-guide/media/image164.png)
You demonstrate how to do a Task and
CogTool creates a cogni tively-plausible Script.
![](/assets/user-guide/media/image17.jpg)
 A Demonstration is not a user test.
CogTool is not recording the time of your actions to make its
predictions. You can start a
Demonstration, go out for coffee in the middle, come back and
finish it, and CogTool will make the same predictions of skilled
execution time no matter how long it took you to complete the
Demonstration. CogTool is using prior research on human performance to
make its predictions from your demonstration, not a recording of the
time it took you to do the demonstration.

#### 5.2.2 The Script Windows
There are two types of windows invoked when doing a Demonstration, one
that lets you select the start Frame of the Demonstration and one
where you demonstrate the task and CogTool shows you the Script it
generates.

##### 5.2.2.1 The Select the Start Frame Window
The Select the Start Frame window has two panes. The left pane lists
the available Frames for that Design in alphabetical order. The right
pane contains a picture of the Design with thumbnails of the Frames
laid out spatially (see Figure 5-2).
If the Design's input Devices include the mouse and at least on other
Device, the bottom of the left pane contains an option to select the
Mouse Hand and Initial Hand Location.
![](/assets/user-guide/media/image165.png)
 When the Design has a mouse and a
touch screen as input devices, CogTool does not know how to home
between those two devices, nor does it know how to set the initial
location of the hand correctly. Demonstrations will work, but
predictions will not include the time to home between the mouse and
the touchscreen Device.
![](/assets/user-guide/media/image166.jpg)

Figure 5-2: The Select the Start Frame window

##### 5.2.2.2 The Script Edit Window
The Script Edit window appears once a starting Frame has been
selected. or when a previously-demonstrated Script is opened. This
window has two panes (see Figure 5-3).
The left pane shows the current Frame with its Widgets ad Devices that
are available for interaction.
Under the Frame are two buttons used to insert special steps into the
Script. One inserts a **Look at** Widget step and the other inserts a
**Think** step (discussed below).
The right pane shows the Script Step List. The steps that you have
demonstrated are shown in white; steps that are logically linked to
demonstrated steps are shown in gray (e.g., clicking on a menu item is
logically preceded by clicking on a menu header); steps that CogTool
placed automatically are shown in yellow. See the Appendix "Steps
Placed Automatically by CogTool" if you are curious about how CogTool
places these steps and why.
Buttons at the bottom of the right pane allow you to Delete Step and
Compute. If the Design's input devices include the keyboard and mouse
or touchscreen, you can select the Mouse Hand and Initial Hand
Location. in this region.
If you click on a step in the right pane, the left pane changes to
show the Frame in which that step acted. You can walk through the
whole task easily by clicking on the first step and using the
down-arrow key to display the Frames as they would appear to the user.
Details on working with Scripts start with **Section 5.2.5
Demonstrating Actions for a Script**.
![](/assets/user-guide/media/image182.png)

Figure 5-3: The Script Edit window

#### 5.2.3 Opening a Script for Editing

To open or edit a Script, do one of the following:
• Click on a cell at the intersection of a Task and a Design.

+--------------------------+------------------------------------------+
| **Mac:** E               | -   From the **Edit** menu, choose       |
|                          |     **Edit Script**.                     |
| **Win:** CTRL+E          |                                          |
|                          | OR                                       |
| **Zoom In**              |                                          |
|                          | -   Double-click a cell at the           |
| **Mac:** =               |     intersection of a Task and a Design. |
|                          |                                          |
| **Win:** CTRL+=          | 5.2.4 Selecting a Start Frame for the    |
|                          | Script                                   |
| **Zoom Out**             |                                          |
|                          | Since a Task may begin at any Frame in   |
| **Mac:** **Win:** CTRL+- | the Design, you must select the Start    |
|                          | Frame for each Script. The first time    |
| **Normal Zoom**          | you open a Script, you will be presented |
|                          | with the Select the Start Frame window.  |
| **Mac:** 0               |                                          |
|                          | To select the starting Frame, do one of  |
| **Win:** CTRL+0          | the following:                           |
|                          |                                          |
| **Zoom to Fit**          | -   Double-click on the Frame in the     |
|                          |     right pane or the Fame name in the   |
| **Mac:** /               |     left pane                            |
|                          |                                          |
| **Win:** CTRL+/          | OR                                       |
|                          |                                          |
|                          | -   Choose the Frame from either pane,   |
|                          |     then click the Start Demonstrating   |
|                          |     button.                              |
|                          |                                          |
|                          | If the keyboard and the mouse or         |
|                          | touchscreen are input devices in your    |
|                          | Design, buttons at the bottom of the     |
|                          | left pane will allow you to choose the   |
|                          | Mouse Hand and the Initial hand          |
|                          | location. These options are also         |
|                          | available in the Demonstration Script    |
|                          | window.                                  |
|                          |                                          |
|                          | ![](/assets/user-guide/media/image                     |
|                          | 183.jpg){width="1.1944444444444445e-2in" |
|                          | height="                               |
|                          | 2.985564304461942e-3in"}![](/assets/user-guide/media/ima |
|                          | ge185.png) |
|                          | height="2.666666666666667e-2in"}!      |
|                          | [](/assets/user-guide/media/image186.png) |
|                          | height="                               |
|                          | 7.666666666666666e-2in"}![](/assets/user-guide/media/ima |
|                          | ge187.png) |
|                          | height="                               |
|                          | 6.666666666666667e-2in"}![](/assets/user-guide/media/ima |
|                          | ge188.jpg) |
|                          | height="4.777777777777778e-2in"} When  |
|                          | the Design has a mouse and a touch     |
|                          | screen as input devices, CogTool does  |
|                          | not know how to home between those two |
|                          | devices, nor does it know how to set   |
|                          | the initial location of the hand       |
|                          | correctly. Demonstrations will work,   |
|                          | but predictions will not include the   |
|                          | time to home between the mouse and the |
|                          | touchscreen Device.                    |
|                          |                                          |
|                          | Once the starting Frame has been         |
|                          | selected, the Script Edit window will    |
|                          | appear. The starting Frame appears in    |
|                          | the left pane of the Script Edit window  |
|                          | and the current list of steps appears in |
|                          | the right pane. At this point, the list  |
|                          | of steps only includes the name of the   |
|                          | starting Frame.                          |
|                          |                                          |
|                          | You can use the same zoom commands that  |
|                          | you used when you created and edited the |
|                          | Frames to allow you to see the Frame     |
|                          | better.                                  |
|                          |                                          |
|                          | To use the zoom commands, do one of the  |
|                          | following:                               |
|                          |                                          |
|                          | -   From the Modify menu, choose the     |
|                          |     Zoom option you want.                |
|                          |                                          |
|                          | OR                                       |
|                          |                                          |
|                          | -   Choose your zoom settings from the   |
|                          |     box at the bottom of the Frame       |
|                          |     window.                              |
|                          |                                          |
|                          | ![](/assets/user-guide/media/i                         |
|                          | mage17.jpg) |
|                          |                                        |
|                          |  **Normal |
|                          | Zoom** makes the contents of the frame |
|                          | revert to the default size. **Zoom     |
|                          | to** Fit makes the contents of a frame |
|                          | fit the available space in the window. |
+--------------------------+------------------------------------------+

#### 5.2.5 Demonstrating Actions for a Script

##### 5.2.5.1 Simple Demonstration
You can record steps for the Script by interacting with the Frame in
the left pane in a way similar to how a user would interact with the
actual device. Assuming you have added all the Devices, Widgets and
Transitions needed to demonstrate the Task, you just left-click on the
appropriate Device or Widget to make the action associated with
left-click occur. If a left-click Transition is defined on that Device
or Widget, CogTool follows that Transition to the next Frame. If no
left-click Transition is defined on that Device or Widget, a context
menu pops up from which you can select a different previously defined
Transition, define a new self-Transition, or Look-at the Widget
(discussed below).
If there is a left-click Transition defined on the Widget, but you do
not want to follow that Transition at this point in the task (e.g.,
there is also a right-click Transition defined and that is the one you
want to follow), right-click (PC) or CTRL-click (Mac) on the Widget
and the context menu will appear, giving you access to all the
pre-defined Transitions as well as the option to define a new
self-Transition or Look-At the Widget (discussed below).
![](/assets/user-guide/media/image59.png)
 If you have difficulty remembering
which Widgets have Transitions or actions to trigger them, hover the
mouse over the Widget to display a tool tip. The context menu for the
Widget will also have information about Transitions
![](/assets/user-guide/media/image237.png)
 When a left-press Transition is
defined on the Widget, CogTool follows the left-press Transition when
you left-click on the Widget. CogTool is catching the "press" before
it sees the "click", while understandable, but not as useful as having
it see a click as a click. If a Widget has both left-press and
left-click Transitions defined on it, access the left-click through
the context menu.
In the case of a touchscreen interface, CogTool automatically
interprets left-clicks as taps, e.g., like a tourist guide on a iPhone
with a Museums button (see Figure 5-4).
![](/assets/user-guide/media/image238.png)

Figure 5-4: CogTool demonstrating a touchscreen action. You, the
analyst, clicks on the Museum button, but CogTool knows you have
prototyped a touchscreen interface and records a tap, not a click.
When you click on Widgets that have parts that are not visible when
the Frame is entered, e.g., menu, context menu, and pull-down list
Widgets, they open and you can continue clicking until you get to the
Widget that emits the next Transition. CogTool puts all the steps that
are necessary to mimic the complex interaction into the Script (in
gray), as defined by the Widget when it was created. For example, if
you defined a menu system that used hover to open submenus with a
delay of 0.5 sec (typical for a PC), you will demonstrate by clicking
on the menus and submenus, but the CogTool Script will list the hovers
and system waits as defined.
![](/assets/user-guide/media/image17.jpg)
 If your Frame has overlapping Widgets,
a left-click will automati cally follow the Transition for the topmost
Widget. Actions on all
occluded Widgets are accessible through the context menu.
5.2.5.2 Here's Why Using the Right Widgets was Important
CogTool creates cognitively-plausible Scripts by adding steps to your
Demonstration. Some of these steps are physical, like homing the hands
between the mouse and the keyboard. But most of them are Think steps,
placed where they are because prior research has studied where people
pause when using computers (e.g., Card, Moran, and Newell, 1980; Lane,
et. al., 1993). CogTool employs a mapping of the original rules for
placing mental operators that allows it to connect Think steps to
Widgets under certain circumstances. The rules for placing Think steps
are too complex to document here, but you can see that using some
Widgets under some circumstances places Think steps and using other
Widgets do not. The number of Think steps will impact the prediction
of skilled execution time, so using the right Widgets when creating
your Design is important. (See the Appendix "Steps Placed
Automatically by CogTool" if you are curious about how CogTool places
Think steps and why.)
5.2.5.3 Adding Self-Transitions During Demonstration
If you discover that you forgot to create a self Transition in your
Design, you can add a self-Transition step on any Widget in any Frame
during Demonstration. Simply use the context menu on the desired
Widget and select Perform Self Transition. A dialog box will appear
that lets you add any available Transition for that Widget. This will
create a new step in the Script, just as if you had put the Transition
in the Design prior to demonstrating the task. It will not, however,
actually put the self-Transition into the Design, so if you think you
will need it again, you should go back to the Design and add it.
![](/assets/user-guide/media/image239.jpg)


##### 5.2.5.4 Adding Look-At Steps During Demonstration
When computing, CogTool will automatically produce a model of human
performance that looks at the Widgets it clicks on as it does the
task. All you have to do to produce such a model is demonstrate how to
do the task as described in previous sections. However, there are also
times when users will have to look at Widgets more deliberately, e.g,
to get information from a Non-Interactive Widget to make a decision
about which Button Widget to press, or to read a dialog box that comes
up with new information each time. You can simulate this in CogTool by
adding a Look-At Widget step as you demonstrate the task.
To add a Look-At Widget step during demonstration

-   Click the Look-At Widget button at the bottom of the Script window.
    It will toggle and look selected.

-   Click on the Widget you want the user to look at, comprehend, and
    deliberate about. The Look-At Widget button will toggle back to
    not-selected and a deliberate Look-At step will be inserted into
    your Script.

OR

-   Use the context menu on the Widget and select Look-At Widget.

CogTool assumes that if you have inserted a Look-At step deliberately,
a skilled user would being doing this to gather and comprehend
information, and therefore be thinking after doing the Look-At step.
Therefore, CogTool places a Think step after every Look-At step you
demonstrate.

![](/assets/user-guide/media/image17.jpg)
 Deliberately looking a widgets should be
used sparingly. You do

NOT need to use them just to look at a button to click on it; CogTool
does that for you when it computes predictions. However, if your user
will need to look around at different parts of the display to gather
information with which to decide want to do next (e.g., a commercial
airline pilot looking at specific areas of the cockpit to know which
buttons to press to implement course changes from an Air Traffic
Controller), use Look-At Widget in your Demonstration.
5.2.5.5 Adding or Removing Think Steps During Demonstration
In some cases, you may wish to change the "Think" steps that CogTool
automatically inserts in the Script. Because the rules CogTool uses to
place "Think" operators have been validated through many experiments
spanning several decades, changing the placement of Think steps is
discouraged unless you have empirical evidence applicable to your
Design to support the change.
To remove a "Think" operator:

-   Select the line in the Script with the "Think."

-   Click the Delete Think button at the bottom of the pane.

Conversely, if you believe that you have sufficient justification, you
may add additional Think steps.
To insert a Think step during Demonstration:

-   Click the Think button at the bottom of the Script window. A dialog
    box will appear asking you the duration of the Think (based on your
    data or other literature that pertains to your Design) and whether
    you want to label the Think in some way specific to your Design. For
    example, you may know that it takes 10 seconds to read a dialog box
    that appears in your design. That would be a justifiable reason to
    add a Think step to the Script, as shown.

![](/assets/user-guide/media/image240.jpg)


-   The Think step will be added at that point in the Script.

![](/assets/user-guide/media/image38.jpg)
Numbers can only be entered into CogTool
is US format, i.e.,
using digits and a "." to represent the decimal point.
To insert a Think step after Demonstration:

-   Select the step in the Script that you want to put a Think before.

-   Click the **Think** button.

-   In the dialog box that appears (the same as shown above), enter the
    amount of time in seconds the user will pause to think.

-   The Think step will be inserted above the step you have selected. If
    the step you selected was a demonstrated step that had
    automatically-generated steps before it (e.g., homing), the Think
    step will appear before all the generated steps.

![](/assets/user-guide/media/image17.jpg)
 Because of prior research, CogTool will
not allow a Script to have two Think steps in a row. If you add a
Think step in a position
where it will be next to an automatically-generated Think step,
CogTool will replace the automatically-generated Think step with your
deliberately-added Think step.
![](/assets/user-guide/media/image98.jpg)
![](/assets/user-guide/media/image17.jpg)
 You can also change the duration and
label of any Think step at any time by double-clicking on it in the
Script window. The dialog box for changing the duration and label will
appear. using digits and a "." to represent the decimal point. Numbers
can only be entered into CogTool is US format, i.e.,
5.2.5.6 Examples: Demonstrating the Three Text-Editing Tasks Designed
in Previous Sections
In several previous sections (see "Working with Text Boxes & Text" and
"Dragging Over Text to Highlight it" in the previous Chapter), we have
discussed editing text to change a name, "Harvey Q. Bovik" to "Harry
Q. Bovik". We built a Design with the Frames, Widgets and Transitions
to simulate three methods for accomplishing this task (1) positioning
the cursor between the "e" and "y" in Harvey, backspacing twice and
then typing "r", (2) double-clicking on "Harvey" to highlight it and
then typing "Harry", and (3) dragging across the entire field to
highlight it and then typing "Harry Q. Bovik". The following
subsections show pictures of how each of those method would be
demonstrated.
The Project is set up with a Task Group containing the three methods
of editing the text.
![](/assets/user-guide/media/image241.jpg)

The Design contains all the necessary Frames, Widgets and Transitions
to demonstrate all three methods. Notice that the Transitions that
highlight the text are all self-Transitions and that there are
multiple keyboard Transitions to the next Frame because the different
methods require the user to type different things on the Keyboard. You
can access any of these transitions, even if they overlap with others,
by clicking on their names in the Design's properties pane.
![](/assets/user-guide/media/image242.png)

The Transitions are:

-   For the first method: left-click self-Transition on text Widget
    between the "e" and the "y". The keyboard Transition to the next
    Frame contains "backspace backspace r".

-   For the second method: left-double-click self-Transition on Harvey.
    The keyboard Transition to the next Frame contains "Harry".

-   For the third method: left-press self-Transition on Right\_of\_Name
    and leftrelease self-Transition on Left\_of\_Name. The keyboard
    Transition to the next Frame contains "Harry Q. Bovik".

The Script for the first method, clicking between e" and "y" in
Harvey, backspacing twice and then typing "r" is:
![](/assets/user-guide/media/image243.png)

The Script for the second method, double-clicking on "Harvey" to
highlight it and then typing "Harry" is:
![](/assets/user-guide/media/image244.png)

The Script for the third method, dragging across the entire field to
highlight it and then typing "Harry Q. Bovik" is:
![](/assets/user-guide/media/image245.png)

Below, you can see the Project window that compares these three
predictions (after they have been computed, see the section on
computing predictions). CogTool predicts that double-clicking and
retyping the first name will be the fastest. This makes sense because
placing the cursor between two letters is a much more precise movement
than doubleclicking on a word and the delete key is further away from
the home-row than the letters of "Harry". However, remember the
warning about CogTool's typing predictions that they are unreliable
when the task is very short. Therefore, these predictions should be
interpreted to mean that the third method, highlighting and retyping
the entire name, is certainly slower than the other two methods, but
the first two methods are not reliably different.
![](/assets/user-guide/media/image246.png)

#### 5.2.6 Editing Think Script Steps

You may edit **Think** steps in your Demonstration by double-clicking
them and then editing the duration and label. You may not directly
edit any other steps in a Script.

#### 5.2.7 Deleting Script Steps

It is not advisable to delete arbitrary steps in the middle of a
Script. Although CogTool does not prevent you from deleting an
arbitrary step, the resulting Script is not guaranteed to produce a
psychologically valid prediction. It is better to delete steps from
the end of the Script, as follows.
To delete script steps from the end of the Script:

-   Select the last step you demonstrated.

-   Click **Delete Step** until you have deleted back to the undesired
    step. As you delete each demonstrated step (in white) all generated
    steps associated with it (in yellow or gray) will be deleted as
    well.

-   Restart your Demonstration from the deleted step.

![](/assets/user-guide/media/image17.jpg)
 You will not be able to delete steps
that are generated by a Speaker device in this window. If you
double-click on a Speaker step, a dialog box will instruct you to edit
the Frame containing the Speaker information and give you a button to
take you to that Frame. You can get to the Frame at any time by
double-clicking on its title in the left pane of the Script window.

#### 5.2.8 Reviewing Your Scripts

##### 5.2.8.1 Reviewing the Steps in a Task Script
When you click on the Script step in the Script list, the associated
Frame appears in the left pane of the Script Edit window. You can
review how to do the Task by clicking on the first step in the list
and using the arrow key to walk through the steps, showing all the
Frames are you arrow-down.
If you need to change something, you can easily get to any Frame
window by doubleclicking its name in the left pane of the Script
window.
5.2.8.2 Reviewing the Steps in a Summed Task Group
If you have a Task Group that represents a higher-level goals that can
only be completed by completing all the subTasks (i.e., the Task Group
is set to display the sum of the predicted times of the Tasks). You
may want to see all the steps in all the Tasks in one window, and
CogTool provides this ability.
To view all the Steps for such a Task Group:
• Double-click the cell which contains the summed value for the group.
You cannot edit the Scripts in this window, only review them. Open the
individual Task's Scripts to edit them.

### 5.3 Computing a Prediction

Once you have finished creating and editing a Script, click the
Compute button at the bottom of the right pane to compute a
prediction. The result will appear as a value at the top of the right
pane in the Script window (to the right of the "Prediction" label) and
also in the Script cell for the Task in the Project window.
The number that appears in these locations is the calculated
prediction for the execution time of a skilled user. If you do not
have numbers in cell in the Project window, you might have one of the
following:

-   Nothing ( ): the cell has not been demonstrated and lacks a Script.

-   Double dash (**\--**): the Script has been demonstrated but not yet
    computed.

-   Question marks (**??**): there is an invalid step, such as clicking
    on a Menu Item

Widget before clicking on a Menu Widget when using Custom Widgets. The
Script steps affected will be colored red and will be marked by an X
on the lefthand side of the "Script Step List." The Script will need
to be edited before it can be recomputed (see Figure 5-5). This
situation almost never occurs when you use Standard Widgets in your
Design, but it is a common error when you use Custom Widgets.
![](/assets/user-guide/media/image247.png)

Figure 5-5: Question marks in the Script cell and red lines in the
"Script Step List"

-   Double-X (X**X**): a problem exists with a Transition that causes
    the prediction time for the Script to be greater than 600 seconds
    (10 minutes). We have set 600 seconds as a maximum time in case
    CogTool gets into an infinite loop. This rarely happens on .cgt
    files created in the same version of CogTool in which you are trying
    to compute (it does occasionally happen when running an old .cgt
    file in a new version of CogTool), but if it does, it usually means
    there is something wrong with your Script. If your Script is correct
    but your system includes tasks that will take longer than 600
    seconds, break them up into smaller pieces in and organize them into
    Tasks and Task Groups (or contact us to make a special CogTool for
    you that can run a longer simulation).

non-English contexts on a Mac, particularly those that use
non![](/assets/user-guide/media/image154.png)
CogTool is known to have difficulty
computing when using it in
Roman scripts in their input methods, as set by the International
System Preferences.
![](/assets/user-guide/media/image38.jpg)
Keyboard transitions that involve many special
characters in a row result in predictions of human performance that
are slower than the performance of actual skilled computer users. This
is because (1) KLM assumes all keystrokes are done in sequence even
for keys held down together and (2) ACT-R (the cognitive architecture
making the predictions "under the hood") provides a model of typing
that is too simple, assuming each finger has to move back to the
home-row before typing the next key. For most comparisons between
interfaces, these assumptions are reasonable approximations to user
behavior. However, for extremely skilled users of multiple-key
keyboard shortcuts and navigation keys, the predictions will be too
slow.

#### 5.3.1 Recomputing Scripts

When you make changes to your Script, it will automatically
regenerate. However, you should always recompute a changed Script to
ensure an accurate, updated prediction time.
To recompute a Script:
From the Script window:

-   Click the **Compute** button.

From the Project window:

-   Select the Script cell.

-   From the **Modify** menu, choose **Recompute Script**.

![](/assets/user-guide/media/image17.jpg)
 You can recompute all Scripts in a
Project window by selecting all the Scripts. To select all the
Scripts, from the **Edit** menu, choose

**Mac:** A

**Select All**.

**Win:** CTRL+A

![](/assets/user-guide/media/image38.jpg)
Some changes to a Design can prevent a Script from
being recomputed properly, e.g., deleting a Frame or Widget that is
used in the Script. Invalid Scripts must be re-demonstrated. The red
areas in the Script window indicate from which point the associated
Script must be re-demonstrated. If the Recompute Script command
produces an erroneous result, you may need to re-demonstrate the
Script from the beginning.

### 5.4 Exporting Scripts and Results to CSV Files

Some CogTool users have found exporting Scripts and results to CSV
(comma separated value) files useful and we present how to do that
here. You can also export designs to HTML, which is discussed at the
end of the last chapter.

#### 5.4.1 Exporting a Script to CSV
You may want to export your Script to a CSV file to view the steps in
a more concise and manipulable format than the Script windows, or to
use them in reports about your analyses. Usually, you will want to
open the CSV file in a spreadsheet program, such as Microsoft Excel or
Google Docs.
To export a Script:

-   Select the Script cell from the Project window, or open the Script
    window.

-   From the **File** menu, choose **Export Script to CSV**.

The default file name for the exported Script follows the standard of
**Project Name\_ Design Name\_Task Name.csv**.
The CSV file contains information on the version of CogTool, the
Project and Design names, and all the information from the Script
window (the Frames, Actions, Widget Names and Types, and Displayed
Labels) (see Figure 5-6).

![](/assets/user-guide/media/image17.jpg)
 When you export a Script that is a member
of a Task Group, the

Task Hierarchy is displayed under the Design name (see Figure 5-6).
![](/assets/user-guide/media/image304.jpg)

Figure 5-6: The information from the Script window exported into
Microsoft Excel

![](/assets/user-guide/media/image17.jpg)
 When you open the file in a spreadsheet
application, such as

Microsoft Excel, symbols for the special keys (e.g. ⇧ for Shift) may
not be displayed. In these cases, the symbols are replaced by the key
name, which is capitalized and in parentheses (e.g. (SHIFT)) (see
Figure 5-7).
![](/assets/user-guide/media/image305.jpg)

Figure 5-7: An exported Script with special keys: For a complete list
of the special keys and their corresponding symbols, see **Appendix:
Special Keys and Symbols**.

#### 5.4.2 Exporting All Results to CSV
You can export all the results shown in the Project window to a CSV
file. You might choose this function to manipulate (add, subtract,
etc.) numbers in Microsoft Excel or Google Docs or to more easily
track and work with many Tasks and Designs instead of viewing them in
a large CogTool file, or to insert them into reports.
To export all results to CSV:

-   Display the Project window.

-   From the **File** menu, choose **Export All Results to CSV**.

The default file name for the exported script follows the standard of
**Project Name\_ Date\_Time.csv**.
The CSV file contains information on the version of CogTool, the
Project Name, the date and time stamp, and all the information from
the Project window (the Tasks and the computed times, in seconds) (see
Figure 5-8).
![](/assets/user-guide/media/image306.jpg)

Figure 5-8: The information from the Project window exported into
Microsoft Excel.
This Project had one Design, one Task Group with the minimum time
displayed and
two Tasks in the Task Group.

### 5.5 Model Visualization
The underlying computation cognitive engine that makes predictions of
human performance in CogTool is called ACT-R. It is complex and well
validated with decades of research. To learn more about it, visit the
ACT-R website: <http://act-r.psy.cmu.edu/>.
We have built a visualization tool into CogTool so that you can see
what ACT-R does to produce the predictions. Although this
visualization is meant for a cognitive psychology researcher to
validate CogTool's and ACT-R's predictions, it is fun and you may find
it interesting. Some designers have even found that it helps them
identify bottlenecks in task execution, understand why one Design is
faster than another, or inspire new Designs.
To see the visualization:
From the Project window:

-   Select the Script cell of interest.

-   Right-click (Windows) or CRTL-click (MacOS) the cell to bring up the
    context menu.

-   Choose **Show Model Visualization**.

OR
From any Script window:

-   Click the Show Visualization button (see Figure 5-9).

![](/assets/user-guide/media/image307.jpg)


Figure 5-9: The Show Visualization button in the Script window
The Visualization window has two panes (see Figure 5-10). In the left
pane is a timeline showing the different activities ACT-R goes through
to make the predictions. The left pane is split into two, with the top
portion of the pane presenting the entire model in miniature and the
bottom portion showing a blow-up of a portion of the timeline selected
from the top portion. The right pane shows either single operator
information or a textual trace of the ACT-R model's run, depending on
whether the **Trace** or **Operator Info** tab is selected.
In the left pane, time runs from left to right and the widths of the
boxes are proportional to the time they take to execute. The rows of
boxes are different types of "operators" that happen in the course of
performing these Tasks.
![](/assets/user-guide/media/image308.jpg)

Figure 5-10: The Model Visualization window
The operators are grouped into four categories:

-   System - (shades of gray)

    -   Frame (darker gray) - represents the Frame that is visible on
        the screen.

    -   Wait (lighter gray) - represents the system response time.

![](/assets/user-guide/media/image309.png)
 The Frames are not actually visible as
long as these boxes indicate. When there is a System Wait, one Frame
disappears and the next one does not show up for the duration of the
System Wait. This is not shown correctly in the current visualization.

-   Eyes - (shades of purple)

    -   Vision - Enc (light purple) - represents the eyes encoding
        objects on the Frame, i.e., putting them into a representation
        that ACT-R's cognitive processes can work on them

    -   Eye Move -- Exec (darkest purple) - represents the eyes moving
        to objects on the screen

    -   Eye Move -- Prep (mid purple) - represents the eyes preparing to
        move to objects on the screen.

-   Cognition - center row (gray) - represents the thoughts the model
    has when performing the Task. The long boxes in this row are the
    Think steps. Short boxes are other types of cognitive operators that
    initiate motor movements and visual attention shifts.

-   Hands - (red) represent motions of the left hand and right hand, as
    labeled.

    -   Shows the motor movement that would be observable on a video:
        horizontal movements of a finger, stylus, or mouse; clicks of a
        mouse button; or key presses. In this example, The right hand
        moves the mouse and clicks in between the "e" and "y" in Harvey,
        then the right hand moves from the mouse to the keyboard so it
        can type Backspace, Backspace and then the left had types "r".
        (see Figure 5-10).

![](/assets/user-guide/media/image310.png)
 Hand movements on a touch screen
should be labeled "Movefinger movement" but they currently appear in
both the chart and the Trace as "Move-Mouse". The calculations are
correct, its just the labels that are not.
![](/assets/user-guide/media/image50.png)
 If you are trying to visualize a old
.cgt file from a previous version of CogTool, the rows sometime comes
out in a different order that presented here and many lines cross each
other. If this happens, try recomputing and re-visualizing.
If you click on a box in the detail pane, it highlights the box in
bright blue and either gives information about the operator you just
selected (in the Operator tab) or highlights the part of the model
trace that corresponds to it in the right pane (in the Model Trace
tab).
The area shaded in light red on the overview time line represents what
is currently showing in the detailed time line. The detailed time line
can be manipulated by moving the selection box on the overview time
line. You can re-size and move the red bars at the ends of the red
area. You can move the whole area by clicking the red area and
dragging it, or you can move one end by clicking and dragging a
vertical end bar. You can also scroll smoothly by pressing down on the
arrows (◀ or ▶) at the edges of the overview timeline, or you can step
through by clicking on those arrows.
The figure below (see Figure 5-11) shows a comparison between two
different models for changing "Harvey" to "Harry". The top shows
clicking between the "e" and the y" and then typing backspace,
backspce, "r". The other shows dragging over he entire text box and
typing "Harry Q. Bovik". The top model takes less time, but requires
more thinking time to remember the function of the backspace key. The
bottom model takes more time because of the typing.
![](/assets/user-guide/media/image311.jpg)

Figure 5-11: Comparison of two methods for editing in the ACT-R
visualization windows.
