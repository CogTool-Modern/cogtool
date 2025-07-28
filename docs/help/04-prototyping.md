---
title: Prototyping an Interface
date: 2012-05-23T03:04:25+00:00
layout: app_help
---
## Chapter 4: Prototyping an Interface

The prototyping aspect of CogTool was inspired by James Landay's SYLK
and DENIM systems (Landay and Meyers, 2005; Lin, et. al., 2000). It
represents the states of a UI as a storyboard of frames; transitions
between those frames represent the actions a user can take to move
from one state to another. Each frame can contain widgets (e.g.,
buttons and menus) that users can act on, as well as ubiquitous input
devices like a keyboard or microphone, through which a user could also
change the state of the UI.
A storyboard can be made from screenshots of an existing product for
benchmarking or competitive analysis, from sketches of ideas you have
drawn on paper or a whiteboard and then digitized, be created directly
in CogTool on a blank canvas with its widget creation tools, or even
imported from a HTML on your computer or the Web. You can use a
storyboard as documentation of your design ideas in either CogTool
files (.cgt) or you can export to HTML.
This chapter will present how to build a design so that it not only
records your design ideas, but can be used to make predictions of
human performance (discussed in the next chapter).

### 4.1 Designs

#### 4.1.1 What is a Design?
A Design is a prototype of the system you are proposing to build. It
represented the system as a series of Frames and the user actions that
transition between them. Each Frame represents how the interface looks
to a user. You can represent just the display of a computer monitor in
a frame and associate input Devices with that display (e.g, a keyboard
and a mouse, a speaker and microphone), or you can represent an entire
device in a Frame (e.g., the display and hard buttons of a cell
phone). Transitions, which represents user actions, cause a Frame to
change to another Frame. Together, the Devices, Frames, and
Transitions make up a Design.
You work on Designs in the Project window and each Design's own
window. You work with a Design's definition in the Project window
(e.g., creating, renaming, moving, deleting), and with the Design's
content in each Design's own window.
#### 4.1.2 What is a Device?
A Device is a representation of the hardware associated with you
Design. CogTool can represent a fixed set of Devices. Input Devices
include keyboard, mouse, touchscreen and microphone. Output Devices
include a display and a speaker. The Devices associated with a Design
influence the Widgets that can be include in Frames and the
Transitions that can change one Frame to the next. For example, if
there is no microphone included in a Design, there can be no
Transitions based on spoken commands. You choose Devices for a Design
when you create that Design. If you want to add more Devices later,
you can. However, you cannot remove Devices from a Design.
See Appendix A for a list of the available Devices, definitions, and
tips of how to use these devices to prototype a wide range of
interactive systems.

#### 4.1.3 The Design Window

The Design window shows the Frames and the Transitions between them.
Design windows have a light yellow background to distinguish them from
the other CogTool windows. The title bar starts with the word "Design"
(see Figure 4-1).
![](/assets/user-guide/media/image36.png)
Figure 4-1: The Design Window: When no Frame is selected (no Frames
are blue), the properties of the Design appear in the pane on the
right.
The Design canvas is the main area of the Design window, where Frames
are added and connected by Transitions. When no Frame of Transition is
selected, as in the figure above, the properties of the Design appear
in the properties pane on the right. Its name, input devices, output
devices, a list of its Frames that can be expanded to show the Frame's
Widgets and Transitions, and the type of skin that will be applied to
rendered Widgets. When a Frame or Transition is selected in the Design
canvas, its properties appear in the properties pane, discussed in the
Frames and Transitions sections. The toolbar on the left holds tools
for drawing Transitions, discussed in the Transition section.

#### 4.1.4 Creating a New Design 

Each Project must have at least one Design, which is created when a
new Project is created. However, because CogTool allows you to compare
human performance across different designs, you are likely to want
more than one Design for your Project. To create additional Designs
for your existing Project:

**Mac:** ⇧D

-   In the Project windows, from the **Create** menu, choose **New
    Design**. **Win:**

CTRL+SHIFT+D The New Design dialog box will appear.

![](/assets/user-guide/media/image37.jpg)

Figure 4-2: The New Design dialog box. The OK button will not be
active until at least one input device is checked.
In this dialog box, do the following:

-   Choose a name unique within the Project and descriptive of the
    interface being prototyped. This will help you to identify the
    purpose of the Design when you have multiple Designs in your
    Project.

![](/assets/user-guide/media/image38.jpg)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.

-   Check the input and output devices that your Design should include.
    You can check as many devices as you need to represent your Design.
    Typical computer systems will have a keyboard and mouse as input and
    a display as output. A PDA may have a touchscreen. Speech
    recognition systems will have a microphone, etc. You will not be
    able to click **OK** until you have selected at least one input
    device.

![](/assets/user-guide/media/image39.png)
CogTool assumes every Design has a
display. Thus, Display is selected as an output device and it is not
possible to deselect the display. If your device has no display (e.g.,
is audio only), this can be prototyped by all Frames being empty.
![](/assets/user-guide/media/image40.png)
 If you are prototyping a cell phone or
other hand-held device that is operated with the fingers, use
"Touchscreen" as the input device, even if the buttons are physical
buttons not on an actual touchscreen. This will allow the user's
actions to be represented as tapping, which is sufficiently close to
pressing a physical button to make human performance predictions.
When Designs are created, the Design columns appear in the Project
window in the order in which they are created, with new columns
appearing at the far right. If a Design is selected when a new Design
is created, the new Design will appear immediately to the right of the
selected Design column (see Figure 4-3).
![](/assets/user-guide/media/image41.png)
Figure 4-3: The Dialog Box Design was selected when Design 3 was
created.
You can also create a design by importing it from HTML, either on your
computer or from the Web. This is useful if your design process
already includes interactive prototypes expressed in HTML or if you
want to analyze existing web sites. This feature is discussed in
Section 4.6.

#### 4.1.5 Selecting a Design

In the Project window, click on a Design name to select the Design. A
dot will appear to the left of the Design mane and the column will
turn blue to indicate selection. You cannot select multiple Designs.

#### 4.1.6 Editing a Design 

To open a Design window so you can edit a Design, do one of the
following:

-   In the Project Window, select the Design.

+-----------------+-----------------------------------------------------+
| **Mac:** E      | • From the **Edit** menu, choose **Edit Design**. |
|                 |                                                     |
| **Win:** CTRL+E |                                                     |
+-----------------+-----------------------------------------------------+

![](/assets/user-guide/media/image17.jpg)
 A Design is selected when a dot
appears next to the Design name and the Script cells below the name
are highlighted in blue (see Design 3 in the previous figure).
OR

-   Double-click the Design name in its column in the Project window.

A Design window appears where you can add Frames and Transitions to
prototype your system (see Figure 4-4). Editing Frames and defining
Transitions are discussed in subsequent sections.
![](/assets/user-guide/media/image42.png)

Figure 4-4: The Design window that results from opening a new Design.
The Design canvas has one empty Frame and nothing is selected.

#### 4.1.7 Saving a Design 

Changes to your Design are saved when you save the Project. Choose
**Save Project**.
from the **File** menu, or use the shortcut key, at any time to save
your work.

#### 4.1.8 Closing a Design

To close a Design window, when it is active:

**Mac:** W

• From the **File** menu, choose **Close Window** (or hit the close
window button ^**Win:**\ CTRL+W^ provided by the operating system on
every window).

#### 4.1.9 Moving a Design

You can change the order of the Design columns in the Project window
by clicking on the Design name and dragging the column to the desired
position. The Design you are dragging become transparent, which allows
you to see when you have reached the desired position.
![](/assets/user-guide/media/image43.jpg)

Figure 4-5: The Pop Up Design is being moved from the right-most
position to the left of the Dialog Box Design. You can see the Dialog
Box column underneath as you move the Pop Up Design.
You can also change the order of the Design columns by cutting and
pasting the Design columns into the desired location.

#### 4.1.10 Cutting, Copying, and Pasting a Design

You can cut or copy a Design and paste it into another location of the
same Project or into a different Project.
To cut a Design:

-   In the Project window, select the Design.

+-----------------+---------------------------------------------------------+
| **Mac:** X      | -   From the **Edit** menu, choose **Cut Design**.      |
|                 |                                                         |
| **Win:** CTRL+X | The Design is now on the clipboard, ready to be pasted. |
|                 |                                                         |
| **Mac:** C      | To copy a Design:                                       |
|                 |                                                         |
| **Win:** CTRL+C | -   In the Project window, select the Design.           |
|                 |                                                         |
|                 | -   From the **Edit** menu, choose **Copy Design.**     |
+-----------------+---------------------------------------------------------+

The Design is now on the clipboard, ready to be pasted.
To paste a Design:

-   In the Project window, from the **Edit** menu, choose **Paste**.

![](/assets/user-guide/media/image17.jpg)
 If no Design is selected, the pasted
Design will be added to the

right-most column. If an existing Design is selected, the pasted
Design will be added immediately to the right of the selected Design.
If the Design's name is already in use in the Project, a unique suffix
is appended to the pasted Design's name (see Figure 4-6).
![](/assets/user-guide/media/image44.jpg)

Figure 4-6: CogTool added a unique suffix to the name of the Pop Up
Design in the right-most column when it was pasted into the same
Project.
When pasting into a different Project, if the Design already has Tasks
defined in it and one or more of the Task names already exist in the
target Project, they will be pasted into the existing Task. If this is
not what you intended (e.g., Tasks named the same are actually
different), create different Task names and move the pasted Tasks to
their proper locations. If the target Project does not have exactly
the same Task names, pasting the Design will create new Task names in
the target Project. Again, if this is not what you intended (e.g.,
differently named Tasks are actually the same), move the pasted cells
of the Design to the desired Task rows. See Tasks, later in this
document for more information on creating and moving Tasks.

#### 4.1.11 Deleting a Design 

To delete a Design:
• In the Project window, select the Design.

+-----------------+---------------------------------------------------+
| **Mac:**        | -   From the **Edit** menu, choose **Delete       |
|                 |     Design**.                                     |
| **Win:**        |                                                   |
|                 | You will have to confirm the deletion of the      |
| CTRL+DELETE     | Design. It will not be deleted until you click    |
|                 | **OK** in the confirmation dialog box.            |
| **Mac:** D      |                                                   |
|                 | ![](.                                           |
| **Win:** CTRL+D | //media/image17.jpg) |
|                 | Deleting a Design |
| **Mac:** R      | has the same effect as cutting a Design, except |
|                 | that the Design is not on the clipboard and     |
| **Win:** CTRL+R | cannot then be pasted.                          |
|                 |                                                   |
|                 | 4.1.12 Duplicating a Design                       |
|                 |                                                   |
|                 | To duplicate a Design:                            |
|                 |                                                   |
|                 | -   In the Project window, select the Design.     |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Duplicate    |
|                 |     Design**.                                     |
|                 |                                                   |
|                 | ![](.                                           |
|                 | //media/image17.jpg) |
|                 | The Design is     |
|                 | duplicated to the right of the original Design, |
|                 | and its name will be given a unique suffix      |
|                 | (e.g. "MyDesign\[1\]").                         |
|                 |                                                 |
|                 | ![](.                                           |
|                 | //media/image17.jpg) |
|                 | Within a Project, |
|                 | duplicating a Design has the same effect as     |
|                 | copying and pasting a Design. However,          |
|                 | duplicating a Design does not put it on the     |
|                 | clipboard and you cannot then paste it into a   |
|                 | different Project.                              |
|                 |                                                   |
|                 | 4.1.13 Renaming a Design                          |
|                 |                                                   |
|                 | To rename a Design:                               |
|                 |                                                   |
|                 | -   In the Project window, select the Design.     |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Rename       |
|                 |     Design**.                                     |
+-----------------+---------------------------------------------------+

Enter the new name for the Design when prompted. The name will be
changed when you click **OK** (see Figure 4-7).
![](/assets/user-guide/media/image45.jpg)

Figure 4-7: The Rename Design dialog box
![](/assets/user-guide/media/image46.png)
 Each Design name must be unique within a Project.
![](/assets/user-guide/media/image47.png)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.

#### 4.1.14 Bringing a Design Window to the Foreground

To bring a Design window to the foreground, do one of the following:

-   In the Project window, double-click the Design name.

OR

-   From the **Window** menu, if the Design name is available as the
    second item in the menu, choose it.

OR

-   From the **Window** menu, if the Design name does not appear
    directly, choose the Project name below the separator. A submenu
    will appear.

-   From the submenu, choose the Design name.

+--------------------------+------------------------------------------+
| **Zoom In**              | 4.1.15 Zooming a Design                  |
|                          |                                          |
| **Mac:** =               | When in a Design window, you may zoom in |
|                          | and out on the Design to make working    |
| **Win:** CTRL+=          | with it easier. This is often necessary  |
|                          | when your Design has many Frames.        |
| **Zoom Out**             |                                          |
|                          | To zoom a Design, do one of the          |
| **Mac:** **Win:** CTRL+- | following:                               |
|                          |                                          |
| **Normal Zoom**          | -   From the Modify menu, choose the     |
|                          |     Zoom option you want.                |
| **Mac:** 0               |                                          |
|                          | OR                                       |
| **Win:** CTRL+0          |                                          |
|                          | -   Choose your zoom settings from the   |
| **Zoom to Fit**          |     box at the bottom of the Design      |
|                          |     window.                              |
| **Mac:** /               |                                          |
|                          | ![](/assets/user-guide/media/i                         |
|                          | mage17.jpg) |
|                          |         |
|                          | default size. **Zoom to Fit** makes    |
|                          | the contents of a Frame fit the        |
|                          | **Normal Zoom** makes the contents of  |
|                          | the Frame revert to the available      |
|                          | space in the window.                   |
+--------------------------+------------------------------------------+

**Win:** CTRL+/

#### 4.1.16 Adding Devices to a Design 

To add a device to a Design:

-   In the Project window, select the Design.

-   From the **Modify** menu, choose **Add Devices\...**. The Add
    Devices dialog box will appear.

OR

-   Click the Add Devices\... button in the properties pane of the
    Design window. The Add Devices dialog box will appear.

-   Check the devices you want to add and click **OK**.

![](/assets/user-guide/media/image48.jpg)

Figure 4-8: The Add Devices dialog box with one new device to be
added.
![](/assets/user-guide/media/image38.jpg)
You cannot undo the addition of a device, so choose
carefully. However, the only consequence of having more devices than
you need is irrelevant items in the Widget toolbar and on the Frames.
It does not prevent you from working, but it might be more difficult
to explain the irrelevant information to colleagues.

### 4.2 Frames

#### 4.2.1 What is a Frame?
A Design consists of Frames and the Transitions that link them. A
Frame represents a single screen of a user interface. A Transition
represents a user's action that changes one Frame into another. Frames
may contain background images and Widgets to represent the look and
interactivity of the interface you are designing.
You work on Frames in both the Design window and each Frame's own
window. You work with a Frame's definition in the Design window (e.g.,
creating, renaming, deleting), and with the Frame's content in each
Frame's own window.

#### 4.2.2 The Frame Window

The main components of the Frame window are a toolbar of Widgets on
the far left, a Frame canvas that contains the interface
representation in the center, and a properties pane on the right.
The Widget types listed on the toolbar to the left of the window are
available depending on (1) the devices associated with the Design and
(2) whether the Standard or Custom toolbar option is selected (see
Figure 4-9). For example, if you have associated a touchscreen with a
Design, then the Graffiti widget appears in the toolbar, but is not in
the toolbar if your Design only has a mouse and keyboard. If you have
selected the Standard widgets, entire interactive menu structures are
constructed for you automatically , so you don't need the widgets for
custom menu items and submenus and they are grayed out. (See
subsequent sections for more information on Widgets and the difference
between Standard and Custom).
![](/assets/user-guide/media/image49.jpg)

Figure 4-9: Two different views of the Frame window with a Design for
a NYC Guide on a PalmVx. This Frame has a background image (the
PalmVx) and three standard button widgets have been defined (colored
orange, a settable color). On the left, no widgets are selected, so
the Properties pane on the right displays the Frame Properties; its
name and a list of the widgets and transitions already defined in the
Frame. On the right, the Museums is selected, is highlighted in a blue
and the Properties pane displays the Widget's properties instead of
the Frame's properties. Both views show the Standard radio button
selected (bottom left), so the toolbar has some grayed out tools
unnecessary for standard widgets. (See subsequent sections for more
information on the difference between Standard and Custom widgets.)
The properties pane on the right contains information about the Frame
itself if no Widgets are selected or the Widget that is selected in
the Frame canvas. If more than one Widget is selected, the Widget
properties pane presents "n/a" (not applicable) in its fields.
The Frame properties include its name in an editable field and a list
of all the Widgets defined in that frame (see Figure 4-9). Click on
the expansion arrow to show to the left of a Widget name to see the
Transitions associated with that Widget. Clicking on the Widget name
will select it, scroll the canvas to bring that Widget into view,
highlight that Widget in the Frame, and displaying its properties.
The Widget properties include its name, whatever text is displayed as
its label (if any), and properties specific to each Widget type. (See
subsequent sections for more information about Widgets and their
properties.)
and Zoom labels run into each other (see Figure 4-10). When it
![](/assets/user-guide/media/image50.png)
 When a Frame window is made too
narrow, the Standard, Custom,
is too short, buttons on the bottom of the Properties pane disappear.

![](/assets/user-guide/media/image51.jpg)


Figure 4-10: Example of a Frame that is sufficiently wide to see all
the buttons (top) and a Frame that is so narrow that the labels run
together (bottom).

#### 4.2.3 Setting the Default size of a Frame

The default size of a frame is a good aspect ratio for prototyping
systems that run on a desktop or laptop. However, it may be too wide
for some devices, like clam-shell cellphones which are far taller than
they are wide when open. You can set the minimum width of new frames
in the Preferences dialog box (under the CogTool menu on a Mac; under
File in Windows). Once set, each new Frame will be created at this
minimum width. This is the minimum width - you can always create wider
Frames by placing wider background images in them or placing Widgets
further to the right.
![](/assets/user-guide/media/image17.jpg)
 The Preferences dialog box contains a
button for accessing re search commands. These are undocumented,
untested, and unvali-
dated. Explore at your own risk .

#### 4.2.4 Creating a New Frame

When a Design window is opened for the first time, a new Frame is
automatically created.
To create a new Frame at any time:

**Mac:** ⇧F

~**Win:**~ • In the Design window, from the **Create** menu, choose
**New Frame.**

CTRL+SHIFT+F A new Frame appears in the Design window. It is selected,
has been given a unique name by default, and this name is highlighted
and ready for you to type in a meaningful name.

![](/assets/user-guide/media/image38.jpg)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.
4.2.4.1 Creating new Frames from a folder of images
You may have a folder of images of your interface that you want to
import. This may be created if you sketched your interface screens on
paper and scanned them in, or sketched it on a whiteboard and took
digital pictures with a camera, or created wireframes in a drawing
program, or even took screen shots from an earlier version or
competitor's product. If so, CogTool provides an easy way to import
all the pictures as background images in multiple Frames.
You can import the entire folder of images for use in your Frames.
Each image will become the background of its own Frame. The Frame's
title will be the same as the corresponding file name, without the
extension.
![](/assets/user-guide/media/image52.png)
 Only JPG, PNG, or GIF are acceptable
file formats for CogTool.
To import background images:

-   Open the Design window.

-   From the **Modify** menu, choose **Import Background Images**.

-   Navigate to the folder that contains the images.

-   Click **Choose**.

![](/assets/user-guide/media/image38.jpg)
If the Design contains only the default Frame, the
default Frame will be deleted when the images are imported.
The Frames will be imported in alphabetical order, in rows from left
to right, starting at the top right of the Design canvas. You can set
the number of Frames in each row in the Preferences menu (under
CogTool on the Mac; under File in Windows).
![](/assets/user-guide/media/image53.png)
 If you have a lot of images you wish to
import, consider beginning their names with numbers ordering them in
the way you want them to appear in your Design. If there are more than
9 and less than 100, name them 01\_ImageName1, 02\_ImageName2,
03\_ImageName3, etc.
![](/assets/user-guide/media/image54.png)

Figure 4-11: The Design window after 11 frames have been imported. The
Frames are imported in alphabetical order and the preferences were set
to import 5 frames in each row.
![](/assets/user-guide/media/image55.jpg)
The number of Frames in each row of the
Design window created by importing can be set in the Preferences
dialog box (under the CogTool menu on a Mac; under File in Windows).
![](/assets/user-guide/media/image17.jpg)
 The Preferences dialog box contains a
button for accessing re search commands. These are undocumented,
untested, and unvali-
dated. Explore at your own risk .
4.2.4.2 Creating new Frames containing a "template" of Widgets
When you are prototyping a system that has many of the same widgets in
multiple Frames, e.g., a cellphone with many hard buttons or a airline
cockpit device like the Control Display Unit where only the screen
changes from Frame to Frame, CogTool provides an efficient way for you
to create each new Frame already containing the same widgets.
To create a Frame Template of Widgets

-   In any Frame window, select the Widgets you want to be on every new
    Frame in the Design.

-   From the Modify menu, choose Set Frame Template.

-   Create new Frames, and each of them will be pre-populated with the
    Widgets in the template.

![](/assets/user-guide/media/image56.png)


Figure 4-12: All the Widgets that represent the hard keys on this
cellphone have been selected and, from the Modify menu, the designer
has chosen Set Frame Template. This is indicated in the status message
at the bottom left of the window, which reads:
"Frame Template created". Each time a new Frame is created in this
Design, it will already have these buttons in it.
To clear the Frame Template so your new Frames can be created empty,

-   From the Modify menu, choose Clear Frame Template.

#### 4.2.5 Selecting Frames

In the Design window, click on a Frame to select it. It will turn
bright blue to indicate selection.
To select multiple Frames either

-   Click in the background of the Design and drag a bounding box around
    the Frames you want to select.

OR

-   Shift-click each Frame separately.

#### 4.2.6 Renaming a Frame

+-----------------+---------------------------------------------------------+
| **Mac:** R      | To change the name of a Frame, do one of the following: |
|                 |                                                         |
| **Win:** CTRL+R | • In the Design window, select the Frame.             |
+-----------------+---------------------------------------------------------+

-   From the Edit menu, choose **Rename Frame**.

OR

-   Double-click the Frame's name. The Frame title bar turns light blue
    when the name can be changed.

![](/assets/user-guide/media/image17.jpg)
A Frame name must be unique within a
Design.
![](/assets/user-guide/media/image57.png)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.

#### 4.2.7 Moving and Aligning Frames

You may arrange the Frames to make the Design more visually pleasing
and easier to follow.
To move a Frame, simply click on the center of the Frame and drag it
to a new location.
To move a Frame in fractional increments, use **Nudge**:

+------------------+--------------------------------------------------+
| **Mac:** +ARROWS | -   Select any number of Frames                  |
|                  |                                                  |
| **Win:**         | -   From the **Modify** menu, choose **Nudge**.  |
|                  |                                                  |
| CTRL+ARROWS      | -   Select the desired direction.                |
|                  |                                                  |
| **Mac:** C       | OR                                               |
|                  |                                                  |
| **Win:** CTRL+C  | -   While holding the key (Mac) or the Control   |
|                  |     key (Win), use the arrow keys on the         |
|                  |     keyboard to move the Frame.                  |
|                  |                                                  |
|                  | ![](./                                         |
|                  | /media/image17.jpg) |
|                  | To reduce        |
|                  | confusion, move the Frames apart so they are   |
|                  | not overlapping or stacked.                    |
|                  |                                                  |
|                  | To align Frames:                                 |
|                  |                                                  |
|                  | -   Select two or more Frames                    |
|                  |                                                  |
|                  | -   From the **Modify** menu, choose Frame       |
|                  |     **Alignment**.                               |
|                  |                                                  |
|                  | -   Select the desired alignment.                |
|                  |                                                  |
|                  | 4.2.8 Cutting, Copying, and Pasting a Frame      |
|                  |                                                  |
|                  | To cut one or more Frames:                       |
|                  |                                                  |
|                  | -   Select the Frames.                           |
|                  |                                                  |
|                  | -   From the **Edit** menu, choose **Cut         |
|                  |     Frame**.                                     |
|                  |                                                  |
|                  | The Frames will disappear and be put on the      |
|                  | clipboard, ready to be pasted.                   |
+------------------+--------------------------------------------------+

![](/assets/user-guide/media/image17.jpg)
 **W**hen you copy a Frame, only the
contents of the Frame are copied; Transitions are not. If you want to
preserve Transitions,
use the **Duplicate** command.
To copy one or more Frames:

-   Select the Frames.

+-----------------+---------------------------------------------------+
| **Mac:** X      | -   From the **Edit** menu, choose **Copy**.      |
|                 |                                                   |
| **Win:** CTRL+X | The Frames will be put on the clipboard, ready  |
|                 | to be pasted.                                   |
| **Mac:** V      |                                                   |
|                 | To paste a Frame into a Design.                   |
| **Win:** CTRL+V |                                                   |
|                 | -   Open the target Design window.                |
| **Mac:**        |                                                   |
|                 | -   From the **Edit** menu, choose **Paste        |
| **Win:**        |     Frame**.                                      |
|                 |                                                   |
| CTRL+DELETE     | This places the Frames on the clipboard into    |
|                 | the Design. If the name of the pasted Frame     |
| **Mac:** D      | already exists in the Design, the pasted Frame  |
|                 | is given a unique suffix (e.g.                  |
| **Win:** CTRL+D | "LastFrame\[1\]").                              |
|                 |                                                 |
|                 | ![](.                                           |
|                 | //media/image17.jpg) |
|                 | You can paste     |
|                 | frames into any Design. You can paste frames    |
|                 | into the Design you just copied them from       |
|                 | (similar to **Duplicate**), into a different    |
|                 | Design in the same Project, or into a Design in |
|                 | a different Project.                            |
|                 |                                                   |
|                 | 4.2.9 Deleting a Frame                            |
|                 |                                                   |
|                 | To delete one or more Frames:                     |
|                 |                                                   |
|                 | -   Select the Frames.                            |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Delete       |
|                 |     Frame**.                                      |
|                 |                                                   |
|                 | -   You will be asked to confirm the deletion. If |
|                 |     you click **OK**, then the Frames will        |
|                 |     disappear.                                    |
|                 |                                                   |
|                 | ![](.                                           |
|                 | //media/image17.jpg) |
|                 | If you have       |
|                 | already demonstrated your Design, you will have |
|                 | to redo your Demonstration after deleting       |
|                 | Frames that are used in the Demonstration.      |
|                 |                                                 |
|                 | ![](.                                           |
|                 | //media/image17.jpg) |
|                 | Deleting a Frame |
|                 | has the same effect as cutting a Frame, except  |
|                 | that the Frame is not on the clipboard and      |
|                 | cannot then be pasted.                          |
|                 |                                                   |
|                 | 4.2.10 Duplicating a Frame                        |
|                 |                                                   |
|                 | When you copy a Frame, you only copy the content  |
|                 | held within the Frame. No Transitions to other    |
|                 | Frames are copied. To make an exact duplicate of  |
|                 | a Frame, including Transitions, use the           |
|                 | **Duplicate** command instead of **Copy**.        |
|                 |                                                   |
|                 | To duplicate one or more Frames:                  |
|                 |                                                   |
|                 | -   Select the Frames.                            |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Duplicate    |
|                 |     Frame**.                                      |
|                 |                                                   |
|                 | This creates new Frames slightly down and to    |
|                 | the right of the original Frames,               |
+-----------------+---------------------------------------------------+

named with unique suffixes (e.g. "LastFrame\[1\]").
OR

-   Select the Frames.

-   Hold down the Option key (Mac) or Control key (Windows), click in a
    selected Frame and drag it to a new position.

This creates new Frames at the point you released the mouse button,
named with unique suffixes (e.g. "LastFrame\[1\]").

#### 4.2.11 Editing a Frame

The content of a Frame represents what the user will see and hear as
they operate the proposed system. You must construct that content by
editing Frames.
To edit a Frame, do one of the following:

-   Select the Frame.

+--------------------------+------------------------------------------+
| **Mac:** E               | -   From the **Edit** menu, choose       |
|                          |     **Edit Frame**.                      |
| **Win:** CTRL+E          |                                          |
|                          | OR                                       |
| **Zoom In**              |                                          |
|                          | -   Double-click the body of the Frame.  |
| **Mac:** =               |                                          |
|                          | 4.2.12 Zooming a Frame                   |
| **Win:** CTRL+=          |                                          |
|                          | When in a Frame window, you may zoom in  |
| **Zoom Out**             | and out on a Frame to make working with  |
|                          | it easier. This is often necessary when  |
| **Mac:** **Win:** CTRL+- | using a large background image or when   |
|                          | your Frame has many Widgets.             |
| **Normal Zoom**          |                                          |
|                          | To zoom a frame, do one of the           |
| **Mac:** 0               | following:                               |
|                          |                                          |
| **Win:** CTRL+0          | -   From the Modify menu, choose the     |
|                          |     Zoom option you want.                |
| **Zoom to Fit**          |                                          |
|                          | OR                                       |
| **Mac:** /               |                                          |
|                          | -   Choose your zoom settings from the   |
| **Win:** CTRL+/          |     box at the bottom of the Frame       |
|                          |     window.                              |
|                          |                                          |
|                          | ![](/assets/user-guide/media/i                         |
|                          | mage17.jpg) |
|                          |         |
|                          | default size. **Zoom to Fit** makes    |
|                          | the contents of a Frame fit the        |
|                          | **Normal Zoom** makes the contents of  |
|                          | the Frame revert to the available      |
|                          | space in the window.                   |
|                          |                                          |
|                          | 4.2.13 Setting the Background Image of a |
|                          | Frame                                    |
|                          |                                          |
|                          | You may use a background image for your  |
|                          | Frame. Background images are useful in   |
|                          | helping you to build an interface based  |
|                          | on Design drawings or screen captures of |
|                          | an existing interface.                   |
+--------------------------+------------------------------------------+

You can set a Frame's background image any time that Frame is selected
in the Design
window or the Frame's window is active.
From the Design window:

-   Select the Frame.

-   From the **Modify** menu, choose **Set Background Image**.

OR
From the Frame window:

+-----------------+---------------------------------------------------+
| **Mac:** B      | -   From the **Modify** menu, choose **Set        |
|                 |     Background Image**.                           |
| **Win:** CTRL+B |                                                   |
|                 | Then choose the image file from the **Open File** |
| **Mac:** ⇧B     | dialog box. JPG, PNG, and GIF are acceptable file |
|                 | formats.                                          |
| **Win:**        |                                                   |
|                 | ![](./                                          |
| CTRL+SHIFT+B    | /media/image40.png) |
|                 | On Windows, you  |
| **Mac:** W      | can also paste images from the clipboard into   |
|                 | your Frame.                                     |
|                 |                                                   |
|                 | 4.2.14 Removing the Background Image of a Frame   |
|                 |                                                   |
|                 | From the Design window:                           |
|                 |                                                   |
|                 | -   Select the Frame.                             |
|                 |                                                   |
|                 | -   From the **Modify** menu, choose **Remove     |
|                 |     Background Image**.                           |
|                 |                                                   |
|                 | OR                                                |
|                 |                                                   |
|                 | From the Frame window:                            |
|                 |                                                   |
|                 | -   From the **Modify** menu, choose **Remove     |
|                 |     Background Image**.                           |
|                 |                                                   |
|                 | 4.2.15 Bringing a Frame to the Foreground         |
|                 |                                                   |
|                 | To bring your open Frame to the foreground:       |
|                 |                                                   |
|                 | -   From the **Window** menu, choose the desired  |
|                 |     **Project**.                                  |
|                 |                                                   |
|                 | -   From the drop-down menu, choose the           |
|                 |     **Frame**.                                    |
|                 |                                                   |
|                 | 4.2.16 Closing the Frame Window                   |
|                 |                                                   |
|                 | To close a Frame:                                 |
|                 |                                                   |
|                 | -   From the **File** menu, choose **Close**.     |
+-----------------+---------------------------------------------------+

**Win:** CTRL+W

### 4.3 Widgets

#### 4.3.1 What is a Widget?
A Widget is an element on a Frame with which a user may interact, such
a button, check boxes, a hierarchical menu, etc.. You will populate
your Frames with Widgets as needed to express your Design.
There is no limit to the number of Widgets that can be included in a
Frame, but you may not need to put Widgets in for every interactive
element in the Design. If you are using CogTool to make predictions of
task execution time for skilled users, the underlying human
performance model only needs the widgets that are actually used in the
tasks you are investigating. If you are using CogTool to create HTML
to share with a development team, they may also need only a fraction
of the widgets that might appear on every Frame. Depending on your
needs, your Designs may have few Frames, sparsely populated with
Widgets, even to depict complex interfaces.
For example, the Frame shown below (see Figure 4-13), represents the
first screen of a NYC Guide for a PalmVx. One task that the UI
designer wants to investigate both with CogTool's human performance
models and with user testing is to find the open hours of the
Metropolitan Museum of Art. Only three buttons on the first screen are
on a reasonable path to this goal, Maps, All Places, and Museums, so
the UI designer need only place Widgets for those three buttons and
leave all the rest unspecified until other tasks become important in
the investigation.
![](/assets/user-guide/media/image58.png)

Figure 4-13: This Frame canvas shows a background image of the PalmVx
running the
ChoiceWay New York City Guide . Three standard button widgets have
been defined (in orange, a settable color). The Frame Properties pane
lists those three buttons.
Widgets will be the source of Transitions in the Design window.
Depending on its type, a Widget can support different Transitions that
represent different user actions on that Widget. Transition link to a
new Frame or the same Frame to represent the systems' response to a
user's action (see **Section 4.4 Transitions** for more information).

#### 4.3.2 Types of Widgets

Choosing appropriate types of Widgets is very important when
populating your Frames. The type of Widget determines the types of
actions that can be represented with Transitions and greatly
influences results of CogTool's predictive human performance modeling.
However, choosing appropriate Widgets is in line with the job of a UI
designer, so what you do in your normal design and prototyping work
fits right into CogTool's process, too. First decide whether Standard
widgets are sufficient for your design or whether you must use Custom
widgets; then decide which specific widget to use.

![](/assets/user-guide/media/image38.jpg)
A Widget cannot be changed to a different type once it is created.

4.3.2.1 Standard or Custom Mode?
CogTool provides two distinct modes for creating Widgets, Standard and
Custom.
Following the HCI maxim "Make frequent tasks easy and infrequent tasks
possible," Standard mode makes it very easy to create complex
interactive widgets. For example, if you choose to create a menu in
Standard mode, the entire hierarchical menu structure can simply be
typed in on the keyboard and it will open and close appropriately when
you interact with it. Type it in once and paste the whole structure
into the top of each Frame. Likewise, if you create a radio button in
Standard mode, you type in all the names in a system of radio buttons
and they automatically perform so that only one can be selected at a
time. Widgets created in Standard mode can be rendered as wire frames,
with a Macintosh skin or with a Windows XP skin. You can easily build
up entire interfaces using rendered Widgets on a blank Frame canvas.
We expect that Standard mode will make life vastly easier when
prototyping a majority of interfaces.
Custom mode allows you to define non-standard Widgets that look and
interact in any way you wish, but with more effort and care than
Standard mode requires. Widgets created in Custom mode cannot be
connected into systems like in Standard mode, so you have to build
them separately, and combine them carefully so you get proper behavior
and, more importantly, valid human performance models. For example, if
you wanted to build a pie menu, you would have to include background
images that look as you want the menu to look in all its expansions
and your Design would have to ensure (through its system of Frames and
Transitions) that a submenu can never be clicked on until the
high-level menu that contains it is expanded.
Previous versions of CogTool did not have Standard mode so all complex
systems of Widgets had to be built up as they are in Custom mode
today. An analysis of errors made by CogTool users revealed that this
process was the most error-prone part of using CogTool. Hence, we
introduce Standard mode to reduce the possibility of user error,
simplify both the creation and debugging of CogTool prototypes, and
increase the accuracy of CogTool's predictions. If it fits your design
needs, we recommend using Standard mode.

![](/assets/user-guide/media/image38.jpg)
A Widget cannot be changed to a different type once it is created.

4.3.2.2 Choosing Widget Types
Because choosing Widget types is so important and can't be changed,
even experienced CogTool users refer to documentation, especially if
using Custom mode. First decide whether Standard widgets are
sufficient or whether you must use Custom widgets; then decide which
specific widget to use. To make the necessary information accessible,
which have put a table of Widget types, their meanings, and some
examples about when to use each type in an Appendix. Please see
**Appendix B: Types of Widgets and When to Use Them** for this
decision aid. After you have chosen the type of Widget you need in a
Frame, refer to the sections below to create and manipulate those
Widgets.
4.3.2.3 A Road map of the Widgets Section
To reduce redundancy, we have grouped Widgets into subsections of this
document. The first subsection presents all the information that is
common to all widgets. The next section is Simple Widgets, where we
discuss Links, Graffiti and Non-Interactive Widgets and the actions
that are common to all Widgets (e.g., cut/copy/paste). The next
section is Moded Widgets, where we discuss Buttons and Check Boxes.
Finally, we present each of the more complex Widgets in their own
sections in increasing complexity: Radio Buttons, Pull-down Lists,
Menus and Context Menus, and Text Boxes and Text.

#### 4.3.3 Common Actions on Widgets

##### 4.3.3.1 Creating a New Widget
After you have decided which Widget to use and whether your interface
will require standard or custom mode, you can create your Widget.
To create a Widget

-   Select the Standard or Custom radio button at the bottom of the
    Frame window.

-   From the toolbar, choose the type of Widget you want to create •
    Drag a rectangle across an area of the open Frame.

**Mac:** ⇧I OR

**Win:** CTRL+SHIFT+I • From the **Create** menu, choose **New Widget**.

cut keys, a square Widget will be placed in the upper left corner of
![](/assets/user-guide/media/image17.jpg)
 When you use the New Widget command
from the menu or short-
the Frame. You can move and resize the Widget as appropriate for your
interface.
![](/assets/user-guide/media/image59.png)
 It is much more efficient to select a
Widget tool and then draw it on the canvas where you want it instead
of using the **New Widget** command. (We included the New Widget
command only for discoverability and compatibility with other similar
systems; nobody we know uses it!)
selected for all new Widgets until you change it, so you only have
![](/assets/user-guide/media/image17.jpg)
 When you select the Standard or Custom
radio button, it stays
to select it once for you entire Design if you do not need to mix
modes. Standard is selected by default.
The appearance of a new Widget is determined by its type, so please
see the subsequent sections for the specific appearance and next steps
for creating different types of Widgets.
![](/assets/user-guide/media/image53.png)
 When you have the same Widget on
different Frames in a Design, prepare that widget completely in one
Frame and then copy and paste it into all other Frames that need it.
This will save you effort and also make CogTool's predictions more
accurate because CogTool will know that it is exactly the same Widget
with the same name, size and position on each Frame.
![](/assets/user-guide/media/image17.jpg)
 Widgets can only be rectangles. This is
an approximation that is sufficient for making predictions of human
performance..
4.3.3.2 Naming a Widget and Entering its Display Label
Every Widget has a Name and an optional Display Label. The Name must
be unique to a Frame and is used internally by CogTool. The Display
Label is the label that a user would see on the display of the system
you are prototyping. There is *always* a Name; there is only a Display
Label if you want to have one.
You would want to use Display Labels if you are working from a blank
canvas because the Display Label is shown on the canvas, but Names are
not. For the same reason, you would not want to use Display Labels if
you are using a Frame background image that has pictures of widgets on
it that already have labels because the Display Labels will be
superimposed on the background. CogTool predictions of skilled
performance time do not need a Display Label to run correctly, so you
may elect to ignore them if you have a background image that already
contains labels.
When you create a Widget, an editable text box comes up on the Widget
ready to receive the Display Label and a default name is inserted into
the **Widget Name** field, located in the Widget Properties to the
right of the Frame. You many use alphanumeric characters, spaces,
dashes, and underscores to name your Widget or in its Display Label

**To Rename a Widget:**

**Mac:** R

**Win:** CTRL+R

You can always change a Name or Display Label by selecting the widget
and changing the text in Widget Name or Display Label fields in the
Properties pane. (see Figure 4-14) You can also change the Display Label
by double-clicking on the Widget, which brings up an editable text box.

![](/assets/user-guide/media/image60.png)
 When not using Display Labels, we
suggest that you change the Name default to a more meaningful name so
that when it appears in elsewhere in the system or in exported files,
you can associate it with something more meaningful than "Widget 1."

![](/assets/user-guide/media/image17.jpg)
 You cannot change the size, type, or
appearance of the font in the

Display Label. The underlying cognitive model gives valid predictions
of the performance time of skilled users no matter what the font looks
like (just as skilled human users would have learned the procedures no
matter what the font).
![](/assets/user-guide/media/image61.jpg)


Figure 4-14: This Widget has been named "Museums."

![](/assets/user-guide/media/image17.jpg)
 Some words that are commonly used in
Button Names and Dis play Labels have special meaning to CogTool. They
signal termination of a Task, which has been shown by prior psychology
research to effect people's behavior. These words are: Cancel, Yes,
No, Exit, Abort, Quit, Save, Done, and OK. If either the Widget's Name
or Display Label is exactly one of these words (not case sensitive),
CogTool will make different human performance predictions than if it
is something slightly different (e.g., "OKbutton" instead of "OK"). Be
sure to use one of these exact words as the button's Name or Display
Label if it does indeed function as the terminator of a task.
![](/assets/user-guide/media/image38.jpg)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.
4.3.3.3 Selecting Widgets
In the Frame window, click on a Widget to select it. It will turn a
different color to indicate selection and a gray bounding box will
appear surrounding the Widget.
To select multiple Widgets either

-   Shift-click in the background of the Frame and drag a bounding box
    around the Widgets you want to select.

OR

-   Shift-click each Widget separately.

You can Select-All Widgets from the **Edit** menu by choosing **Select
All Widgets**, or A (Mac) or CTRL+A (Windows).
4.3.3.4 Setting a Widget's Appearance
4.3.3.4.1 Setting a Widget Layer Color
The Widget layer color is the transparent color that fills each Widget
so you can see it as you work with it; its complement in the color
wheel is the highlight color indicating selection. The default color
is orange because that is unlikely to blend in with most background
images. If you prefer another color, or if orange or its complement
make working with your background image difficult, you can change it.
The color is set per Frame.

To change the color of all the Widgets in a Frame: **Mac:** ⇧C

**Win:** • From the **Modify** menu, choose **Set Widget Layer Color**.
CTRL+SHIFT+C A color-picker appears.

• Choose the color you want from the color-picker. All widgets in that
frame change to the new color.
![](/assets/user-guide/media/image17.jpg)
 The Widget Layer color has no bearing
on the appearance of Widgets when they are exported to HTML.
4.3.3.4.2 Rendering a Widget Skin
A Widget skin can be rendered to resemble objects, such as buttons, on
different systems (Mac OS X or Windows XP).
To render a Widget skin:

-   Select the Widget.

-   In the Widget Properties pane, check the **Render Widget Skin**
    check box.

-   From the **Modify** menu, choose **Set Design's Widget Skin**.

Design. When you set the skin, it will change all rendered Widgets
![](/assets/user-guide/media/image17.jpg)
 Rendering is done per Widget, but
selecting the skin is done per in the whole Design.
![](/assets/user-guide/media/image40.png)
 You can Render all the Widgets in a
Design, or Un-render all Widgets in a Design at once, using the
**Render All Design's Widgets Skin** or **Un-render All Design's
Widgets** commands in the Modify menu.
The available Widget skins are as follows:
**Wireframe:** Each Widget is outlined in black. Each Widget retains
the color of the Widget layer and continues to be transparent so that
the background image (if any) shows through.
**Mac OS X & Windows XP:** Each Widget has the appearance of the
corresponding interactive Widget in the specified OS. These skins are
opaque, so the background image (if any) does not show through.
![](/assets/user-guide/media/image17.jpg)
 CogTool's skins may not be as
professional as you would like for the Mac OS X and Windows XP. Try
them out to see if you like them. You can always capture the
background of any Widget from a screen shot to get the look you want.
4.3.3.4.3 Setting and Removing an Image for a Widget
Widgets can have an image of their own. This is useful for creating a
new layout that is not based on an existing system or background
image. It is especially useful for creating custom Widgets that look
different from anything seen before.
To set an image for a Widget:

-   Select the Widget.

-   From the **Modify** menu, select **Set Widget Image**.

-   From the standard Open File Dialog box, choose your file.

![](/assets/user-guide/media/image62.png)
Only JPG, PNG, or GIF are acceptable
formats for Widget images.
You may also choose to have the Widget match the background image of
the Frame beneath it. You will then be able to maintain a consistent
image for the Widget as you move it around the Frame (see Figure
4-15).
To capture the image from the Frame's background:

-   Select the Widget.

-   From the **Modify** menu, select **Capture Widget Image**.

![](/assets/user-guide/media/image63.jpg)


Figure 4-15: The Museum button has been captured for the Widget from
the upper right of the Frame background. The Widget has been moved to
the Graffiti area (a silly thing to do) to illustrate how the captured
image looks.
![](/assets/user-guide/media/image64.png)
 You can use this feature to create
entirely new layouts from a screen shot of a Frame. Create a Frame
with the desired background and place Widgets over all the widgets
that appear in the background. Capture the background for each Widget.
You can then remove the Frame background and move the Widgets around,
or copy and paste the Widgets into a new blank or neutral background.
To remove the image from a Widget:

-   Select the Widget.

-   From the **Modify** menu, select **Remove Widget Image**.

![](/assets/user-guide/media/image17.jpg)
 Removing the Widget image will not
remove the background image on the Frame, if there is one.
4.3.3.5 Moving and Aligning Widgets
Most Widgets can be moved by selecting them, then clicking and
dragging them by their body (within the selection bounding box).
Complex standard Widgets with many parts have to be dragged by the
bounding box itself, because dragging the interior space moves the
pieces of the Widget relative to its other pieces, e.g., changing the
order of menu items. These movement procedures will be discussed in
the sections about those Widgets.
You can always move one or more Widgets by "nudging" them. To nudge
one or more selected Widgets, do one of the following:

-   Select any number of Widgets

-   From the **Modify** menu, choose **Nudge**.

+------------------+---------------------------------+
| **Mac:** +ARROWS | • Select the desired direction. |
|                  |                                 |
| **Win:**         | OR                              |
|                  |                                 |
| CTRL+ARROWS      |                                 |
+------------------+---------------------------------+

-   While holding the key (Mac) or the Control key (Win), use the arrow
    keys on the keyboard to move the widget.

You can align multiple Widgets precisely on the Frame background.
To align Widgets:

-   Select two or more Widgets

-   From the **Modify** menu, choose Widget **Alignment**.

-   Select the desired alignment.

##### 4.3.3.6 Layering Widgets
In CogTool, Widgets can be drawn on top of each other, therefore, they
can partially or fully occlude other Widgets. You can set the order of
this layering with the standard drawing program commands to "Bring to
Front," "Bring Forward," "Send Backward," and Send to Back."
To layer Widgets:

-   Select one or more Widgets.

-   From the **Modify** menu, choose **Widget Layering**, then chose the
    desired layering command.

tions and demonstrating tasks (see **Chapter 5: Quantitative**
![](/assets/user-guide/media/image17.jpg)
 Drawing overlapping Widgets has
implications for defining Transi**Analysis** for more information
about).
4.3.3.7 Resizing Widgets
To resize a Widget:

-   Select the Widget.

-   Resize by clicking-and-dragging in the small white boxes at the
    corner of the Widget.

![](/assets/user-guide/media/image17.jpg)
 Resizing of complex Widgets may be more
complex; it will be discussed in the sections about those types of
Widget.
4.3.3.8 Cutting, Copying and Pasting Widgets
In CogTool, you can copy or duplicate a Widget.
To cut one or more Widgets:

-   Select the Widgets.

+-----------------+---------------------------------------------------+
| **Mac:** C      | -   From the **Edit** menu, choose **Cut          |
|                 |     Widget**.                                     |
| **Win:** CTRL+C |                                                   |
|                 | -   You will be asked to confirm the deletion. If |
| **Mac:** X      |     you click **Yes**, the Widgets will disappear |
|                 |     and be put on the clipboard, ready to be      |
| **Win:** CTRL+X |     pasted.                                       |
|                 |                                                   |
|                 | To copy one or more Widgets:                      |
|                 |                                                   |
|                 | -   Select the Widgets.                           |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Copy         |
|                 |     Widgets**.                                    |
|                 |                                                   |
|                 | The Widgets will be put on the clipboard, ready |
|                 | to be pasted.                                   |
+-----------------+---------------------------------------------------+

![](/assets/user-guide/media/image17.jpg)
 **W**hen you cut or copy a Widget, only
the contents of the Widget are copied; Transitions from that Widget
are not. If you want to preserve Transitions, use the **Duplicate**
command.
To paste a Widget into a Frame. • Open the target Frame window.

+-----------------+------------------------+------------------------+
| **Mac:** V      | • From the **Edit**  |                        |
|                 | menu, choose         |                        |
| **Win:** CTRL+V | **Paste**.           |                        |
|                 |                      |                        |
| **Mac:**        | This places the      |                        |
|                 | Widgets on the       |                        |
| **Win:**        | clipboard into the   |                        |
|                 | Frame. If the name   |                        |
| CTRL+DELETE     | of the pasted Widget |                        |
|                 | already exists in    |                        |
| **Mac:** D      | the Frame, the       |                        |
|                 | pasted Widget is     |                        |
| **Win:** CTRL+D | given a unique       |                        |
|                 | suffix (e.g.         |                        |
|                 | "LastWidget\[1\]").  |                        |
+=================+========================+========================+
|                 | ![](.//med             | When you paste a       |
|                 | ia/image17.jpg){width= | Widget into the same   |
|                 | "0.2699704724409449in" | Frame, it is pasted    |
|                 | height="               | directly on top of the |
|                 | 0.2699704724409449in"} | original Widget and is |
|                 |                        | given a new unique     |
|                 | ![](.//med             | suffix                 |
|                 | ia/image17.jpg){width= | ("MyWidget\[1\]").     |
|                 | "0.2699704724409449in" | Move the newly pasted  |
|                 | height="               | Widget off of the      |
|                 | 0.2699704724409449in"} | original to see both   |
|                 |                        | Widgets.               |
|                 | ![](.//medi          |                        |
|                 | a/image60.png){width=" | You can paste Widgets  |
|                 | 0.25333333333333335in" | into any Frame. You    |
|                 | height="             | can paste Widgets into |
|                 | 0.2966666666666667in"} | the Frame you just     |
|                 |                        | copied them from       |
|                 |                        | (similar to            |
|                 |                        | **Duplicate**), into a |
|                 |                        | different Frame in the |
|                 |                        | same Design, or into a |
|                 |                        | Frame in a different   |
|                 |                        | Design or Project.     |
|                 |                        |                        |
|                 |                        | Design, it is          |
|                 |                        | important that the     |
|                 |                        | Widgets be placed and  |
|                 |                        | sized identiIf the     |
|                 |                        | same interface Widget  |
|                 |                        | appears in different   |
|                 |                        | Frames of the          |
|                 |                        |                        |
|                 |                        | cally. This is       |
|                 |                        | imperative to ensure |
|                 |                        | the correct          |
|                 |                        | prediction of human  |
|                 |                        | performance when     |
|                 |                        | there are several    |
|                 |                        | actions in a row on  |
|                 |                        | the same Widget. To  |
|                 |                        | make sure that all   |
|                 |                        | Widgets are          |
|                 |                        | identical, you       |
|                 |                        | should create the    |
|                 |                        | Widget on one Frame  |
|                 |                        | and copy and paste   |
|                 |                        | it into all the      |
|                 |                        | other Frames. Not    |
|                 |                        | only is this more    |
|                 |                        | efficient, it        |
|                 |                        | ensures higher       |
|                 |                        | accuracy of          |
|                 |                        | performance          |
|                 |                        | predictions.         |
+-----------------+------------------------+------------------------+
|                 | 4.3.3.9 Deleting       |                        |
|                 | Widgets                |                        |
|                 |                        |                        |
|                 | To delete one or more  |                        |
|                 | Widget:                |                        |
|                 |                        |                        |
|                 | -   Select one or more |                        |
|                 |     Widgets            |                        |
|                 |                        |                        |
|                 | -   From the **Edit**  |                        |
|                 |     menu, choose       |                        |
|                 |     **Delete Widget.** |                        |
|                 |                        |                        |
|                 | -   You will be asked  |                        |
|                 |     to confirm the     |                        |
|                 |     deletion. If you   |                        |
|                 |     click **OK**, the  |                        |
|                 |     Widgets will       |                        |
|                 |     disappear..        |                        |
|                 |                        |                        |
|                 | ![](.//med           |                        |
|                 | ia/image17.jpg){width= |                        |
|                 | "0.2699704724409449in" |                        |
|                 | height="0.269970     |                        |
|                 | 4724409449in"}Deleting |                        |
|                 | a Widget has the     |                        |
|                 | same effect as       |                        |
|                 | cutting a Widget,    |                        |
|                 | except that the      |                        |
|                 | Widget is not on the |                        |
|                 | clipboard and cannot |                        |
|                 | then be pasted.      |                        |
|                 |                        |                        |
|                 | 4.3.3.10 Duplicating a |                        |
|                 | Widget                 |                        |
|                 |                        |                        |
|                 | When you copy a        |                        |
|                 | Widget, you only copy  |                        |
|                 | the content held       |                        |
|                 | within the Widget. No  |                        |
|                 | Transitions to other   |                        |
|                 | Frames are copied. To  |                        |
|                 | make an exact          |                        |
|                 | duplicate of a         |                        |
|                 | Widgets, including     |                        |
|                 | Transitions, use the   |                        |
|                 | **Duplicate** command  |                        |
|                 | instead of **Copy**.   |                        |
|                 |                        |                        |
|                 | To duplicate one or    |                        |
|                 | more Widget:           |                        |
|                 |                        |                        |
|                 | -   Select the         |                        |
|                 |     Widgets.           |                        |
|                 |                        |                        |
|                 | -   From the **Edit**  |                        |
|                 |     menu, choose       |                        |
|                 |     **Duplicate        |                        |
|                 |     Widget**.          |                        |
|                 |                        |                        |
|                 | This creates new     |                        |
|                 | Widgets slightly     |                        |
|                 | down and to the      |                        |
|                 | right of the         |                        |
|                 | original Widgets,    |                        |
+-----------------+------------------------+------------------------+

with the same Display Labels, but named with unique suffixes (e.g.
"LastWidget\[1\]").
OR

-   Select the Widgets.

-   Hold down the Option key (Mac) or Control key (Windows), click in a
    selected Widget and drag it to a new position.

This creates new Widgets at the point you released the mouse button,
with the same Display Labels, but named with unique suffixes (e.g.
"LastFrame\[1\]"). to the lower right of the original Widget and is
given a new unique
![](/assets/user-guide/media/image17.jpg)
 When you duplicate a Widget, an
identically sized Widget appears suffix.
![](/assets/user-guide/media/image65.png)
Text in CogTool's item names must be
within the ASCII printable character set. See
[http://en.wikipedia.org/wiki/ASCII\#ASCII\_
printable\_characters](http://act-r.psy.cmu.edu/) for the list of
admissible characters.
4.3.3.11 Creating a "Template" of Widgets
As discussed in the section on Creating Frames, when you are
prototyping a system that has many of the same widgets in multiple
Frames, e.g., a cellphone with many hard buttons or a airline cockpit
device like the Control Display Unit where only the screen changes
from Frame to Frame, CogTool provides an efficient way for you to
create a template of widgets that will automatically populate each new
Frame created in the Design.
To create a Frame Template of Widgets

-   In any Frame window, select the Widgets you want to be on every new
    Frame in the Design.

-   From the Modify menu, choose Set Frame Template.

-   Create new Frames, and each of them will be pre-populated with the
    Widgets in the template.

![](/assets/user-guide/media/image56.png)


Figure 4-16: All the Widgets that represent the hard keys on this
cellphone have been selected and, from the Modify menu, the designer
has chosen Set Frame Template. This is indicated in the status message
at the bottom left of the window, which reads:
"Frame Template created". Each time a new Frame is created in this
Design, it will already have these buttons in it.
To clear the Frame Template so your new Frames can be created empty,

-   From the Modify menu, choose Clear Frame Template.

#### 4.3.4 Simple Widgets: Links, Graffiti®, and Non-Interactive

![](/assets/user-guide/media/image66.png)
 Link Widget tool
![](/assets/user-guide/media/image67.png)
 Graffiti® Widget tool
![](/assets/user-guide/media/image68.png)
 Non-interactive Widget tool
Links, Graffiti®, and Non-interactive Widgets are the simplest type of
Widgets. Their Standard mode of creation and their Custom mode of
creation are the same, and the only settable properties are their
name, their display label, whether they are rendered, and whether they
have a background image. All the common actions on Widgets work on
these Widgets as described in the previous section.
The use of the Display Label is the only factor that requires some
thought when using these Widgets

-   Link Widgets usually use the Display Label as the text of the link.
    When a background image is used, you may not want to use a Display
    Label so the image of the link on the background image shows
    through.

-   Graffiti® widgets usually doesn't use a Display Label because any
    text typed into the Display Label field will show up in the
    Graffiti® Widget and the Graffiti® area on a UI is usually blank.

-   a Non-interactive Widget represents a place on the display that
    users deliberately look at to see and comprehend information in the
    course of doing their work, but they do not click on or otherwise
    interact with that information. Non-interactive Widgets often use
    their Display Labels to present that information, or they are placed
    on top of a background image with no Display Label, or they have a
    Widget image and again no Display Label.

#### 4.3.5 Moded Widgets: Buttons and Checkboxes

![](/assets/user-guide/media/image69.png)
 Button Widget tool
![](/assets/user-guide/media/image70.png)
 Checkbox Widget tool
Buttons and Checkboxes are moded Widgets, in that, when they are
created as Standard Widgets, they can be in one of two states. Buttons
can be defined so they can be toggled (selected and not-selected);
Checkboxes can be checked or unchecked. The initial state of these
moded Widgets must be set so that it is in the correct state when the
Design enters the Frame. This state is set in the Widget properties
pane.
Except for setting state, Buttons and Checkboxes respond to all the
common actions on Widgets, as described in a previous section.
state with custom Buttons and Checkboxes, you would have to
![](/assets/user-guide/media/image17.jpg)
 Custom Buttons and Checkboxes do not
have state. To simulate
have different images (one selected and one un-selected) on different
Frames, with click transitions to move between those Frames. Standard
Buttons and Checkboxes do this behavior for you.
4.3.5.1 Buttons
![](/assets/user-guide/media/image71.jpg)
 Button Widget tool
After creating a Button Widget in standard mode, its Widget properties
pane will appear. At the bottom of this pane is a check box
determining whether this button should toggle or not. If you check
this box, then the check box for whether it should be initially
selected or not can be checked.

![](/assets/user-guide/media/image72.png)

Figure 4-17: The Widget properties pane where Button Widgets can be
made toggleable and but not initially selected.
When rendered in one of the operating system skins, the Button will
look different when it is selected or not selected. (It will not look
different rendered in wire frame or when not rendered.)
![](/assets/user-guide/media/image73.jpg)

Figure 4-18: Two toggleable buttons, rendered with the Mac OSX skin.
The one on the left is selected; the one on the right is. When
selected, the button appears depressed, whereas the un-selected button
appear slightly raised.
Some words that are commonly used in Button Names and Display Labels
have special meaning to CogTool. They signal termination of a Task,
which has been shown by prior psychology research to effect people's
behavior. These words are: Cancel, Yes, No, Exit, Abort, Quit, Save,
Done, and OK. If either the Widget's Name or Display Label is exactly
one of these words (not case sensitive), CogTool will make different
human performance predictions than if it is something slightly
different (e.g., "OK-button" instead of "OK"). Be sure to use one of
these exact words as the button's Name or Display Label if it does
indeed function as the terminator of a task.
4.3.5.2 Checkboxes
![](/assets/user-guide/media/image74.jpg)
 Checkbox Widget tool Checkbox Widgets
are always moded; they can be checked (selected) or unchecked (not
selected). In the Widgets property pane of a Checkbox Widget, set the
inital state of the Widget with the Inially-Selected chackbox at the
bottom of the pane.
![](/assets/user-guide/media/image75.jpg)

Figure 4-19: Checkbox Widgets can be initially selected (checked).
The biggest advantages of using standard Checkboxes is realized when
you render them and use Display Labels. When rendered, a box is put to
the left of the Display Label to act as the Checkbox. A rendered
Checkbox will look different when it is selected or not selected. It
will have a check or X in it when selected, depending on which skin is
used for rending.
![](/assets/user-guide/media/image76.jpg)

Figure 4-20: Two Checkboxes, rendered with the Mac OSX skin. The one
on the top is not selected; the one on the bottom is.
4.3.5.2.1 Creating Checkbox Widgets
In many interfaces, Checkboxes are aligned vertically in one or more
columns.. Therefore, CogTool makes it easy to create a set of aligned
Checkbox Widgets.
![](/assets/user-guide/media/image74.jpg)
To create a set of Checkbox Widgets.

-   From the toolbar, select the Checkbox tool

-   Drag a rectangle across an area of the open Frame large enough to
    contain the Checkbox square and the longest Display Label in the set
    of Checkboxes.

![](/assets/user-guide/media/image77.jpg)
 At this point, you are not sizing the
area that will be occupied by the entire set of checkboxes; You are
sizing only the single Checkbox that has the longest Display Label.

-   A Widget appear that has one highlighted Widget (in orange, below)
    with its Display Label ready to receive typing (white box). Type the
    Display Label for the first checkbox and it will appear in the white
    box that appears on the Widget.

![](/assets/user-guide/media/image78.png)

-   Pressing the Enter key will create the first Checkbox and move the
    cursor to the Checkbox below the first.

![](/assets/user-guide/media/image79.png)


-   Continue to label the Checkboxes by typing in the white box and
    hitting Enter to get to the next Checkbox. This creates a column of
    Checkboxes.

![](/assets/user-guide/media/image77.jpg)
 Checkboxes can be a column of items or
a grid of items comprised of rows and columns. To create a second
column of items, navigate to the Checkbox Widget in the top of the
column using the arrow keys (or clicking on it), then press the right
arrow key on the keyboard, and type the label in the white box that
appears to the right of the top Checkbox Widget.
![](/assets/user-guide/media/image80.jpg)


-   The checkbox image is inserted into the Checkbox Widget when the
    Widget is rendered (check **Render Widget Skin** in the Widget
    properties pane).

![](/assets/user-guide/media/image77.jpg)
 The checkbox image size is determined
by the size of the checkbox Widget. The size of the checkbox image
itself can not be changed manually. However, you can use a background
button image to get a box of the desired size if you like.
![](/assets/user-guide/media/image81.png)
Figure 4-21 The Frame window with a set of Checkbox Widgets. The
**Render Widget Skin** checkbox must be selected for the boxes to
appear on the Widget (this example has the Mac skin set for the
design). The first checkbox is initially selected, because that box is
selected at the bottom of the Widget Properties pane.
![](/assets/user-guide/media/image77.jpg)
 You cannot reorder the individual
Checkbox Widgets after you have created the set. If you want to change
the order of the Checkbox Widgets, you will have to retype the
information in the Displayed Label field on the Widget or in the
Widget Properties pane.
4.3.5.2.2 Arranging Checkbox Widgets
The grid on which the Checkbox Widgets are laid out can be manipulated
to fill the space you wish it to occupy. You can have different
amounts of space between subsets of checkboxes. This allows you to
make room between sets of checkboxess for other widgets that are
enabled only when a checkbox is selected (e.g., a set of radio buttons
or a set of check boxes).

-   Click on the checkbox above or to the left of which you want to
    insert white space. A bold line appears on the top and, if there are
    checkboxes to the left, at the left of this Widget.

-   Grab the line and move it to wherever you want the Widgets to be
    placed.

![](/assets/user-guide/media/image82.jpg)

Figure 4-22: A progression of checkboxes being arranged. At the left,
the user selected the Widget called "item 4", which highlighted it and
showed the bold blue lines on the top and left. The user grabs the
left blue line and moves it to the right, moving the column of buttons
as shown in the center.. The user then grabs the top blue line and
moves it down, resulting in the arrangement on the right.

#### 4.3.6 Radio Buttons: A Set of Widgets Working Together

![](/assets/user-guide/media/image83.png)
 Radio Button Widget tool
Standard Radio Buttons are created as a set and CogTool enforces that
only one of them can be selected at any time. (If you create Radio
Buttons in custom mode, you must manage that behavior yourself with
multiple Frames and Transitions between them.)
Except for creating and arranging, Radio Button Widgets respond to all
the common actions on Widgets, as described in a previous section.
The biggest advantages of using standard Radio Button Widgets is
realized when you render them and use Display Labels. When rendered, a
circle is put to the left of the Display Label to act as the Radio
Button. A rendered Radio Button will look different when it is
selected or not selected. It will have a filled circle when selected,
depending on which skin is used for rending.
4.3.6.1 Creating Radio Button Widgets
To create a set of Radio Button Widgets:

-   From the toolbar, select the Radio Button tool
    ![](/assets/user-guide/media/image84.png)
    

-   Drag a rectangle across an area of the open Frame large enough to
    contain the Radio Button circle and the longest Display Label in the
    set of Radio Buttons.

![](/assets/user-guide/media/image77.jpg)
 At this point, you are not sizing the
area that will be occupied by the entire set of radio buttons,; You
are sizing only a single Radio Button that has the longest Display
Label.

-   A Widget appear that has one highlighted Widget (in orange, below)
    with its Display Label ready to receive typing (white box). Type the
    Display Label for the first radio button and it will appear in the
    white box that appears on the Widget.

![](/assets/user-guide/media/image85.png)


-   Pressing the Enter key will create the first Radio Button and move
    the cursor to the Radio Button below the first.

![](/assets/user-guide/media/image86.png)


-   Continue to label the Radio Buttons by typing in the white box and
    hitting Enter to get to the next Radio Button. This creates a column
    of Radio Buttons.

![](/assets/user-guide/media/image77.jpg)
 Radio buttons can be a column of items
or a grid of items comprised of rows and columns. To create a second
column of items, navigate to the radio button Widget in the top of the
column using the arrow keys (or clicking on it), then press the right
arrow key on the keyboard, and type the label in the white box that
appears to the right of the top Radio Button Widget.
![](/assets/user-guide/media/image80.jpg)


-   The radio button image is inserted into the radio button Widget when
    the Widget is rendered (check **Render Widget Skin** in the Widget
    properties pane).

![](/assets/user-guide/media/image77.jpg)
 The radio button image size is
determined by the size of the radio button Widget. The size of the
radio button image itself can not be changed manually. However, you
can use a background button image to get a radio button of the desired
size.

-   You can specify which Radio Button is initially selected by choosing
    that item from the **Initially Selected Item** pull-down list on the
    property pane of any of the Radio Buttons in the set.

![](/assets/user-guide/media/image87.png)

Figure 4-23: The Frame window with a set of radio button Widgets,
rendered with the
Macintosh skin. The **Render Widget Skin** checkbox must be selected
for the radio buttons to appear on the Widget. Item 1 is the
**Initially Selected Item.**
![](/assets/user-guide/media/image77.jpg)
 You cannot reorder the individual radio
button Widgets after you have created the set. If you want to change
the order of the buttons, you will have to retype the information in
the Displayed Label field on the Widget or in the Widget Properties
pane.
4.3.6.2 Arranging Radio Buttons
The grid on which the Radio Buttons are laid out can be manipulated to
fill the space you wish it to occupy. You can have different amounts
of space between subsets of Radio Buttons. This allows you to make
room between sets of radio buttons for other widgets that are enabled
only when a radio button is selected (e.g., another set of radio
buttons or set of check boxes).

-   Click on the radio button above or to the left of which you want to
    insert white space. A bold line appears on the top and, if there are
    Radio buttons to the left, at the left of this Widget.

-   Grab the line and move it to wherever you want the Widgets to be
    placed.

![](/assets/user-guide/media/image88.jpg)

Figure 4-24: A progression of Radio Buttons being arranged. At the
left, the user selected the Widget called "radio 5", which highlighted
it and showed the bold blue lines on the top and left. The user grabs
the left blue line and moves it to the right, moving the column of
buttons as shown in the center.. The user then grabs the top blue line
and moves it down, resulting in the arrangement on the right.

#### 4.3.7 List Boxes: Widgets Combined to Make a Whole

![](/assets/user-guide/media/image89.jpg)
 List Box Widget tool
A standard List Box is created as a set of items combined into one
List Box that is automatically aligned and can move together as one
Widget. CogTool does not yet have the capability of making List Box
Widgets behave like real List Boxes (e.g., a large list cannot extend
beyond a window, they cannot scroll, etc.), but the ease of entering,
rearranging, aligning and moving as a whole is better than making
separate custom List Boxes and manipulating them separately yourself.
Except for creating, changing the order of items, and moving, List Box
Widgets respond to all the common actions on Widgets, as described in
a previous section.
The biggest advantages of using standard List Box Widgets is realized
when you use Display Labels.
4.3.7.1 Creating a List Box
To create a list box:

-   Select the list box icon ![](/assets/user-guide/media/image89.jpg)
     from the Widget toolbar.

-   Drag a rectangle across an area of the Frame large enough to contain
    the longest Display Label in list.

![](/assets/user-guide/media/image77.jpg)
 At this point, you are not sizing the
area that will be occupied by the entire list; You are sizing only a
single List Box item that has the longest Display Label.

-   A Widget appear that has one highlighted Widget (in orange, below)
    with its Display Label ready to receive typing (white box). Type the
    Display Label for the first item and it will appear in the white box
    that appears on the Widget.

![](/assets/user-guide/media/image90.jpg)


-   Pressing the Enter key will create the first list item and move the
    cursor to the list item below the first.

![](/assets/user-guide/media/image91.jpg)


-   Continue to label the items by typing in the white box and hitting
    Enter to get to the next item, until all the items in that part of
    the List Box that will be visible in our Design in this Frame are
    entered.

it than are visible at any one time, you can simulate that by having
![](/assets/user-guide/media/image92.png)
 If the real List Box you are trying to
represent has more items in
only the first visible lines in the List Box on the first Frame, put a
custom Button Widget that looks like a down-scroll arrow next to the
bottom of the List Box Widget. This button can transition to another
Frame that has a List Box Widget with the next set of items visible in
it. This Frame can have a custom Button Widget than looks like an
up-scroll arrow next to the List Box Widget, that transitions back to
the previous Frame. You can simulate any length List Box through a
series of Frames in this way.
4.3.7.2 Rearranging List Box Items
To change the order of a List Box item:

-   Click the List Box item to select it.

-   Drag the List Box item to a new location within the same List Box
    Widget or to another List Box Widget.

![](/assets/user-guide/media/image17.jpg)
 When you drag a Widget, an outline of
the Widget and a bold black position indicator will appear. Drag the
Widget until the
position indicator is at the desired location, then release. In the
figure below, List item 3 is being moved up to be btween List item 1
and 2. The thin black outline (shown intersecting the labels of List
item 1 and 2) moves as you drag the widget and the bold black line
indicates where it will be placed.
![](/assets/user-guide/media/image93.jpg)

4.3.7.3 Moving List Box Widgets
To move a List Box Widget:

-   Click any List Box item to select the Widget.

A bold gray outline will appear around the entire List Box Widget.

-   Grab the bold gray outline (not the middle of the Widget, as with
    simple widgets or when rearranging list items) and drag the entire
    List Box Widget to a new location in the Frame.

#### 4.3.8 Pull-Down Lists: More Complex Behavior

![](/assets/user-guide/media/image94.png)
 Pull-Down List Header Widget tool
Like the List-Box Widget, a standard Pull-Down List Widget is created
as a set of items combined into one Pull-Down List that is
automatically aligned and can move together as one Widget. In
addition, CogTool knows how Pull-Down List items work together and
produces that behavior for you automatically. It is *possible* to
simulate this behavior using the custom Pull-Down List Header Widget
and Pull-Down List Item Widgets (only available in custom mode), but
it will involve many Frames and Widgets to do so.
The biggest advantages of using standard Pull-Down Widgets is realized
when you use Display Labels.
Except for creating, changing the order of items, and moving,
Pull-Down Widgets respond to all the common actions on Widgets, as
described in a previous section.
4.3.8.1 Creating Pull-Down List Widgets
To create a Pull-Down List Widget, follow steps very similar to
creating a List Box Widget:

-   Select the Pull-Down Header List tool
    ![](/assets/user-guide/media/image95.png)
     from the Widget toolbar.

-   Drag a rectangle across an area of the Frame large enough to contain
    the longest Display Label in the Pull-Down List.

![](/assets/user-guide/media/image77.jpg)
 Make the rectangle wide enough to
contain the Pull-Down List item that has the longest Display Label.

-   A Widget appear that has one highlighted Widget (in orange, below)
    with its Display Label ready to receive typing (white box). Type the
    Display Label for the first item and it will appear in the white box
    that appears on the Widget.

![](/assets/user-guide/media/image96.png)

header of the list rather than a member of the list itself. As soon
![](/assets/user-guide/media/image77.jpg)
 The first item of a Pull-Down List
Widget is special. It acts as a
as a member of the list is selected, this header will disappear from
the user's view of the list. First items tend to be something like
"\[None\]", "Please select an item\...", or it can even be left blank.
Type in whatever you want your user to see before picking any item
from this pull-down list.

-   Pressing the Enter key will create the first list item and move the
    cursor to the list item below the first.

![](/assets/user-guide/media/image97.png)


-   Continue to label the items by typing in the white box and hitting
    Enter to get to the next item, until all the items in that part of
    the Pull-Down List.

-   The Pull-Down List Widget will contract to a single item, the first
    (header) item, when you stop typing and click anywhere else in the
    Frame window, e.g., on the Widget properties pane.

-   ![](/assets/user-guide/media/image98.jpg)
    You can determine which list item
    appears when the Pull-Down List Widget is contracted by choosing
    that item from the **Initially Selected Item** pull-down list at the
    bottom of the Widget's property pane (See Figure 4-25). If you leave
    that pull-down at **None Selected,** the special first item (the
    header) will be displayed when entering this Frame. disappear from
    the displayed Widget if another item is selected. The first item of
    a Pull-Down List Widget acts as a header and will

![](/assets/user-guide/media/image99.png)
Figure 4-25 : The Frame window with a Pull-Down List Widget. If items
1, 2 or 3 were chosen as the Initially Selected item (from the
pull-down list at the bottom right), "Select One Item" would not be
displayed in the prototype.
4.3.8.2 Rearranging Pull-Down List Items
To change the order of a Pull-Down List item:

-   Click the displayed Pull-Down List item to expand the Pull-Down
    List.

-   Drag the desired Pull-Down List item to a new location within the
    same PullDown List Widget or to another Pull-Down List Widget.

![](/assets/user-guide/media/image17.jpg)
 When you drag a Pull-Down List item, an
outline of the item and a bold black position indicator will appear.
Drag the item until the position indicator is at the desired location,
then release. (See Figure 4-26).
![](/assets/user-guide/media/image98.jpg)
 list items cannot be dragged on top of
the header. If you try to The first item of a Pull-Down List Widget
acts as a header. Other
drag and item above the header, the cursor will change to a slashed
circle to indicate that you cannot do that action. If you want to
change the header, type in a new word in the header Display Label.
![](/assets/user-guide/media/image100.png)

Figure 4-26: Pull-down list item 2 is selected for reordering, drag it
until the bold black line is in the position you want, then release.
4.3.8.3 Moving Pull-Down List Widgets
To move a Pull-Down List Widget:

-   Click the displayed Pull-Down List item to select the Widget.

A bold gray outline will appear around the entire Pull-Down List
Widget.

-   Grab the bold gray outline (not the middle of the Widget, as with
    simple widgets or when rearranging list items) and drag the
    Pull-Down List Widget to a new location in the Frame.

#### 4.3.9 Menus and Context Menus: Highly Complex Behavior

The complex behavior of a hierarchical menu system, be it with regular
menus at the top of a screen or window, or context menus that pop-up
when you right-click on an object, is automatically prototyped for you
using standard Menu and Context Menu Widgets. Like List-Box and
Pull-Down List Widgets, a standard Menu or Context Menu Widget is
created as a set of items combined into one. The items are
automatically aligned and can move together as one Widget. In
addition, CogTool produces the behavior of opening and closing menus
for you automatically. It is *possible* to simulate this behavior with
a combination of custom Menu Header, Submenu, Menu Item and Context
Menu Widgets, but it will involve a multitude of Frames and Widgets to
do so as completely as standard Menus and Context Menus do.
The biggest advantages of using standard Menu or Context Menu Widgets
is realized when you use Display Labels.
With the exception of creation, operations on a menu system are the
same for both the type of menu system that is always visible (e.g., at
the top of a screen (Mac) or a window (Windows) and context menus that
pop-up at the cursor when invoked from an object on the screen
(usually with right-click on Windows or CTRL-click on Mac). Operations
that are the same will be described only once using examples from menu
systems that are always visible.
4.3.9.1 Creating a Menu System
When creating menu Widgets in standard mode, CogTool makes creating an
entire menu system a simple matter of typing in the menu headers,
submenus, and menu items. You can create menus that are always
visible, like the ones at the top of the screen in a Mac or at the top
of windows in Windows, or context menus that pop-up at your cursor.
4.3.9.1.1 Creating Menus that are Always Visible
![](/assets/user-guide/media/image101.png)
 Menu Header Widget tool
To create a menu system that is always visible:

-   Select the Menu Header tool
    ![](/assets/user-guide/media/image102.png)
     from the Widget toolbar.

-   Drag a rectangle across an area of the open Frame. Try to size this
    first menu header Widget to fit the longest label in the set.

easier if you make the rectangle wide enough to contain the Menu
![](/assets/user-guide/media/image40.png)
 Although you can re-size the entire
menu system later, it will be
Header that has the longest Display Label.

-   Type you fist menu header into the white box that appears in the
    retangle.

![](/assets/user-guide/media/image103.png)


-   Hit Enter, This creates the File Menu Header and puts your cursor
    into the white box of the first menu item. Type the first menu item.

![](/assets/user-guide/media/image104.png)


-   Each time you hit Enter, CogTool creates a new menu item (the one
    you just typed in) and a spot to enter the next menu item. So just
    keep typing to enter in as many menu items as your system requires.

-   To make a submenu with items that expand out to the side, select any
    menu item and click in the white box to its right, or use the arrow
    keys to navigate to the menu item and out into the white box on the
    right.

![](/assets/user-guide/media/image105.png)


-   As before, start typing in the top white box and every time you hit
    Enter, CogTool creates a submenu item and new spot for another one.
    When a submenu is created, CogTool automatically puts an arrow
    pointing to the right, to indicate that a submenu is available at
    this menu item.

![](/assets/user-guide/media/image106.jpg)


-   At any time, you can navigate around this menu system either by
    clicking on the menu item you want or navigating to it with the
    arrow keys.. You can then add more items as necessary. It you
    navigate off of a submenu, it will contract (as below), but its
    arrow pointing to the right indicates that its submenu will reappear
    if you select that item again.

![](/assets/user-guide/media/image107.jpg)


-   Navigate up to the menu header (File) and examine the menu
    properties. There is a unique Widget Name automatically assigned by
    CogTool (in this case, "Widget 2"). You can change it if you wish,
    but it is not necessary for the proper operation of CogTool. The
    Display Label is the words you typed in (in this case, "File"). The
    center of the properties pane is the same as for any other Widget.
    Below Capture Background, there are a few items specific to Menu
    Headers. If you have submenus under this header, you can set whether
    they will open by a click of by hovering on them. Hover is chosen by
    default and if leave it, then you can set the time that the system
    waits before opening the submenu to 0.0 seconds (typical for a Mac)
    or 0.5 seconds (typical for a PC).

![](/assets/user-guide/media/image17.jpg)
 Each menu header has Hover and 0.0
seconds chosen by default.

If you do not want the default, you must change each Menu Header
separately in its property pane.
![](/assets/user-guide/media/image108.png)


-   To add more menu headers, navigate back to the top row, and a spot
    for a new header appears to the right. Type the menu header name
    into it and hit Enter, then continue making its menu items as
    before.

![](/assets/user-guide/media/image109.jpg)


-   To make a menu separator, type "\-\--" as the menu item.

![](/assets/user-guide/media/image110.jpg)


-   When you hit Enter, the \-\-- will be turned into a special menu
    item called a Separator, which is indicated by the checkbox under
    the Display Label in Widget properties pane. A Separator cannot be
    selected when demonstrating Tasks on a menu system. You can always
    change a Separator back to a regular menu item by un-checking the
    checkbox.

![](/assets/user-guide/media/image111.png)

4.3.9.1.2 Creating a Context Menus
![](/assets/user-guide/media/image112.jpg)
 Context Menu Widget tool
To create a context menu and its children (submenus and menu items):

-   Select the Context Menu tool
    ![](/assets/user-guide/media/image112.jpg)
     from the Widget toolbar.

-   Drag a rectangle across an area of the open Frame where a user would
    click to bring up the context menu.

![](/assets/user-guide/media/image55.jpg)
 Make the rectangle big enough to
contain the item that will be clicked on to pop-up the context menu.
If it is a word, then you can use a Display Label in this widget. If
it is a picture, you can use a background image (either on the Frame
or in this Widget).

-   Check the properties pane to make sure the values are as you wish.
    If there are submenus the action and delay are set as with the menus
    that are always visible. The action that brings up the context menu
    is set at the very bottom (right click (PC) or CTRL-click (Mac)).

-   Type the labels in for the context menu items, hitting Enter between
    each one. Do not worry if the menu item labels do not fit in the
    displayed box at the moment, you can change the size of all of them
    at once after typing them all in. Add submenus as needed to
    prototype your design.

![](/assets/user-guide/media/image113.jpg)

Figure 4-27: The right side (a) shows the behavior we would like to
prototype, a context menu that comes up if you ctrl-click anywhere on
the Fiefox toolbox the Mac. The left side (b) shows how it would be
done in CogTool. Create a Context Menu Widget with an image of the
Firefox toolbar as its image. Type in the items in the menu, with
separators, into the fields in the widget. Set the delay time and the
action in the properties pane.
4.3.9.2 Selecting Menu Widgets
Menus are complex Widgets with many parts, consequently, selection is
more complex than with simpler Widgets. The examples are from menus
that are always visible, but selection works the same for context
menus.

-   To select a single item in a menu system, click on it. It will
    highlight by turning a different color from the Widget layer color
    (in this section, the Widget layer color is green and purple
    indicates selection). The Widget's properties are displayed in the
    properties pane.

![](/assets/user-guide/media/image114.jpg)


-   The File menu header widget is selected in the picture above. The
    thick gray outline around the menu headers when a Menu Header is
    selected (e.g., File), indicate where to grad to drag the whole menu
    system around to place it where you want it in the Frame (see Moving
    Menu Systems). The little white boxes in the corners indicate where
    to grab to re-size the menu headers. (See Re-Sizing Menus).

![](/assets/user-guide/media/image115.png)


-   Save is selected in the picture above. The little white boxes in the
    corners indicate where to grab to re-size the menu items. (See
    Re-Sizing Menus)

To select multiple menu headers

-   Hold down the Shift key and click on all the items you want to
    select. Each one will turn to the highlighting color. File and
    Format are selected, below. When multiple menu headers are selected,
    the Widget properties pane does not show the properties of any
    Widget.

![](/assets/user-guide/media/image116.jpg)

![](/assets/user-guide/media/image17.jpg)
 You cannot select multiple menu items,
only menu headers. Menu items must be manipulated one at a time.
When you are creating menu items, the item you are in the middle of
creating is not selected until you hit Enter (because it doesn't exist
as a menu item until you hit Enter). Thus, while you are typing in the
name of a menu item, the menu item above it is selected, is
highlighted, and its information is in the properties pane. In the
picture below, "Delete" has just been typed in, which is indicated by
the white box surrounded by light blue. But the Paste menu item is
selected and its properties appear in the properties pane.
![](/assets/user-guide/media/image117.jpg)

4.3.9.3 Re-sizing Menu Widgets
To change the size of menu widgets,

-   Select a menu header or item. That item will highlight in a color
    opposite to the Widget layer color, and small white squares will
    appear at the corners of the column (for submenus or menu items) or
    row (for menu headers).

-   Position your cursor on one of the white squares and drag it to the
    desired size.

4.3.9.4 Moving Menu Widgets
To change the location of the entire menu system in a Frame,

-   Select one of the menu headers. That menu header will be highlighted
    and a thick gray outline will appear around all the menu headers.

-   Position your cursor on the thick gray outline and drag it to the
    desired location.

To move a Widget (menu header, submenu, or menu item) within a menu
system:

-   Click the Widget to select it. It will highlight in a color
    different from the Widget color (e.g., the Widget layer is green and
    the highlight is purple).

-   Drag the Widget to a new location within the same menu system. When
    you drag a Widget, a halo, or outline, of the Widget and a black
    position indicator will appear. Drag the Widget until the position
    indicator is in the location you wish to move the Widget, then
    release.

![](/assets/user-guide/media/image118.jpg)

Figure 4-28: The Save menu item in being moved up in the menu. Save is
purple because it is the menu item being moved. The black out line
moves with your cursor as you drag the menu item around. The black bar
indicates that if the mouse button were to be released now, the Save
menu item would appear in between Open and Open Recent.
![](/assets/user-guide/media/image17.jpg)
 Holding the Option key (Mac) or
Control key (Windows) while dragging duplicates the menu item, leaving
the original in place.

![](/assets/user-guide/media/image17.jpg)
 You can move a menu header and all its
items will move with it.

Likewise, you can move a submenu and all its items will move with it.
![](/assets/user-guide/media/image17.jpg)
 You can move a menu item within its
menu (as shown above), or another menu or submenu in the same menu
system, or even to another menu system in the Frame. When moving menu
items to menus other than its own, hover over the target menu long
enough to let it expand so you can properly place the item you are
dragging. Do not release the mouse button until the black bar is in
the position you want.
4.3.9.5 Copying/Cutting/Pasting Menu Headers and Their Items
When you copy a menu header within a menu system, you are also copying
all the submenu and menu items that are under the menu header.
To copy a menu header:

-   Click the menu header to select it.

+-----------------+-----------------------------------------------------+
| **Mac:** C      | -   From the **Edit** menu, choose **Copy Widget**. |
|                 |                                                     |
| **Win:** CTRL+C | To cut a menu header:                               |
|                 |                                                     |
| **Mac:** X      | -   Click the menu header to select it.             |
|                 |                                                     |
| **Win:** CTRL+X | -   From the **Edit** menu, choose **Cut Widget**.  |
|                 |                                                     |
| **Mac:** V      | To paste a menu header:                             |
|                 |                                                     |
| **Win:** CTRL+V | -   Click the menu header to select it.             |
|                 |                                                     |
|                 | -   From the **Edit** menu, choose **Paste**.       |
+-----------------+-----------------------------------------------------+

![](/assets/user-guide/media/image38.jpg)
Although you can select individual submenu or menu
item Widgets, cannot copy, cut, and paste them. When one of these
items is selected, the Cut and Copy items in the CogTool Edit menu are
grayed out and the keyboard shortcuts do not work.
4.3.9.6 Copying/Cutting/Pasting an Entire Menu System
To copy an entire menu system:

-   Select all the menu headers in the system using Shift-Click, or by
    holding Shift while dragging a rectangle across them. Be sure to
    capture all the menu headers you want to copy..

![](/assets/user-guide/media/image119.jpg)


+-----------------+---------------------------------------------------+
|                 | Figure 4-29: Selecting all the menu Widgets in  |
|                 | a menu system by holding Shift while dragging   |
|                 | across them.                                    |
+=================+===================================================+
| **Mac:** C      | • From the **Edit** menu, choose **Copy         |
|                 | Widgets**.                                      |
| **Win:** CTRL+C |                                                   |
+-----------------+---------------------------------------------------+

![](/assets/user-guide/media/image98.jpg)
 copying any submenu and menu item
Widgets connected to them When you copy all the menu headers in a
system, you are also
(thus, the entire menu system).
To cut an entire menu system:

-   Select all the menu headers in the system by holding Shift while
    dragging a rectangle across them.

+-----------------+---------------------------------------------------+
| **Mac:** X      | -   From the **Edit** menu, choose **Cut          |
|                 |     Widgets**.                                    |
| **Win:** CTRL+X |                                                   |
|                 | To paste an entire menu system:                   |
| **Mac:** V      |                                                   |
|                 | -   Select all the menu headers in the system by  |
| **Win:** CTRL+V |     holding Shift while dragging a rectangle      |
|                 |     across them.                                  |
|                 |                                                   |
|                 | -   From the **Edit** menu, choose **Paste**.     |
+-----------------+---------------------------------------------------+

![](/assets/user-guide/media/image17.jpg)
 If you select non-contiguous menu
headers when you copy or cut, the gaps between them will be removed
when you paste

#### 4.3.10 Working with Text Boxes & Text

![](/assets/user-guide/media/image120.jpg)
 Text Box Widget tool
![](/assets/user-guide/media/image121.jpg)
 Text Widget tool
Text Box Widgets and Text Widgets are used together to prototype
interactions with editable text in an interface. Text box Widgets
typically contain Text Widgets, just as text boxes in an actual
interface contain editable text.
In a real interface, user do three types of things in a text box: (1)
click on it to place the cursor there so they can type (2) type into
an empty text box, and (3) edit text that is already in a text box..
If your prototype will only need to mock-up the first two actions,
clicking and typing into an empty box, then a Text Box Widget is all
you need. If, however, you need to prototype more sophisticated text
interactions (e.g. dragging over some text to highlight it, clicking
before words to add new text, clicking at the end of text to insert
more, etc.) then you need to use text Widgets as well.
![](/assets/user-guide/media/image122.png)
 entering text, then you can use a Text
Box Widget alone. If your prototype needs only clicking in an empty
text box and
![](/assets/user-guide/media/image39.png)
 Text Widgets, too, usually inside a
Text Box Widget. If your prototype needs to select or edit existing
text, you must use
All common operations on simple Widgets apply to Text and Text Box
Widgets.
4.3.10.1 Creating a Text Box
![](/assets/user-guide/media/image120.jpg)
 Text Box Widget tool
To create a text box Widget:

-   Select the text box tool
    ![](/assets/user-guide/media/image120.jpg)
     from the Widget toolbar.

-   Drag a rectangle across an area of the Frame where you want the text
    box to be.

![](/assets/user-guide/media/image123.jpg)


-   If you want this text box to be empty when this Frame is entered,
    then type in a meaningful Widget name for this text box (e.g., as
    above, "AddressTextBox"). Do not type anything into the Display
    Label, because this will be displayed inside the text Box Widget, as
    below.

![](/assets/user-guide/media/image124.jpg)

![](/assets/user-guide/media/image18.png)
 If you want your text box to have
content when the prototype enters this frame, then put that content in
the Display Label. For example, if you are prototyping a web site that
remembers people's address after they have entered it, the first frame
with an address text box will not have a Display Label in the Text Box
Widget, but the second Frame will.
![](/assets/user-guide/media/image53.png)

![](/assets/user-guide/media/image126.png)
 Text boxes Widgets can be any size, and their display
labels can be any number of characters, but CogTool will only show one
line of text. If your interface requires multiple lines of text,
create draw a Text Box of the correct size and use multiple Text
Widgets inside it to simulate multiple lines of text. Or, if you are
not editing the text, use a background image showing the multiple
lines of text in your interface.
4.3.10.2 Creating Editable Text, an Example
Consider the task of fixing an error in the name entered in a text
box. The name is supposed to be "Harry Q. Bovik", but someone entered
"Harvey Q. Bovik". There are several ways of fixing this text, and the
following examples will demonstrate how to use Text and text Box
Widgets to prototype three of them.
Most prototypes of editable text start with creating a Text Box Widget
and a Text Widget with the text-to-be-edited inside it.

-   Create a Text Box Widget as shown in the previous section.

-   Select the text tool
    ![](/assets/user-guide/media/image121.jpg)
     from the Widget toolbar.

-   Drag a rectangle the size of the text you are going to edit. This is
    typically smaller than the Text Box Widget it will be inside. The
    type in the text you want to edit into the Display Label.

![](/assets/user-guide/media/image127.png)
 It is easier to work with the Text
Widget if you create it outside the Text Box Widget (se shown below)
and move it inside afterwards.
![](/assets/user-guide/media/image128.png)


-   Move the Text Widget into the Text Box Widget. You are now ready to
    prototype several ways of changing "Harvey Q. Bovik" to "Harry Q.
    Bovik".

![](/assets/user-guide/media/image129.png)

4.3.10.2.1 Place the Cursor, Delete and Type the Right Letters.
In a real interface, a user might place the cursor between the "e" and
the "y" in "Harvey", and then delete the "ve" and type "r". To set up
the Frame so this method can be prototyped, there needs to be a target
widget between the "e" and the "y" to click on.

-   Create a tiny Text Widget outside the Text Box Widget. Give it a
    meaningful name (e.g., "Between\_e\_y")

-   Move it to between the "e" and the "y". (The picture below is zoomed
    in to

400% to make this widget more visible.)
![](/assets/user-guide/media/image130.jpg)

Now your Frame has a target for the click that is needed to start this
method. We will see how this plays out when defining Transitions in
the next section and demonstrating this task in the next Chapter.
4.3.10.2.2 Double-Click on the Incorrect Name, Type the Correct Name.
In a real interface, a user might double-click on "Harvey" to
highlight it, then type "Harry". To set up the Frame so this method
can be prototyped, there needs to be a target Widget on "Harvey" to
double-click on.

-   Create a Text Widget the size of Harvey outside the Text Box Widget.
    You can either give it a meaningful name (e.g., "Harvey") or let it
    have a Display Label of

"Harvey". (Either way, "Harvey will appear in the Frame.)

-   Move it to lie on top of "Harvey" in the Text Wdiget.

![](/assets/user-guide/media/image131.jpg)

Now your Frame has a target for the double-click that is needed to
start this method. We will see how this plays out when defining
Transitions in the next section and demonstrating this task in the
next Chapter.
4.3.10.2.3 Drag to Highlight the Incorrect Name, Type the Correct
Name.
Finally, a user might drag over the entire name highlight it, then
type "Harry Q. Bovik". To set up the Frame so this method can be
prototyped, there needs to be a target Widget to press the
mouse-button down on (starting the drag) and a target Widget to
release the mouse-button on (ending the drag). If the user were to
drag from right to left, the mouse would have to be pressed in the
text box to the right of the name and released anywhere to the left of
the name.

-   Create a Text Widget the size of that portion of the text box to the
    right of the name that is blank. Draw it outside the Text Box Widget
    and give it a meaningful name (e.g., "Right\_of\_Name").

-   Move it to lie in the blank area in the Text Box Widget. This
    creates a target for starting the drag.

![](/assets/user-guide/media/image132.jpg)


-   Create a Text Widget the height of the Text Box Widget and the width
    of the area that it would legal to release the mouse button in you
    interface (usually outside of the text box). Give this a meaningful
    name (e.g., "Left\_Of\_Name") and position in the correct place.

![](/assets/user-guide/media/image133.jpg)

Now your Frame has a target for the start of the drag and one for the
end of the drag that will highlight the incorrect name. We will see
how this plays out when defining Transitions in the next section (see
"Dragging Over Text to Highlight it") and demonstrating this task in
the next Chapter (see "Demonstrating the Three Text-Editing Tasks
Designed in Previous Section").
The interplay of Text Box Widgets and Text Widgets is complex only
when you need to prototype editable text. Fortunately, many systems
can be usefully prototyped without simulating editing text..
![](/assets/user-guide/media/image134.png)
 Text Widgets can be any size, and their
display labels can be any number of characters, but CogTool will only
show one line of
text. If your interface requires multiple lines of text, use multiple
Text Widgets to simulate multiple lines of text.

### 4.4 Transitions

#### 4.4.1 What is a Transition?
A Transition represents the user's action that causes the system to
move from one Frame to the next. Frames only depict the static
pictures of how the system presents itself to the user; Transitions
are necessary to represent the interactivity of the system.
When a user takes action on a Widget using a mouse or touchscreen,
e.g., click, doubleclick, etc., the Transition is drawn from the
Widget, indicating that the action actually happens at that Widget.
When a user types, the Transition is drawn from the keyboard (in rare
cases, described below, a typing Transition can be drawn from a Widget
while still representing a user typing on the keyboard). When the user
speaks to a system with a microphone, the Transition is drawn from the
microphone.
Transitions are created in the Design window and are represented by
black arrows between a Widget or input Device (keyboard or microphone)
and a Frame. A Widget or Device can have as many Transitions as you
need to represent your Design, but each transition from a Widget must
be unique (e.g., a left-click on a Button Widget cannot transition to
two different Frames).
The toolbar on the far left of the Design window contains tools for
drawing types of Transitions action types:

+----------------------------------+----------------------------------+
| ![](.//me                        | = default Transition type        |
| dia/image135.jpg) |                                  |
|                  | = mouse action (e.g. clicks and  |
|                                  | hover)                           |
|                                  |                                  |
|                                  | = keyboard                       |
|                                  |                                  |
|                                  | = touchscreen (e.g. taps and     |
|                                  | hover)                           |
|                                  |                                  |
|                                  | = Graffiti®                      |
|                                  |                                  |
|                                  | = Microphone                     |
+----------------------------------+----------------------------------+

![](/assets/user-guide/media/image59.png)
 Because each Widget type has its own
default set to the most common Transition from that Widget type, and
because Transition types can be changed from the Transition properties
pane, most CogTool users find that the default tool (selected by
default) is the only tool they need.
After describing the operations possible on Transitions, this section
examples of how to mock-up some common user actions, like
drag-and-drop and editing text.

#### 4.4.2 Creating New Transitions

Transitions can emanate from a Widget that is operated on by a mouse
or, when a touchscreen Device is included in the Design, by a stylus
or finger. Transitions can also emanate from the keyboard or
microphone, when these Devices are present in your Design. All
Transitions are drawn in the Design window.
4.4.2.1 Transitions from a Simple Widget.
To create a Transition from a Widget to an existing Frame:

-   Click on the Widget and drag the cursor to an existing Frame that is
    the result of an action on that Widget. Release the mouse button
    when the desired Frame highlights (turns gray). A black arrow will
    connect the Widget to the Frame, the Transition will remain selected
    (indicated by white squares at its ends) and the properties pane
    will contain the properties of the Transition.

For example, the picture below shows a transition drawn from a small
Button Widget at the top of the "Start" Frame (the button is obscured
by the Transition's end) to the next Frame ("Map1").
![](/assets/user-guide/media/image136.jpg)


-   Examine the Transition Properties pane to make sure it is the
    Transition you intended. Here, we are prototyping a Palm Tungsten-5,
    with a touchscreen, so the Type Touch is appropriate for a Button
    Widget. The Action is Tap (it could be double-tap, triple-tap,
    etc.). Other types of Transitions, e.g., using a mouse, have other
    options in their properties pane.

Transitions can also be drawn to a nonexistent Frame by dragging to an
area of the
Design canvas that is not occupied by a Frame, as shown below from a
different Button Widget in the Start Frame. Doing so causes a new
Frame to be created, which can then be populated with images and
Widgets.
![](/assets/user-guide/media/image137.jpg)

![](/assets/user-guide/media/image138.jpg)

Transitions can also be drawn to the same Frame by dragging to an area
of the same Frame outside the Widget that is the source of the
Transition. The Frame will highlight and the Transition will snap to
the nearest edge of the Frame when released. This is called a
"self-Transition".
Self-Transitions are used when you want to minimize the number of
Frames you have to draw in a Design and the action represented by the
Transition does not change the look of the system very much, or you
don't want to draw intermediate Frames. For example, if a user had to
tap the area on the map in Frame Map1four times before the interface
showed enough detail to continue the task, you could prototype this
with four Frames each showing a more zoomed-in map with single-tap
transitions between them or you could reduce the number of Frames and
use a triple-tap self-transition and then a single-tap regular
transition to the next Frame (shown below).
![](/assets/user-guide/media/image139.jpg)

![](/assets/user-guide/media/image140.jpg)

![](/assets/user-guide/media/image141.jpg)

4.4.2.2 Transitions from an Interactive Widget: Standard Menus,
Context Menus, and Pull-Down Lists
Transitions can be drawn from interactive widgets that change their
appearance as you click on them in a Frame. Standard Menu Widgets,
Context Menu Widgets and PullDown List Widgets open up when you click
on them and the transitions are from the revealed items, not those
that are visible without interaction.
To create a Transition from a complex Widget:

-   Click on the interactive widget until the item you want to
    transition from is revealed.

-   Drag from that item to a different exiting Frame, to an empty
    portion of the Design canvas to create a new Frame, or within the
    same Frame to create a self-Transition. The picture below shows an
    interactive menu opened to reveal a submenu and a Transition is
    drawn from the second item of that menu to an empty part of the
    Design canvas.

![](/assets/user-guide/media/image142.jpg)


-   When you release the mouse button on the destination Frame, the
    interactive Widget closes. There can be many Transitions from the
    component parts of an interactive Widget and they will all appear to
    emanate from the closed Widget.

Click on the Widget to see the individual Transitions again.
![](/assets/user-guide/media/image143.jpg)


-   As the above picture shows, mouse Transitions have additional
    options in the Transitions Properties pane. You can set which mouse
    button to use (left, middle or right), which action to perform
    (click, double-click, press, release, etc.) and which keys must be
    held down while performing the mouse action.

4.4.2.3 Transitions from the Keyboard or Microphone
When users type, they are performing actions on the keyboard, and
thus, those actions are represented with Transitions from the
keyboard. Likewise, when users speak to a system through a microphone,
those actions are represented with Transitions from the microphone.
The section "Working with Sound" details how to work with both the
microphone and speaker, so examples here will be from the keyboard.
To create a Transition from the keyboard

-   As with any Transition, click on the source of the user action, in
    this case, the keyboard Device at the bottom of the Frame, and drag
    the cursor to an existing Frame that is the result of typing on the
    keyboard. Release the mouse button when the desired Frame
    highlights. Self-Transitions and Transitions to a nonexistent new
    Frame are also allowed as keyboard Transitions.

-   With a keyboard Transition, a dialog box appears for you to type in
    the characters the user will type to cause the system to change from
    one Frame to the next. Type the characters the user will type at
    this point in the prototype. Modifier or special characters are
    added by clicking their buttons. If you type upper-case letters, a
    shift is assumed, so clicking the Shift button followed by a "c" is
    the same as typing "C" into the Text field.

![](/assets/user-guide/media/image144.jpg)


-   *If the text the user types is not a command to the system*, that
    is, you are simply typing in text, like a name into a Name field, or
    an address into an Address field, then leave the Is Command checkbox
    in its default unchecked state.

-   *If the text the user types contains special characters or
    modifiers*, use the buttons below the text field to enter the
    characters. CogTool will automatically treat these as commands when
    it creates its cognitive model and you can leave the Is Command
    checkbox in its default unchecked state. (Shift is available in the
    Modifier list for when it is needed in a command-key pattern, like
    Cmd-Shift-n to make a new folder in the MacOS. If you want a capital
    letter or symbol above the numbers on the keyboard, simply that
    character into the text field.)

-   *If the text the user types is a command to the system but does not
    contain the special characters* (e.g., very old line editors like
    "ed" used regular characters as commands. For example, "\$p" was a
    command to print the last line of the file), CogTool has no way of
    knowing this is a command. Therefore, such an "unknowable command"
    must appear on a transition by itself and you must explicitly
    indicate its status by checking the Is Command checkbox.

-   As long as there are no "unknowable commands" as described
    immediately above, feel free to put an entire string of text,
    regular characters, modifiers and specials into the text field.
    CogTool will parse them correctly and create a plausible cognitive
    model automatically.

![](/assets/user-guide/media/image38.jpg)
Although it looks like you can change a keyboard
Transition to a mouse Transition at the top of this dialog box, that
is not the case. You cannot have a mouse Transition from the keyboard
and the dialog box will gray out if you select the mouse radio button.
(The CogTool team will fix this UI to make more sense soon.)

-   After clicking OK, a black arrow will connect the Widget to the
    Frame, the Transition will remain selected (indicated by white
    squares at its ends) and the properties pane will contain the
    properties of the Transition.

![](/assets/user-guide/media/image145.jpg)

![](/assets/user-guide/media/image38.jpg)
Keyboard transitions that involve many special
characters in a row result in predictions of human performance that
are slower than how skilled computer users actually perform. This is
because (1) KLM assumes all keystrokes are done in sequence even for
keys held down together and (2) ACT-R (the cognitive architecture
making the predictions "under the hood") provides a model of typing
that is too simple, assuming each finger has to move back to the
home-row before typing the next key. For most comparisons between
interfaces, these assumptions are reasonable approximations to user
behavior. However, for extremely skilled users of multiple-key
keyboard shortcuts and navigation keys, or for tasks that are
extremely short (e.g., "Save the file" is accomplished with a single
keyboard shortcut command), the predictions will be too slow.
![](/assets/user-guide/media/image134.png)
 It is possible to create typing and
voice transitions from a Widget instead of from the Keyboard or
Microphone Devices. This is is not recommended (because the user is
not actually typing on the button on the screen or speaking into the
text box) and can be avoided in all but the most unusual cases. Under
rare circumstances, you might need to express two typing (or voice)
transitions from the same Frame that have the same content but go to
different destination Frames. CogTool does not allow such an ambiguous
representation, but you can work-around this restriction by putting
one of the transitions on the keyboard (or microphone) and one on a
Widget in the Frame.
4.4.2.4 Transitions from a Graffiti® Widget
Transitions from a Graffiti® Widget are similar to those from the
keyboard in that a dialog box appears that allows you to type in the
Graffiti® gestures the user will input and specify whether those
gestures are a command to the system, or data being entered into a
field. In this case, CogTool does not recognize special characters, so
all commands must be on separate transitions and explicitly indicated
with the Is Command checkbox.
![](/assets/user-guide/media/image38.jpg)
The only characters CogTool will accept for Graffiti®
gestures are letters, digits, comma, period, semi-colon, single-quote,
dash, forward slash, back-slash, equal sign, back-quote and left and
right square brackets.

#### 4.4.3 Prototyping a System Delay

Just as each user action can cause a system delay, each Transition
includes a place to specify how long a delay to insert. At the bottom
of each Transition properties pane, is a text box labeled "Wait for
system response" and is measured in seconds (sec). The system will
wait for that number of second after completing the user action and
before presenting the next Frame.
![](/assets/user-guide/media/image38.jpg)
 using digits and a "." to represent the
decimal point. Numbers can only be entered into CogTool is US format,
i.e.,
If you enter a number into this text box, you may then label the
system delay if desired. For example, you may want to label a delay
"Network lag", "Searching", or "Speech recognition", to help you
remember what the system is doing during significant delays.
If you are using CogTool to benchmark performance against an existing
system, you are likely to use system delays so that the time for the
existing system is accurately recorded. If you are comparing design
ideas for a new system, you may not want to include system delays, but
compare those ideas under the best possible conditions (i.e., no
perceptible delay).

#### 4.4.4 Modifying a Transition

##### 4.4.4.1 Changing the Properties of a Transition
Transitions have properties that are initially set when the Transition
is created and are specific to each type of Transition.
These properties can be viewed and changed at any time in the panel to
the right of the Design canvas.

+-----------------+---------------------------------------------------+
| **Mac:** E      | You can also edit a Transition by selecting it,   |
|                 | then, from the **Edit** menu, choose **Edit       |
| **Win:** CTRL+E | Transition**. A dialog box appears with the same  |
|                 | options for editing the Transition as are present |
|                 | in the properties pane.                           |
+-----------------+---------------------------------------------------+

##### 4.4.4.2 Changing the Source and Destination of a Transition
You can change the source of a Transition to any other source on that
or any other Frame that supports the action type of the Transition.
Likewise, you can change the destination of a Transition to any Frame.
To change the source of a Transition:

-   Select the Transition.

-   Drag the white square located at the current source to the new
    source.

a Widget that can accept the Transition.
![](/assets/user-guide/media/image17.jpg)
 The mouse cursor will change to a
crosshair when it is pointing at
To change the destination of a Transition:

-   Select the Transition.

-   Drag the white square located at the current destination Frame to
    the new destination Frame.

#### 4.4.5 Deleting a Transition

To delete a Transition:

-   Select the Transition.

endpoints of the Transition arrow.
![](/assets/user-guide/media/image17.jpg)
 The Transition is selected when a white
square appears at the
Then do one of the following:

-   Press the keyboard Delete key.

OR

-   From the **Edit** menu, choose **Delete**.

-   In either case, a dialog box will ask you to confirm the deletion.

#### 4.4.6 Prototyping Some Common User Actions

Some user actions require more than selecting the correct action type
from the Transition property pane. Several common instances are
presented below.
4.4.6.1 A Series of Clicks/Taps on the Same Button (e.g., Buttons that
Navigate or Scroll)
Sometimes a user will need to click multiple times on the same button,
most commonly when they are scrolling or navigating with arrow buttons
(e.g., changing the month in a date-picker). In this case, the same
type of user action on the same button does different things, i.e.,
the first few clicks make progress but the last click attains the
desired state.
You could choose to make the result of each click a separate Frame
with the progress depicted and then each Frame has its own button with
one click to take it to the next Frame. However, this does not convey
any additional information about how the interface works, e.g.,
everyone knows that each click on thee Next-Month arrow of a
date-picker will advance the calendar one month, and it does take time
to create these Frames and increases the size of the CogTool file. So
you may decide to use self-Transitions to represent the first few
clicks with only the last click Transition going to the Frame with the
desired result. However, each Widget in a Frame can only have unique
Transitions emanating from it, so each button Widget can only have 1
single-click, 1 double-click and 1 triple-click Transition. Use a
combination of these Transitions to simulate everything from one to
six clicks on the same button before transitioning to a new Frame. For
example, a self-Transition triple-click plus a regular Transition
singleclick represents four clicks on the same button. If your design
requires more than six clicks on the same button, you will need to put
in one or more intermediate Frames to prototype the interaction.
4.4.6.2 Drag-and-drop
Drag-and-drop is represented in CogTool as a "press" on the mouse
button at the start of the drag and a "release" of the mouse button at
the end of the drag. Thus, you must have a Widget at the start with a
press Transition and a Widget at the end with a release Transition.
The following pictures show the representation of dragging a file to
the trash and dragging the elevator in a scroll bar half-way down the
bar.
To simulate drag-and-drop a file to the trash, put two button Widgets
in a Frame, one for the file and one for the trash. Make a second
Frame with just the trash Widget. Draw a self-Transition from the file
Widget with action type "press" This represents a user pressing the
mouse button down on the file icon (top picture). Draw a Transition
from the trash Widget with action type "release" to the second Frame.
This represent that when the user releases the mouse button on the
trash icon, the file is now in the trash and it is no longer visible
on the screen (bottom picture).
![](/assets/user-guide/media/image146.jpg)

![](/assets/user-guide/media/image147.jpg)

![](/assets/user-guide/media/image38.jpg)
CogTool does not enforce that "press" and "release"
come in pairs. When demonstrating a task using drag-and-drop, you must
be careful to demonstrate first the "press" action and then the
"release" action without any other mouse actions in between.
To simulate moving the scroll elevator from the top to the bottom of
the file, have two Frames, one with the contents of the window as it
would appear before the scroll and the other as it would appear after
the scroll. Put two button Widgets in first Frame; one on the elevator
shown at the top of the window and one where the elevator will end up
at the bottom of the window. Draw a self-Transition from the top
Widget with action type "press". This represents a user pressing the
mouse button down on the scrollbar elevator (top picture). Draw a
Transition from the Widget at the bottom of the window with action
type "release" to the second Frame. This represent that when the user
releases the mouse button at the bottom of the scrollbar, the window
has scrolled and the bottom of the file is now visible (bottom
picture).
![](/assets/user-guide/media/image148.jpg)

![](/assets/user-guide/media/image149.jpg)

![](/assets/user-guide/media/image38.jpg)
CogTool does not enforce that "press" and "release"
come in pairs. When demonstrating scrolling in a wndow, you must be
careful to demonstrate first the "press" action and then the "release"
action without any other mouse actions in between.
4.4.6.3 Dragging Over Text to Highlight it
In the section on Working with Text Boxes and Text, we showed how to
place text Widgets in preparation for demonstrating how to simulate
editing text. Here we show how to draw Transitions in the example that
drags over the incorrect text in order to highlight it.
The Frame that contains the incorrect text has two text Widgets, one
to the right of the incorrect name and one to the left of the
incorrect name. To simulate dragging across the text from right to
left, draw a self-Transition from the Widget to the right of the
incorrect name with the "press" action. Draw another self-Transition
from the Widget to the left of the incorrect name with the "release"
action. One additional Transition is needed to complete this Design: a
keyboard Transition that contains the letters of the correct name
(Harry Q. Bovik) to a new Frame representing the corrected text.
The figure below shows the prototype of this interaction, two Frames
in the Design Window and the properties of the first Frame
("1WrongName"). This Frame contains five Widgets (TitleOfField whose
display label is "Name:", TextBox whose display label is "Harvey Q.
Bovik", RightOfName with no display label, LeftOfName with no display
label, and Keyboard.). There are three transitions (self-transition
"press" on RightOfName, self-transition "release" in LeftOfName, and a
typing transition to the other Frame "2CorrectName" with letters
"Harry Q. Bovik")
![](/assets/user-guide/media/image150.png)

![](/assets/user-guide/media/image38.jpg)
CogTool does not enforce that "press" and "release"
come in pairs. When you are simulating a drag user action, you must be
careful to demonstrate first the "press" action and then the "release"
action without any other mouse actions in between.

### 4.5 Working with Sound

There will be times when you will want to have sound capabilities with
your prototype. You will either want to have the user issue voice
commands or talk to another person or have the system generate
informational or alert sounds or have other people talk to the user
(e.g. the Air Traffic Controller giving instructions to a pilot).
CogTool has devices for both microphone and speaker.
ing sound in a interface using text.
![](/assets/user-guide/media/image17.jpg)
 CogTool does NOT actually play or
record sound. It represents us-

#### 4.5.1 Microphone

The microphone represents voice input from a user. You must have a
microphone Device included in your Design. When you draw a Transition
from the microphone box at the bottom of the Frame, a dialog box
appears and asks for the words the user will speak. You can also enter
these words by selecting the Transition and entering them in to the
Transitions Properties pane (see Figure 4-30).
![](/assets/user-guide/media/image38.jpg)
If you want valid quantitative predictions of task
execution time, you must write out the words people have to say. For
example, enter "one two three" instead of "1 2 3."
The "Is Command" property functions the same way for microphone
Transitions as it does for keyboard Transitions; it distinguishes
whether spoken words should be recognized as a command, (e.g. when you
tell your cell phone to "Call Mom") which triggers an active behavior
in the modeled system, or as simple voice input (e.g. when the pilot
acknowledges the Air Traffic controller's instructions.)
![](/assets/user-guide/media/image151.png)

Figure 4-30: Microphone Transitions are used to enter spoken words.
![](/assets/user-guide/media/image152.png)
CogTool does not actually "hear" the words said into
the micro phone. It represents a user speaking into a microphone with
the
contents of the Spoken Input text box on the Transition.

#### 4.5.2 Speaker
Just as the microphone represents voice spoken by a user, the speaker
represents voice or alerts uttered by the system. A speaker is an
output device.
![](/assets/user-guide/media/image152.png)
Microphone is input from the user. Speaker is output
from the system.
When a speaker Device is included in a Design, every Frame has a text
box at the top that labeled with a Speaker icon. Type the text you
want the speaker to output when this Frame is entered. i.e., when a
Transition is followed to this Frame, in this box. As an example, when
a user performs an action on the keyboard that transitions to a Frame
with Speaker content, the Speaker content will be audible as soon as
the transition to the Frame is made.
![](/assets/user-guide/media/image39.png)
CogTool does not actually "speak" the
words output by the speak er. It represents sounds presented to the
user with the contents of
the speaker text box at the top of the Frame.
The text box on the far right of the Frame is the duration of this
sound. Normally, you will leave this box blank and let CogTool
calculate the duration (approximately 50 ms per character). You can
override this default calculation by typing a duration (in seconds)
into the text box on the right of the Frame. For example, you might
specify that the speaker emits "beep" (which would be estimated to be
200 ms) but you know that the beep in your system is 1 second long.
You could either enter "beeeeeeeeeeeeeeeeeep" or enter "beep" and put
1 in the duration text box, as shown below.
![](/assets/user-guide/media/image153.jpg)

Figure 4-31: Text typed in the speaker text box is "audible" after a
Transition to this Frame.

### 4.6 Working with HTML

#### 4.6.1 Import a Design from HTML

If your design already exists as HTML files, either on the web or
locally on your computer, you can import those files making them into
CogTool Frames, Widgets and Transitions. The import function is
limited, but it can be a good beginning that save a lot of effort.
You might want to do this if

-   Other designers in your organization use HTML for mocking up design
    ideas and you want to make predictions of skilled performance time
    on these ideas.

-   You want to compare your design to a competitors design that exists
    as a website.

To import a Design from HTML

-   In the Project window, from the File menu, choose Import Design from
    HTML\...

-   Use the pull-down list to select a Design into which to import the
    pages, or create a new Design (default).

-   Enter a URL to crawl, either on the web (starting with the default
    http://) or from your machine (replace the http:// with the path to
    the starting file on your machine). If you want more than one
    starting URL, you can add them by clicking the "+" button at the
    right of the field.

-   Limit the import by setting the Maximum Depth to Crawl or
    restricting the domain, under the URL field. The small "?" buttons
    bring up detailed information about how to use these restriction
    mechanisms.

fields in the dialog box to get the restriction paths to show their
![](/assets/user-guide/media/image154.png)
After entering the URL, you have to
click on the one of the other options.

-   Uncheck the Capture an image for each page checkbox, if you want to
    decrease the size of the resulting CogTool file or speed up the
    import. It is checked by default because the images give you a
    better idea of what has and what has not been imported (and you can
    always remove the background images later if you need to have a
    smaller file).

-   If desired, set the maximum number of pages to import lower than the
    default 500. This may be important if you have not restricted the
    import in any other way (i.e., by maximum depth to crawl or domain).

-   If desired, set the width and height of the browser window you
    expect your users to see (e.g., if you are prototyping a system that
    would be viewed on a cellphone browser, it would be much smaller
    than CogTool's default size).

-   Hit OK.

If you chose to create a new Design, the standard New Design dialog
box will appear asking which Devices the New Design should include
before beginning the import. If you chose to import into an existing
Design, the import begins immediately and shows you a progress bar
listing which page it is working on.
![](/assets/user-guide/media/image55.jpg)
The number of Frames in each row of the
Design window created by importing can be set in the Preferences
dialog box (under the CogTool menu on a Mac; under File in Windows).
![](/assets/user-guide/media/image155.png)

Figure 4-32: Dialog box for importing a Design from HTML. The small
"?" buttons provide more detailed information about the options this
dialog box provides.
![](/assets/user-guide/media/image38.jpg)
The resulting Design will include the
Frames and Transitions representing the pages and links in the URL(s)
you imported. For example, the figure below shows the result of
importing from the CogTool web site, with a Maximum depth of 1,
restricted to the cogtool host. example, the CogTool URL can be
expressed as "cogtool.org" but Be careful to use the actual URL when
restricting the domain. For
that redirects to "http://cogtool.hcii.cs.cmu.edu/". If you use
"cogtool.org" and restrict the domain, you will only get one page
because none of the linked pages are actually on that host.
![](/assets/user-guide/media/image156.png)

Figure 4-33: Result of importing the CogTool web site (maximum
depth=1; domain restricted to http://cogtool.hcii.cs.cmu.edu/).
The figure below shows the Frame representing the CogTool homepage.
Notice that it has Widgets (in green) on top of all the links, with
the link text as the Widgets' display labels. The captured background
image does not fill the Frame because the page was bigger than the
browser window size (in this case, the default setting). Notice also
that Widgets other than links are not represented through the import
process. I would have to place Textbox Widgets over the login and
search textboxes (upper right of the page) by hand to complete this
Frame.
![](/assets/user-guide/media/image157.png)

Figure 4-34: Frame representing the CogTool home page, resulting from
importing the CogTool web site. Notice that (1) only link Widgets and
their Transitions are imported and (2) Widgets appear in places beyond
the background image, which means the user would have to scroll to see
those widgets if their browser were the same size as was set in the
import dialog box (in this case, the default setting).
4.6.1.1 Known problems when importing from HTML
![](/assets/user-guide/media/image77.jpg)
The ability to import from HTML is
useful as a start, but far from perfect. It has the following known
problems. non-HTML features, it may stop and wait for you to answer a
If the importing process encounters any files to download or other
![](/assets/user-guide/media/image77.jpg)
question in a dialog box (e.g., Do you
want to save or open this file?). Dismiss the dialog box by clicking
whichever button tells it to ignore the question. CogTool will
continue importing. because one link goes directly there and one link
was redirected Sometimes importing creates duplicate Frames of a given
URL
![](/assets/user-guide/media/image77.jpg)
![](/assets/user-guide/media/image77.jpg)
from somewhere else. For example,
http://www.alumni.cmu.edu, http://www.cmu.edu/alumni, and
www.cmu.edu/alumni/index. html redirect to http://www.cmu.edu/alumni/
and they all make new Frames. Just delete the duplicates in the
resulting Design. you have already logged in. CogTool cannot import
from websites that require a login, even if where when imported. You
can fix this by clicking on the name of Drop-down menus on a real
webpage appear as links from no-
the Transition in the Design's property pain, deleting it, and
creating a hierarchical menu Widget on the Frame with the dropdown
menus.
![](/assets/user-guide/media/image158.jpg)

Figure 4-35: One of the problems with importing from HTML; links from
nowhere result when the real web page has drop-down menus. This can be
fixed, but it is one example of the imported Design being a starting
place, not a perfect representation of the web site.

#### 4.6.2 Export a Design to HTML

Export Design to HTML converts your Design into HTML pages, which can
be viewed from any web browser. This allows you to share your Design
with individuals who do not use CogTool or to run simple user tests
where the Tasks from your Design can be explored through think-aloud
usability studies.
To export your Design to HTML:
From the Project window:

-   Select the Design to export.

-   From the **File** menu, choose **Export Design to HTML**.

OR
From the Design window:

-   From the **File** menu, choose **Export**.

-   Choose **Export Design to HTML**.

CogTool saves the exported Design files in a folder of your choosing.
![](/assets/user-guide/media/image32.png)
 It is advisable to be sure the folder
is empty when you export to it, or CogTool's html files will get mixed
up with the files already in the folder. If you use the same folder
for multiple versions of the HTML, CogTool will overwrite files of the
same name add files
with new names. You can end up with several versions of screens
intermingled in the same folder.
These files include HTML pages of name for each of the Frames in your
Design and an index.html page from which you can navigate to these
other pages (see Figure 4-36).
![](/assets/user-guide/media/image159.png)

Figure 4-36: An index page of Frames exported from a Design to HTML
You can view the individual Frames from your Design by clicking the
Frame name on the index page. If your Frames include interactive
Widgets (e.g. drop-down menus, buttons, etc.), you can interact with
the Frames directly from their corresponding HTML pages just as you
would normally. For example, if you view an exported Frame with
drop-down menus, simply click the menus to choose your desired option;
if you view an exported Frame with a form that includes text boxes and
buttons, simply type text in the boxes and click the buttons as you
would normally. (see Figure 4-37).
![](/assets/user-guide/media/image160.png)

Figure 4-37: An exported Frame in HTML with all the Widgets. The
drop-down menu is circled in red.
Exported HTML can be used for usability tests and two special features
make them especially good for this use. First, the mouse cursor does
not change when the user rolls over and active area of the screen. If
it did, then people in your usability tests could use the cursor
change as a clue where to click to accomplish the task, which would
defeat the purpose of early usability tests. Second, if the user click
an area on an HTML page that does not have a Transition defined for
it, a pop-up message tells them that "This action will not help
accomplish your goal". Thus, you, as a designer, do not have to fully
implement your design and the HTML will still allow you to gather
data.
CogTool's automatically-generated HTML will not suit all purposes.
Previous CogTool users have used it as a starting point and edited the
HTML directly to annotate it or make it work as they want it to.
HTML to simulate the use of sound in an interface.
![](/assets/user-guide/media/image17.jpg)
 At the moment, CogTool cannot export
anything sensible in select and copy them, but not change them.
![](/assets/user-guide/media/image154.png)
Non-interactive widgets actually
interact in the HTML. You can the header does not appear at all; only
the list items appear. Thus,
![](/assets/user-guide/media/image154.png)
Standard Pulldown Lists do not export
correctly. In the HTML,
it is as if the first item were initially selected instead of having a
header. help you accomplish your goal" if you click on a menu header
that ![](/assets/user-guide/media/image154.png)
Standard Menu Widgets does not give the
message "this will not has no items defined below it. message "this
will not help you accomplish your goal" if you click
![](/assets/user-guide/media/image154.png)
Standard Radio button and Checkboxe
Widgets do not give the
on one that doesn't have a transition defined from it. The HTML radio
buttons and checkboxes do change state, even if that state is not
necessary to accomplish the task.
