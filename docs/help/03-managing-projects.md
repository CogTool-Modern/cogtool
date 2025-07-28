---
title: Managing a Project
date: 2012-05-23T03:04:25+00:00
layout: app_help
---
## Chapter 3: Managing a Project

### 3.1 What is a Project?
A CogTool Project stores all the interface designs, tasks that can be
performed on the designs, and predictions of user behavior Projects
are stored in files called cgt (CoGTool) files when a Project is
saved

<ul><li class="icon fyi">By default, the Project name is also the name of the cgt file created by CogTool However, when the save box appears, you can save the file with another name. </li></ul>

### 3.2 The Project Window

The Project window is laid out in a grid where the columns are Designs
and the rows are Tasks that can be performed on those Designs (See
Figure 3-1)

<ul><li class="icon fyi">
The title bar of a Project window starts with the name "Project" and contains the name of the Project. </li></ul>

Each column header, starting with the second column, is the name of an
interface design you have prototyped in the Project
The row headers are the names of the different Tasks and Task Groups
The intersection of each Design and Task will show the results of a
quantitative prediction you have made using CogTool (See Figure 3-1)

<figure markdown="1">

![](/assets/user-guide/media/image28jpg)
    
<figcaption>
Figure 3-1: The Project window: This example has two Designs and two
Task groups The Dialog Box design allows menus items to be selected
either by mouse or by speech input so predictions for these two
methods are shown for both Tasks and they are grouped The Pop-Up
design only uses the mouse, so only one prediction is shown for each
Task Group

</figcaption>
</figure>

### 3.3 Creating a New Project

To create a Project, do one of the following:

-   In the CogTool startup window, click the **Create** button
OR
-   From the **File** menu, choose **New Project**

<div class="pull shortcut" markdown="1">
**Mac:** ⌘N<br>
**Win:** CTRL+N
</div>
Because a Project must contain at least one Design, you will be
prompted to name a new Design for the new Project (see Figure 3-2)
The name you choose should be descriptive of the interface being
modeled Since each Design must have at least one input and one output
device, you will be prompted to select devices in the **New Design**
dialog box See **Section 4.1.3 Creating a New Design** for more
information on the **New Design** dialog box

<figure markdown="1">

![](/assets/user-guide/media/image29jpg)
    
<figcaption>

Figure 3-2: The New Design dialog box: This example is creating the
Dialog Box Design shown in the previous figure, entitled Dialog Box,
with a keyboard, mouse and microphone as input devices and a display
as an output device
</figcaption>
</figure>


<ul><li class="icon fyi">CogTool\_v10beta23 assumes every Design
has a display Thus, Display is selected as an output device and it is not possible to
deselect the display (If your Design has no display, eg, is audio
only, its Frames can remain empty to simulate having no display)</li></ul>

Hitting the OK button results in a new Project window, with the Design
you just named and its Design window open ready to edit the Design At
this point you can start creating the contents of your Design (editing
a Design is discussed in a subsequent chapter) or return to the
Project window to set up additional Designs

<figure markdown="1">

![](/assets/user-guide/media/image30jpg)
    
<figcaption>

Figure 3-3: These windows appeared after creating a new Project with a
Design called "NYC Guide" that has a keyboard and mouse as input
devices
</figcaption>
</figure>

### 3.4 Opening an Existing Project

To open an existing Project, do one of the following:

-   In the CogTool startup window, click the **Open** button

OR

-   If you have been editing the Project recently, in the CogTool
    startup window, click the **Open Recent** pull-down list and select
    the desired Project from the list

OR

-  From the File menu, choose Open Project.

You will be prompted to choose a file to open.

In addition, CogTool keeps a list of the last 10 Projects you have opened in its list of recently opened Projects accessible after the start-up screen.

To reopen recent Projects after the start-up screen:
- From the File menu, choose Open Recent.
- Select the file name from the list.

<div class="pull shortcut" markdown="1">
**Mac:** ⌘O<br>
**Win:** CTRL+O
</div>

### 3.5 Saving a Project

To save a Project:

-   From the **File** menu, choose **Save Project**  

<div class="pull shortcut" markdown="1">
**Mac:** ⌘S<br>
**Win:** CTRL+S
</div>

The first time you save a file, you will be prompted for the filename
and location The file will be given a cgt extension The filename
(minus the cgt extension) will appear in the title bar of all CogTool
windows for the Project
<ul><li class="icon fyi">An asterisk (*) in front of the word
"Project" in the title bar of a window signifies that the Project has
unsaved modifications (see Figure 3-4) When the file has been saved, the asterisk disappears</li></ul>

<figure markdown="1">

![](/assets/user-guide/media/image31jpg)
    
<figcaption>
Figure 3-4: The asterisk in the tile bar denotes a Project with unsaved
modifications

</figcaption>
</figure>



To save a Project with a new name:
- From the **File** menu, choose **Save As**.
- You will be prompted for a filename and location

### 3.6 Closing a Project

To close a Project:
- From the File menu, choose Close Project.

To close a window:
- From the File menu, choose Close Window.

<ul><li class="icon fyi">If a Project has unsaved modifications, you will be prompted to save the Project when you close it.</li></ul>

<ul><li class="icon fyi">If you close the last window belonging to a Project, closing the window also closes the Project. If that Project has unsaved modifications when you close the last window, you will be prompted to save the Project.</li></ul>

<ul><li class="icon tip">You can also close an open window by clicking the close button on the window title bar.</li></ul>

### 3.7 Project Properties

To see the version number of the CogTool application last used to save
the Project and the Project name:
- From the **File** menu, choose **Properties** (see Figure 3-5)


<figure markdown="1">

![](/assets/user-guide/media/image33jpg)
    
<figcaption>
Figure 3-5: A sample Project Properties window

</figcaption>
</figure>

### 3.8 Reopening Project Windows and Understanding the Windowing System

As you create a design prototype, you will work in the Project window,
a Design window and many Frame windows As you make predictions of
human performance on your designs, you will work in the Project
window, a Script window, and the Visualization window Each of these
windows will be described in their own sections of this User Guide,
but understanding their relationship may help you navigate the many
windows you create as you work

The Project window is considered the top of the hierarchy of windows
and it owns all the other windows associated with that Project A
Design window owns all the Frame windows that depict the states of the
display in that design Script windows and Visualization windows are
owned by their Project

<figure markdown="1">

![](/assets/user-guide/media/image34jpg)
    
<figcaption>
Figure 3-6: The relationship of windows in a Project that has two
Designs and four tasks demonstrated in Script windows Each Design may
include many Frame windows The result of computing each script can be shown in a
Visualization window

</figcaption>
</figure>






The **Window** menu reflects this relationship, and you can get to any
open window, or any Project window even if it has been closed, through
the **Window** menu The top part of the Windows menu lists the
windows above the active window in the hierarchy In this case, a
Frame window is active, so its Design and Project windows are listed
in the top part of the Windows menu The bottom part of the Windows
menu lists all the open Projects and this expands to all the open
windows in those Projects In the Figure, only one project is open,
but many windows in that Project appear
![](/assets/user-guide/media/image35jpg)

Figure 3-7: View of the Window menu
Therefore, if you closed a Project window and want to reopen it, make
any of its Design, Frame, Script, or Visualization windows is active,
then:

-   From the **Window** menu, choose **Display Project**

To bring any open window to the top and make it active:

-   From the **Window** menu, choose the desired Project name and it
    will expand to list all its open windows, labeled as to which type
    they are

-   Choose the desired window from the list
