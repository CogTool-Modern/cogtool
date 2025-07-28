---
title: References
date: 2012-05-23T03:04:25+00:00
layout: app_help
---
## References

Anderson, J. R., & Lebiere, C. (1998). *The atomic components of
thought.* Mahwah, NJ: Erlbaum.
Card, S.K., Moran, T.P., and Newell, A. (1980) The Keystroke-Level
Model for User Performance Time with Interactive Systems.
*Communications of the ACM, 23*(7), 1980, 396-410.
Card, S. K., Moran, T.P. and Newell, A. *The Psychology of
Human-Computer Interaction*. Lawrence Erlbaum Associates, Hillsdale,
NJ, USA (1983).
John, B. E., Prevas, K., Salvucci, D. D., Koedinger, K. (2004)
Predictive human performance modeling made easy. *Proceedings of CHI
2004* (Vienna, Austria, April 2004) ACM New York. 455-462.
John, B. E. & Salvucci, D. D. (2005) Multi-Purpose Prototypes for
Assessing User Interfaces in Pervasive Computing Systems. *IEEE
Pervasive Computing 4*(4), 27-34.
John, B. E., Salvucci, D. D., Centgraf, P., Prevas, K., (2004)
Integrating models and tools in the context of driving and in-vehicle
devices. *Proceedings of International Conference on Cognitive
Modeling* (Pittsburgh. PA, July 30 -- August 1, 2004).
Landay, J. A., & Meyers, B. A. (1995). Interactive Sketching for the
Early Stages of User Interface Design. *Proceedings of CHI 1995*,
(Denver, Colorado, May 7-11 1995) ACM, New York.
Lane, D. M., Napier, H. A., Batsell, R. R. & Naman, J. (1993)
Predicting the skilled use of hierarchical menus with the
keystroke-level model. *Human-Computer Interaction*., 8, 185-192
Lin, J., Newman, M. W., Hong, J. I., and Landay, J. A. DENIM: Finding
a tighter fit between tools and practice for web site design. CHI
2000, ACM Conference on Human Factors in Computing Systems, *CHI
Letters*, 2(1), pp. 510-517.
Luo, L. & John, B. E. (2005) Predicting task execution time on
handheld devices using the Keystroke-Level Model. *Extended Abstracts
of CHI 2005* (Portland, Oregon, April 2-7, 2005) ACM, New York.
Luo, L. & Siewiorek, D. P. (2007) KLEM: A Method for Predicting User
Interaction Time and System Energy Consumption during Application
Design. *Proceedings of the 11th Annual IEEE International Symposium
on Wearable Computers.* (Boston, MA, October 11-13, 2007) IEEE., Los
Alamitos, CA
Nielsen, J., and Phillips, V. A. (1993) Estimating the relative
usability of two interfaces: heuristic, formal, and empirical methods
compared. *Proceedings of CHI 1993*, ACM New York. 214-221.
Teo, L. & John, B. E. (2008a) CogTool-Explorer: Towards a Tool for
Predicting User Interaction. *Extended Abstracts of CHI 2008*
(Florence, Italy, April 5 -- 10, 2008) ACM, New York.
Teo, L. & John, B. E. (2008b) Towards Predicting User Interaction with
CogTool-Explorer. *Proceedings of the Human Factors and Ergonomics
Society 52nd Annual Meeting* (New York City, New York, Sept 22-26,
2008).
Teo, L., John, B. E., & Pirolli, P. (2007) Towards a tool for
predicting user exploration. *Extended Abstracts of CHI 2007* (San
Jose, USA, April 28 -- May 3, 2007) ACM, New York.

## Appendix A: devices

You must choose at least one input and one output device for your
Design.

### Input Devices

#### Keyboard
A keyboard is a regular QWERTY keyboard that sits on a desk or lap, on
which a person types with two hands. Use the keyboard device as an
approximation to any QWERTY keyboard, e.g., full-sized hard-wired or
wireless, laptop, external keyboard for a hand-held device, etc.
On screen keyboards, such as those that display on a PDA are not
keyboard devices but touchscreen devices.
CogTool's predictions of human performance assume an average typing
speed of 41 word per minute for this device.
When a keyboard is include as an input Device, an area labeled
"Keyboard" appears on the bottom of each Frame so you can define
Transitions from the keyboard.

![](/assets/user-guide/media/image312.jpg)


Figure A-1: Example of a Frame shown in its Design widow that has only a
keyboard Device.

#### Mouse

A mouse is a regular computer mouse. That is, a pointing device that
fits in the hand and is moved on a flat surface to position a cursor
on the display.
CogTool's predictions of human performance use Fitts's Law to estimate
mouse movement time and add additional time for the click when the
mouse reaches its destination. CogTool's mouse has three buttons
(left, middle, right).
When the mouse is included as an input Device, the Design can include
widgets that require a pointing device, e.g., buttons, menus, check
boxes, etc. The Transitions can include mouse transitions, e.g.,
click, double-click, shift-click, etc.

![](/assets/user-guide/media/image17.jpg)
 There is currently no way to represent
the IBM TrackPoint, a track ball, or a track pad in

CogTool.

#### Touchscreen

A touchscreen is a display that reacts to touch. The touch can be with
a finger or a stylus, but it doesn't require a click as a mouse does.
Use the touchscreen Device to approximate any device that uses the
finger to operate, even if it has hardware buttons instead of a touch
screen. Thus, touchscreen is the device to select for prototyping PDA,
cell phone, in-vehicle devices like GPS systems, etc.
CogTool's predictions of human performance use Fitts's Law to estimate
movement time but since Fits's Law was originally determined using
tapping with a stylus, there is no additional time added for the tap.
When the touchscreen is included as an input Device, the Design can
include widgets that require a pointing device, e.g., buttons, menus,
check boxes, etc. In addition, a Graffiti Widget becomes available.
The Transitions can include touchscreen transitions, e.g., tap,
double-tap, Graffiti strokes, etc.

#### Microphone

A microphone inputs sound into the system so it can react to that
sound. Use a microphone for any system with speech input or any
environment where you want to simulate users speaking to each other.
For example, include a microphone if you are prototyping systems in an
airplane cockpit because the pilot often talks with the Air Traffic
Controller.
CogTool's predictions of human performance use ACT-R's speaking model.
That model uses 50 ms per character as an estimate for how long it
takes the user to say words into the microphone.
When a microphone is included, an area labeled "Microphone" appears on
the bottom of each Frame so you can define Transitions from the
microphone.

![](/assets/user-guide/media/image313.png)


Figure A-2: Example of a Frame shown in its Design widow that has a
keyboard, a mouse and a microphone.

### Output Devices

#### Display
A display is any device that presents information visually to the
user. CogTool assumes that every Design has a display Device, thus,
the display device is selected by default and cannot be deselected.
The display contains all the widgets you put in the Frames.

#### Speaker
A speaker presents auditory sounds or words to the user. Use a speaker
whenever the user gets information from the Design through sound, or
any environment where you want to simulate users speaking to each
other. For example, include a speaker if you are prototyping systems
in an airplane cockpit because the pilot will receive both verbal
communications from Air Traffic Control and auditory signals from the
cockpit systems (e.g., alarms and alerts) while flying.
CogTool's predictions of human performance use ACT-R's hearing model.
That model uses 50 ms per character as an estimate for how long it
takes the user to hear and comprehend words emitted by the speaker.
When a speaker is included as an output Device, a text field appears
at the top of each Frame in the Design where you can type in the
sounds or words the speaker will emit when this Frame is entered.

![](/assets/user-guide/media/image314.png)


Figure A-3: Example of a Frame shown in its Design widow that has a
speaker, as well as the keyboard, mouse and microphone. The speaker
will emit the word "Hello" on entering this Frame..

## Appendix B: types of widgets And when to Use them 

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Button**           | ![                   | \...anytime a Widget |
|                      | ](/assets/user-guide/media/image323. | looks like a button  |
| !                  | jpg) | as defined by        |
| [](/assets/user-guide/media/image315 | height="0.           | current conventions. |
| .jpg) | The button can be a  |
|    |                      | hardware button      |
|                      | ![](/assets/user-guide/media/im      | (like the Palm®      |
|                      | age325.jpg){width="1 | Datebook button to   |
|                      | .6233333333333333in" | the left), a static  |
|                      | height="0.           | silk-screened button |
|                      | 4338626421697288in"} | (like the Palm®      |
|                      |                      | calculator button),  |
|                      | !                    | or a button that     |
|                      | [](/assets/user-guide/media/image327 | appears dynamically  |
|                      | .png) | on a screen (like    |
|                      | height="0.           | the New and Sign In  |
|                      | 5766666666666667in"} | buttons). A button   |
|                      |                      | Widget is also used  |
|                      |                      | for things like the  |
|                      |                      | Close, Hide, and     |
|                      |                      | Full Size buttons    |
|                      |                      | that control Mac     |
|                      |                      | windows; the back,   |
|                      |                      | forward, reload,     |
|                      |                      | stop, and home       |
|                      |                      | buttons on the       |
|                      |                      | Firefox toolbar; and |
|                      |                      | tabs in Firefox (two |
|                      |                      | of which are shown). |
|                      |                      | The Close button     |
|                      |                      | within each Firefox  |
|                      |                      | tab would also be    |
|                      |                      | represented by a     |
|                      |                      | button Widget.       |
|                      |                      |                      |
|                      |                      | **Standard button    |
|                      |                      | widgets** can be     |
|                      |                      | configured to appear |
|                      |                      | to toggle from       |
|                      |                      | unpressed to pressed |
|                      |                      | when you demonstrate |
|                      |                      | tasks on them. If    |
|                      |                      | you want that        |
|                      |                      | behavior with Custom |
|                      |                      | button widgets, you  |
|                      |                      | have to use two      |
|                      |                      | Frames with two      |
|                      |                      | images for the       |
|                      |                      | buttons, with        |
|                      |                      | transitions between  |
|                      |                      | them. Using Standard |
|                      |                      | button widgets saves |
|                      |                      | a lot of work.       |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Link**             | ![](/assets/user-guide/media/im      | \...anytime a Widget |
|                      | age329.png){width="2 | represents a link on |
| ![](/assets/user-guide/media/im      | .1649660979877514in" | a web page. This can |
| age328.jpg){width="0 | height="2            | be a URL, a text     |
| .3888888888888889in" | .967505468066492in"} | link, or anything    |
| height="0.           |                      | else that acts as a  |
| 3333333333333333in"} |                      | link in a web page   |
|                      |                      | or document (top     |
|                      |                      | three pictures). For |
|                      |                      | example, in the      |
|                      |                      | bottom picture, both |
|                      |                      | the blue words and   |
|                      |                      | the picture of the   |
|                      |                      | book on the "What's  |
|                      |                      | New" section of      |
|                      |                      | Usability.gov are    |
|                      |                      | links.               |
|                      |                      |                      |
|                      |                      | **Standard link      |
|                      |                      | widgets** and Custom |
|                      |                      | link widgets are the |
|                      |                      | same.                |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Checkbox**         | !                    | \...anytime there is |
|                      | [](/assets/user-guide/media/image343 | an interactive box   |
| ![](/assets/user-guide/media/ima   | .jpg) | that can be toggled  |
| ge333.jpg){width="0. | height="0.2          | on or off (checked   |
| 24333333333333335in" | 9333333333333333in"} | or not checked)      |
|    |                      | independently of any |
|                      | ![](/assets/user-guide/media/im      | other checkboxes.    |
|                      | age344.jpg){width="2 | The top example is a |
|                      | .3320800524934384in" | single checkbox from |
|                      | height="0            | a Palm® calendar     |
|                      | .825077646544182in"} | entry setting. The   |
|                      |                      | bottom example is a  |
|                      |                      | set of related       |
|                      |                      | checkboxes           |
|                      |                      | encountered when     |
|                      |                      | setting up a         |
|                      |                      | discussion forum on  |
|                      |                      | Blackboard®.         |
|                      |                      |                      |
|                      |                      | **Standard checkbox  |
|                      |                      | widgets** appear to  |
|                      |                      | toggle from          |
|                      |                      | unchecked to checked |
|                      |                      | when you demonstrate |
|                      |                      | tasks on them. If    |
|                      |                      | you want that        |
|                      |                      | behavior with Custom |
|                      |                      | checkbox widgets,    |
|                      |                      | you have to use two  |
|                      |                      | Frames with          |
|                      |                      | different images for |
|                      |                      | the checkboxes in    |
|                      |                      | different states,    |
|                      |                      | with transitions     |
|                      |                      | between them. Using  |
|                      |                      | Standard checkbox    |
|                      |                      | widgets saves a lot  |
|                      |                      | of work.             |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Radio Button**     | ![](/assets/user-guide/media/i       | \...anytime there is |
|                      | mage352.jpg){width=" | a set of visible     |
| !                  | 1.746091426071741in" | options where (1)    |
| [](/assets/user-guide/media/image345 | height="0.3          | the options remain   |
| .jpg) | visible after        |
|    |                      | clicking on one, (2) |
|                      | ![](/assets/user-guide/media/im      | the state of the     |
|                      | age353.png){width="1 | option is visible    |
|                      | .5833333333333333in" | and remains visible, |
|                      | height="0.3          | and (3) only one     |
|                      | 7666666666666665in"} | option can be        |
|                      |                      | selected at a time.  |
|                      |                      | These often have     |
|                      |                      | circles beside them  |
|                      |                      | (like the text style |
|                      |                      | selections to the    |
|                      |                      | left) that show the  |
|                      |                      | state of the         |
|                      |                      | options, but they    |
|                      |                      | may also take other  |
|                      |                      | shapes (like the     |
|                      |                      | days of the week in  |
|                      |                      | the Palm® Date Book, |
|                      |                      | to the left).        |
|                      |                      |                      |
|                      |                      | **Standard radio     |
|                      |                      | button widgets**     |
|                      |                      | appear to toggle     |
|                      |                      | between unselected   |
|                      |                      | and selected when    |
|                      |                      | you demonstrate      |
|                      |                      | tasks on them, and   |
|                      |                      | they automatically   |
|                      |                      | enforce that only    |
|                      |                      | one is selected at a |
|                      |                      | time. If you want    |
|                      |                      | that behavior with   |
|                      |                      | Custom radio button  |
|                      |                      | widgets, you have to |
|                      |                      | use many Frames with |
|                      |                      | many images for the  |
|                      |                      | radio buttons, with  |
|                      |                      | transitions between  |
|                      |                      | them, for each state |
|                      |                      | the set of radio     |
|                      |                      | buttons can be in.   |
|                      |                      | In addition Standard |
|                      |                      | radio button widgets |
|                      |                      | automatically align  |
|                      |                      | as you created them  |
|                      |                      | and can be resized   |
|                      |                      | and realigned as a   |
|                      |                      | group. Using         |
|                      |                      | Standard radio       |
|                      |                      | button widgets saves |
|                      |                      | a lot of work.       |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
|                    | [E                 | [Use this          |
| [Widget] | Wid                |
|                      |                      | get\...] |
+======================+======================+======================+
| **Text Box**       | ![](/assets/user-guide/media/i     | \...anytime there  |
|                    | mage365.jpg){width=" | is a place to      |
| ![](/assets/user-guide/media/ima   | 1.750945975503062in" | enter text         |
| ge354.jpg){width="0. | height="0.         | (letters or        |
| 39666666666666667in" | 5022976815398075in"} | numbers). These    |
| height="0.         |                      | can have different |
| 2966666666666667in"} | ![](/assets/user-guide/media/im      | looks, such as the |
|                      | age366.png){width="1 | Username and       |
|                      | .6533333333333333in" | Password boxes on  |
|                      | height="0.2          | Gmail®, the text   |
|                      | 6666666666666666in"} | area for the       |
|                      |                      | number of days on  |
|                      | ![](/assets/user-guide/media/im      | the Palm®, or even |
|                      | age367.png){width="2 | the entire page    |
|                      | .2066666666666666in" | area in MSword.    |
|                      | height="0.           |                    |
|                      | 7233333333333334in"} | NOTE: A text box   |
|                      |                      | is different from  |
|                      |                      | the text *inside*  |
|                      |                      | the text box. See  |
|                      |                      | the Section        |
|                      |                      | **Working with     |
|                      |                      | Text Boxes and     |
|                      |                      | Text.**            |
+----------------------+----------------------+----------------------+
| **Text**           | !                  | \...for any text   |
|                    | [](/assets/user-guide/media/image377 | that can be        |
| ![](/assets/user-guide/media/ima   | .jpg) | selected and       |
| ge368.jpg){width="0. | height="0          | copied, deleted,   |
| 39666666666666667in" | .643999343832021in"} | pasted over, or    |
| height="0.         |                      | typed over. It can |
| 2966666666666667in"} |                      | be the text in a   |
|                      |                      | text box, the text |
|                      |                      | someone is editing |
|                      |                      | in a word          |
|                      |                      | processor, text on |
|                      |                      | the web you want   |
|                      |                      | to copy, etc.      |
|                      |                      |                    |
|                      |                      | See the Section    |
|                      |                      | **Working with     |
|                      |                      | Text Boxes and     |
|                      |                      | Text.**            |
|                      |                      |                      |
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Menu**             | ![](/assets/user-guide/media/im      | \...for the menu     |
|                      | age390.png){width="1 | headers. In the      |
| ![](/assets/user-guide/media/ima   | .7500076552930883in" | Palm® menu to the    |
| ge378.jpg){width="0. | height="1.           | left, "Record,"      |
| 39666666666666667in" | 1018514873140857in"} | "Edit," and          |
| height="0.3        |                      | "Options" would be   |
| 7666666666666665in"} |                      | menu Widgets. In the |
|                      |                      | Microsoft Word™ menu |
|                      |                      | below in the next    |
|                      |                      | section, "Insert,"   |
|                      |                      | "Format," and all    |
|                      |                      | the words across the |
|                      |                      | top would be menu    |
|                      |                      | Widgets.             |
|                      |                      |                      |
|                      |                      | **Standard menu      |
|                      |                      | widgets** allow you  |
|                      |                      |                      |
|                      |                      | to type in entire    |
|                      |                      | hierarchical menu    |
|                      |                      | systems with menu    |
|                      |                      | headers, items and   |
|                      |                      | as many levels of    |
|                      |                      | submenus as your     |
|                      |                      | prototype needs.     |
|                      |                      | These menus          |
|                      |                      | automatically expand |
|                      |                      | and contract as you  |
|                      |                      | demonstrate tasks on |
|                      |                      | them. If want this   |
|                      |                      | behavior with Custom |
|                      |                      | menus, you would     |
|                      |                      | have to use menu     |
|                      |                      | widgets, submenu     |
|                      |                      | widgets and menu     |
|                      |                      | item widgets         |
|                      |                      | separately. This is  |
|                      |                      | not only much more   |
|                      |                      | effort to construct, |
|                      |                      | with many more       |
|                      |                      | Frames, but it has   |
|                      |                      | proven to be         |
|                      |                      | error-prone. We      |
|                      |                      | **strongly**         |
|                      |                      | **recommend** that   |
|                      |                      | you use Standard     |
|                      |                      | menu widgets unless  |
|                      |                      | your menu system     |
|                      |                      | does not look like a |
|                      |                      | standard             |
|                      |                      | hierarchical menu    |
|                      |                      | system, e.g., you    |
|                      |                      | are using pie menus. |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
|                    | [E                 | [Use this          |
| [Widget] | Wid                |
|                      |                      | get\...] |
+======================+======================+======================+
| **Submenu**        | ![](/assets/user-guide/media/im    | \...for menu items |
|                    | age409.jpg){width="2 | that produce       |
| **(Necessary in**  | .1659984689413823in" | another menu. The  |
|                    | height="0.         | Palm® menu in the  |
| **Custom only)**   | 8435783027121609in"} | previous section   |
|                    |                      | does not have a    |
| ![](/assets/user-guide/media/ima   |                      | submenu Widget.    |
| ge392.jpg){width="0. |                      | The Microsoft      |
| 39666666666666667in" |                      | Word™ menu on the  |
| height="0.3        |                      | left would have    |
| 7666666666666665in"} |                      | two submenu        |
|                      |                      | Widgets, "Break"   |
|                      |                      | and "AutoText."    |
|                      |                      |                    |
|                      |                      | **Standard menu    |
|                      |                      | widgets** remove   |
|                      |                      | the necessity to   |
|                      |                      | use submenu        |
|                      |                      | widgets and menu   |
|                      |                      | item widgets. We   |
|                      |                      | **strongly**       |
|                      |                      | **recommend** that |
|                      |                      | you use Standard   |
|                      |                      | menu widgets.      |
+----------------------+----------------------+----------------------+
| **Menu Item**      | ![](/assets/user-guide/media/im    | \...for items that |
|                    | age437.png){width="1 | can be selected    |
| **(Necessary in**  | .7500076552930883in" | from a menu (and   |
|                    | height="1.         | do not produce     |
| **Custom only)**   | 1018514873140857in"} | other menus). In   |
|                    |                      | the Palm® menu to  |
| ![](/assets/user-guide/media/ima   |                      | the left, "Undo,"  |
| ge392.jpg){width="0. |                      | "Cut," and all the |
| 39666666666666667in" |                      | words below them   |
| height="0.3        |                      | would be menu item |
| 7666666666666665in"} |                      | Widgets. In the    |
|                      |                      | Microsoft Word™    |
|                      |                      | menu in the        |
|                      |                      | previous section,  |
|                      |                      | "Page Break,"      |
|                      |                      | "Column Break,"    |
|                      |                      | and all the words  |
|                      |                      | below them would   |
|                      |                      | be menu items.     |
|                      |                      |                    |
|                      |                      | **Standard menu    |
|                      |                      | widgets** remove   |
|                      |                      | the necessity to   |
|                      |                      | use submenu        |
|                      |                      | widgets and menu   |
|                      |                      | item widgets. We   |
|                      |                      | **strongly**       |
|                      |                      | **recommend** that |
|                      |                      | you use Standard   |
|                      |                      | menu widgets.      |
+----------------------+----------------------+----------------------+
| ![](/assets/user-guide/media/im      | **nu, Submenu, and   | demonstrating a      |
| age38.jpg){width="0. | Menu Item:** When    | Task, you can only   |
| 41761373578302713in" |                      | interact             |
| height="0.4          |                      |                      |
| 1761482939632544in"} |                      |                      |
| **Using CUSTOM Me**  |                      |                      |
+----------------------+----------------------+----------------------+
| with a submenu     | r a menu item Widget | acted with its       |
| item Widget o      | after having inter   | associated menu      |
|                      |                      | Widget. This         |
+----------------------+----------------------+----------------------+
| is true because a  | teract with a        | til they are         |
| user cannot in     | submenu or menu item | visible, and they    |
|                      | un                   | are not visible      |
+----------------------+----------------------+----------------------+
| until the menu is  | If you interact with |                      |
| pulled down.       | a submenu item or a  |                      |
|                      | menu item Widget     |                      |
|                      | without first        |                      |
|                      | interacting          |                      |
+----------------------+----------------------+----------------------+
| with its           | et, CogTool will     |                      |
| associated menu    | give you a warning   |                      |
| Widg               | message.             |                      |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on   |
|                      |                      | next page . . .*   |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Context Menu**     | ![](/assets/user-guide/media/im      | \...for a menu that  |
|                      | age440.jpg){width="1 | is accessible by     |
| ![](/assets/user-guide/media/im      | .3966666666666667in" | rightclick (PC) or   |
| age439.jpg){width="0 | height="1.           | CTRL-click (Mac).    |
| .3815255905511811in" | 3066666666666666in"} |                      |
| height="0.4          |                      | **Standard context   |
| 1621062992125984in"} |                      | menu widgets**       |
|                      |                      |                      |
|                      |                      | allow you to type in |
|                      |                      | entire hierarchical  |
|                      |                      | menu systems with as |
|                      |                      | many levels of       |
|                      |                      | submenus as your     |
|                      |                      | prototype needs.     |
|                      |                      | These menus          |
|                      |                      | automatically expand |
|                      |                      | and contract as you  |
|                      |                      | demonstrate tasks on |
|                      |                      | them. If want this   |
|                      |                      | behavior with Custom |
|                      |                      | context menus, you   |
|                      |                      | would have to use    |
|                      |                      | context menu         |
|                      |                      | widgets, submenu     |
|                      |                      | widgets and menu     |
|                      |                      | item widgets         |
|                      |                      | separately. This is  |
|                      |                      | not only much more   |
|                      |                      | effort to construct, |
|                      |                      | with many more       |
|                      |                      | Frames, but it has   |
|                      |                      | proven to be         |
|                      |                      | error-prone. We      |
|                      |                      | **strongly**         |
|                      |                      | **recommend** that   |
|                      |                      | you use Standard     |
|                      |                      | context menu widgets |
|                      |                      | unless your menu     |
|                      |                      | system does not look |
|                      |                      | like a standard      |
|                      |                      | hierarchical menu    |
|                      |                      | system, e.g., you    |
|                      |                      | are using pie menus. |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Pull-Down List**   | ![](/assets/user-guide/media/im      | \...anytime a list   |
|                      | age457.png){width="1 | drops down in        |
| ![](/assets/user-guide/media/ima   | .1733398950131233in" | response to the      |
| ge441.jpg){width="0. | height="0.           | click (or tap) on    |
| 39666666666666667in" | 9166524496937882in"} | the displayed item,  |
| height="0.3        |                      | only one item on the |
| 7666666666666665in"} | ![](/assets/user-guide/media/i       | list can be          |
|                      | mage458.jpg){width=" | selected, and the    |
|                      | 2.162638888888889in" | selected item        |
|                      | height="1.           | replaces the         |
|                      | 4639938757655293in"} | original displayed   |
|                      |                      | item as the label of |
|                      | ![](/assets/user-guide/media/i     | the list. Use the    |
|                      | mage459.jpg){width=" | pull-down list       |
|                      | 2.166150481189851in" | Widget for the       |
|                      | height="0.         | displayed item       |
|                      | 2913943569553806in"} | (before the list is  |
|                      |                      | pulled down). An     |
|                      |                      | example is the list  |
|                      |                      | of types of "To Do"  |
|                      |                      | items to display on  |
|                      |                      | the Palm®. In the    |
|                      |                      | example to the left, |
|                      |                      | the "All" with the   |
|                      |                      | down arrow indicates |
|                      |                      | a pull-down list; if |
|                      |                      | this were the image  |
|                      |                      | in the Frame, the    |
|                      |                      | arrow+All would be a |
|                      |                      | pull-down list       |
|                      |                      | Widget. In the       |
|                      |                      | example from Apple's |
|                      |                      | Mail, the object     |
|                      |                      | with the             |
|                      |                      | server\_name+arrows  |
|                      |                      | would be a pulldown  |
|                      |                      | list Widget.         |
|                      |                      |                      |
|                      |                      | **Standard pull-down |
|                      |                      | list widgets** allow |
|                      |                      | you to type in all   |
|                      |                      | the items in the     |
|                      |                      | list and identify    |
|                      |                      | which item should be |
|                      |                      | initially selected.  |
|                      |                      | These lists          |
|                      |                      | automatically expand |
|                      |                      | and contract as you  |
|                      |                      | demonstrate tasks on |
|                      |                      | them. If want this   |
|                      |                      | behavior with Custom |
|                      |                      | pull-down lists, you |
|                      |                      | would have to use    |
|                      |                      | pull-down list       |
|                      |                      | widgets and          |
|                      |                      | pull-down list items |
|                      |                      | separately. This is  |
|                      |                      | not only much more   |
|                      |                      | effort to construct, |
|                      |                      | with many more       |
|                      |                      | Frames, but it has   |
|                      |                      | proven to be         |
|                      |                      | error-prone. We      |
|                      |                      | **strongly**         |
|                      |                      | **recommend** that   |
|                      |                      | you use Standard     |
|                      |                      | pulldown list        |
|                      |                      | widgets.             |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on     |
|                      |                      | next page . . .*     |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
|                    | [E                 | [Use this          |
| [Widget] | Wid                |
|                      |                      | get\...] |
+======================+======================+======================+
| **Pull-Down Item** | ![](/assets/user-guide/media/im    | \...for the items  |
|                    | age457.png){width="1 | in the pull-down   |
| **(Necessary in**  | .1733398950131233in" | list that could be |
|                    | height="0.         | selected after the |
| **Custom Only)**   | 9166524496937882in"} | list is pulled     |
|                    |                      | down. In the       |
| ![](/assets/user-guide/media/ima   |                      | example on the     |
| ge441.jpg){width="0. |                      | left from Palm®,   |
| 39666666666666667in" |                      | if this were the   |
| height="0.3        |                      | image in the       |
| 7666666666666665in"} |                      | Frame, each of the |
|                      |                      | items would be     |
|                      |                      | pulldown item      |
|                      |                      | Widgets. Likewise, |
|                      |                      | all the items in   |
|                      |                      | Apple's Mail       |
|                      |                      | pull-down would be |
|                      |                      | pull-down item     |
|                      |                      | Widget.            |
|                      |                      |                    |
|                      |                      | **Standard         |
|                      |                      | pull-down list     |
|                      |                      | widgets** remove   |
|                      |                      | the necessity to   |
|                      |                      | use pull-down list |
|                      |                      | item widgets. We   |
|                      |                      | **strongly**       |
|                      |                      | **recommend** that |
|                      |                      | you use Standard   |
|                      |                      | pull-down list     |
|                      |                      | widgets.           |
+----------------------+----------------------+----------------------+
| ![](/assets/user-guide/media/i       | **ull-Down Lists and | onstrating a Task,   |
| mage38.jpg){width="0 | Items:** When dem    | you can only         |
| .5012981189851269in" |                      | interact with        |
| height="0.           |                      |                      |
| 5012992125984252in"} |                      |                      |
| **Using CUSTOM P**   |                      |                      |
+----------------------+----------------------+----------------------+
| a pull-down item   | having pulled down   | g with its           |
| Widget after       | the list by          | associated pull-down |
|                      | interactin           | list Widget.         |
+----------------------+----------------------+----------------------+
| This is true       | not interact with    | visible, and they    |
| because a user can | list items until     | are not visible      |
|                      | they are             | until the list       |
+----------------------+----------------------+----------------------+
| is pulled down. If | trate a Task that    | wn item Widget       |
| you demons         | interacts with a     | without first        |
|                      | pull-do              | interacting with     |
+----------------------+----------------------+----------------------+
| the associated     | idget, CogTool will  | message.             |
| pull-down list W   | give you a warning   |                      |
+----------------------+----------------------+----------------------+
|                      |                      |                      |
+----------------------+----------------------+----------------------+
| **List Box Item**  | ![](/assets/user-guide/media/im    | \...when there is  |
|                    | age609.jpg){width="1 | a visible list of  |
| ![](/assets/user-guide/media/ima   | .3766666666666667in" | items, from which  |
| ge477.jpg){width="0. | height="1.         | one or more can be |
| 39666666666666667in" | 3233333333333333in"} | selected, that     |
| height="0.3        |                    | does not have to   |
| 7666666666666665in"} | ![](/assets/user-guide/media/im    | be pulled down or  |
|                      | age610.png){width="1 | popped up. The     |
|                      | .6666458880139983in" | Museums list to    |
|                      | height="0.         | the left is from   |
|                      | 9861198600174979in"} | the ChoiceWay™     |
|                      |                      | Guide to New York  |
|                      |                      | City; the          |
|                      |                      | animation list box |
|                      |                      | is from the        |
|                      |                      | "Custom Animation" |
|                      |                      | dialog in          |
|                      |                      | PowerPoint™.       |
|                      |                      |                    |
|                      |                      | **Standard list    |
|                      |                      | box item widgets** |
|                      |                      | and Custom list    |
|                      |                      | box item widgets   |
|                      |                      | are the same.      |
+----------------------+----------------------+----------------------+
|                      |                      | *More Widgets on   |
|                      |                      | next page . . .*   |
+----------------------+----------------------+----------------------+

+----------------------+----------------------+----------------------+
| [Widget] | [E                   | [Use this            |
|                      | xamples] | Wid                  |
|                      |                      | get\...] |
+======================+======================+======================+
| **Graffiti®**        | !                    | \...to designate an  |
|                      | [](/assets/user-guide/media/image618 | area on a            |
| ![]                | .png) | touchscreen that can |
| (/assets/user-guide/media/image611.j |      | interpret Graffiti®  |
| pg){width="6.0e-2in" |                      | strokes. To mock-up  |
| height="5.666      |                      | a Palm® interface,   |
| 6666666666664e-2in"} |                      | we suggest using one |
|                    |                      | Graffiti® Widget on  |
| ![](/assets/user-guide/media/ima   |                      | the left side called |
| ge612.jpg){width="0. |                      | "Graffiti® Letters"  |
| 14666666666666667in" |                      | and one on the right |
| height="8.33       |                      | side called          |
| 3333333333333e-2in"} |                      | "Graffiti® Numbers"  |
|                    |                      | because the user     |
| !                  |                      | must target one or   |
| [](/assets/user-guide/media/image614 |                      | the other side when  |
| .jpg) |                      | using a Palm®. Other |
| height="8.66       |                      | areas of the         |
| 6557305336833e-2in"} |                      | touchscreen can also |
|                    |                      | receive Graffiti®    |
| ![                 |                      | strokes and can be   |
| ](/assets/user-guide/media/image6110 |                      | designated with      |
| .jpg) |                      | Graffiti® Widgets.   |
| height="8.33       |                      |                      |
| 3223972003499e-2in"} |                      | **Standard Graffiti® |
|                    |                      | widgets** and        |
| ![](/assets/user-guide/media/imag  |                      |                      |
| e6110.jpg){width="0. |                      | Custom Graffiti®     |
| 17666666666666667in" |                      | widgets are the      |
| height="8.33       |                      | same.                |
| 3223972003499e-2in"} |                      |                      |
|                    |                      |                      |
| ![](/assets/user-guide/media/imag  |                      |                      |
| e6110.jpg){width="0. |                      |                      |
| 17666666666666667in" |                      |                      |
| height="5.666      |                      |                      |
| 6666666666664e-2in"} |                      |                      |
+----------------------+----------------------+----------------------+
| **Non-Interactive**  | ![](/assets/user-guide/media/im      | \...where a user     |
|                      | age620.png){width="1 | might have to look   |
| ![](/assets/user-guide/media/im      | .5033333333333334in" | to get information   |
| age619.jpg)     | but cannot           |
| .4791666666666667in" |                      | manipulate that      |
| height="0.           |                      | information from the |
| 4791666666666667in"} |                      | Widget. The example  |
|                      |                      | to the left is a     |
|                      |                      | picture of part of   |
|                      |                      | the Flight           |
|                      |                      | Management System of |
|                      |                      | a Boeing 777         |
|                      |                      | airplane. The        |
|                      |                      | Altitude display     |
|                      |                      | (currently           |
|                      |                      | displaying the       |
|                      |                      | number 10,000) would |
|                      |                      | be defined as a      |
|                      |                      | non-interactive      |
|                      |                      | Widget. The Task     |
|                      |                      | could involve        |
|                      |                      | looking at that      |
|                      |                      | Widget, but the      |
|                      |                      | display cannot be    |
|                      |                      | changed directly     |
|                      |                      | (the knob below it   |
|                      |                      | would have to be     |
|                      |                      | defined as an        |
|                      |                      | interactive Widget   |
|                      |                      | and separately       |
|                      |                      | manipulated).        |
|                      |                      |                      |
|                      |                      | **Standard           |
|                      |                      | non-interactive      |
|                      |                      | widgets** and Custom |
|                      |                      | non-interactive      |
|                      |                      | widgets are the      |
|                      |                      | same.                |
|                      |                      |                      |
|                      |                      | *End of Widgets*     |
+----------------------+----------------------+----------------------+

#### c steps plAced AUtomAticAlly By cogtool

As you demonstrate tasks in CogTool, it automatically places steps that
are associated with your demonstrated actions and that create a valid
cognitive model from your demonstration. These steps appear in yellow in
the Script Step window (your demonstrated steps appear in white).

Specifically where a step is placed automatically is a complicated
algorithm based on transforming the rules written by Card, Moran and
Newell (1980, CMN) into rules associated with widgets. We cannot explain
all the reasoning in this appendix because it requires a deep
understanding of CMN's rules, the notion of a "cognitive unit" and other
concepts in the 1980 paper and subsequent book (Card, Moran and Newll,
1983) and we direct you to those sources for additional information. The
ultimate definition of where these steps are placed is the CogTool code
(which you can get under an Open Source license from the CogTool
Project), but below is a summary of how these steps are placed.

A **Home** step is placed when

-   the hands are on the keyboard and the next action is with the mouse,
    because the hand is needed on the device to perform actions with
    that device.

-   the hand is on the mouse and the next action uses that hand to type
    on the keyboard.

![](/assets/user-guide/media/image17.jpg)
 CogTool takes into account whether the
mouse is used with the right hand or the left (a setting available in
the Script window) and and whether typing will need to use the hand
the mouse is on.

A **Think** step is placed when

-   you explicitly insert a Think step into the demonstration with the
    "Think" button.

-   the previous step is not a Think step (because the KLM does not
    allow more than one Think in a row)

    -   you explicitly insert a Look-At step into the demonstration with
        the Look-At button, because CogTool assumes that the reason for
        deliberately looking at a widget is to read and comprehend the
        information in that widget and this comprehension time is
        represented as a Think.. The Think step is inserted after the
        Look-At step.

    -   a step is demonstrated on the keyboard, Graffiti®, or microphone
        that you labeled as a "command" (by checking the "command"
        checkbox in the Transition Properties pane) because the CMN's
        rules inserted mental operators before "commands, not
        arguments". The Think step is inserted before the demonstrated
        step.

    -   a step is demonstrated on the keyboard that is the typing the
        first command key (e.g., control, escape, etc.) in a string of
        command keys, because command keys are usually associated with
        commands to the system, not arguments. But a string of command
        keys are usually what CMN referred to as a "cognitive unit" so
        no Think steps go between them by CMN's rules. The Think step is
        inserted before the demonstrated step.

    -   a custom Menu Itemis the target of a hover or click/tap action,
        because picking a menu item is usually a command, not an
        argument and Lane et. al. (1993) presents data that suggest that
        the only pause occurs before the selection of the menu header.
        The Think step is inserted before the step that targets the
        item's Menu Header.

    -   a standard Menu Itemis the target of a hover or click/tap
        action. Because of Lane et.al.'s data, CogTool places the Think
        step before the step that targets the item's Menu Header.

    -   a step is demonstrated on a context menu item widget, dropped
        down by either a right single click (typical for a system with a
        two-button mouse) or a ctrl-left single click (typical for a Mac
        with one mouse button). Although the target may be either a
        command or an argument, the act of bringing up a context menu
        signals the intention to invoke a command and the selected item
        in the menu is typically a command. The Think step is inserted
        before the mouse movement that selects the item.

    -   a click/tap action is demonstrated on a Text Box that is not
        "identical" to the last step's target, because selecting a Text
        Box is a command to set the focus in that box. Contrast this to
        clicking on a text widget, which selects an argument (the text),
        which does not get a Think step. The Think step is inserted
        before the demonstrated step.

    -   a click/tap action is demonstrated on a Button/Link that is not
        "identical" to the last step's target AND the two widgets in
        question are not both "OK" terminators nor both "CANCEL"
        terminators. Buttons and links are usually commands to the
        system, but if the user has to click twice on the same button or
        link, that is probably a "cognitive unit" so there should be no
        Think step between click on identical buttons/links (e.g.,
        clicking the back button repeatedly in a web browser to get back
        a few pages). The restriction about terminating buttons reflects
        CMN's rules about redundant terminators. The Think step is
        inserted before the demonstrated step.

Think steps are not placed before demonstrations on Checkbox widgets
Radio Button widgets, List Box widgets, Pull-down List items, or Text
widgets because these widgets typically select arguments, not commands.

As said above, this is only a summary of the rules and the CogTool code
may contain subtleties more easily expressed in code than in prose.

#### d speciAl keys And symBols

A **special key** is a key that performs a special function (as opposed
to standard letter and number keys). CogTool uses symbols to represent
these keys, which you encounter anytime you use them in a keyboard
Transition. If you export your CogTool Scripts to CSV and open them in
other applications (e.g. Microsoft Excel), these applications may not be
able to display the symbols and must therefore use substitutes. Listed
below are all fifteen special keys, the symbols used to represent them
in both the Windows and Macintosh versions of CogTool, and the symbols'
corresponding substitutes when they cannot be displayed.

+----------------+----------------+----------------+----------------+
| **Special      | **Win Symbol** | **Mac Symbol** | **Substitute |
| Key**          |                |                | for Symbol** |
+================+================+================+================+
| Shift        | ⇧              | ⇧              | (SHIFT)        |
+----------------+----------------+----------------+----------------+
| Control      | ↥              | †              | (CTRL)         |
+----------------+----------------+----------------+----------------+
| Alt          | ⅂              | ┓              | (ALT)          |
+----------------+----------------+----------------+----------------+
| Command      | ⊞              | 圧             | \(CMD\)        |
+----------------+----------------+----------------+----------------+
| Function     | ∱              | ∫              | (FN)           |
+----------------+----------------+----------------+----------------+
| Enter        | CR             | ¶              | (ENTER)        |
+----------------+----------------+----------------+----------------+
| Escape       | ESC            | ♂              |                |
+----------------+----------------+----------------+----------------+
| Tab          |                | ⇒              | ![](/assets/user-guide/media/  |
|                |                |                | image621.png){ |
|                |                |                | width="1.76in" |
|                |                |                | he             |
|                |                |                | ight="0.663333 |
|                |                |                | 3333333333in"} |
+----------------+----------------+----------------+----------------+
| Backspace    | BS             | ⇦              |                |
+----------------+----------------+----------------+----------------+
| Delete       | DEL            | 〄             | (DEL)          |
+----------------+----------------+----------------+----------------+
| Caps Lock    |                | 仝             | (CAPS)         |
+----------------+----------------+----------------+----------------+
| Up           | ↑              | ↑              | (UP)           |
+----------------+----------------+----------------+----------------+
| Down         | ↓              | ↓              | (DOWN)         |
+----------------+----------------+----------------+----------------+
| Left         | ←              | ←              | (LEFT)         |
+----------------+----------------+----------------+----------------+
| Right        | →              | →              | (RIGHT)        |
+----------------+----------------+----------------+----------------+

#### e reporting A BUg

Though fully functional, CogTool is still a work in progress and will
sometimes crash. A CogTool crash generates an error window like the one
seen below.

![](/assets/user-guide/media/image622.jpg)

Figure A-4: Error message window

CogTool crashes result from bugs in the program that have not yet been
discovered or fixed. Reporting these bugs alerts us to problems we can
address for future releases of CogTool.

To report a bug:

-   Copy the text in the error window by highlighting the text and
    copying with CTRL+C (Windows) or C (Mac OS).

-   Identify the version of CogTool you have.

**Mac OS X**: Under the CogTool menu listing, choose About CogTool.
**Windows:** Under the Help menu listing, choose About CogTool.

![](/assets/user-guide/media/image629.png)


5\. Send an email to cogtool\@cs.cmu.edu with the text from the error
message, the version of CogTool you are using, and a description of the
action you performed immediately before the error appeared. If we need
additional information, we will contact you. **Note:** If you have a
.cgt file and are willing to share it, please send the file as an
attachment.

We will do our best to resolve the problem and will contact you with a
fix or workaround as soon as one is available.

#### Cogtool Shortcut Keys

The following shortcut keys can be used whenever the action they perform
is required.

+--------------+--------------+------------------+-----------------+------------------+
| **Save**     | **Save As**  | **Open Project** | **New Project** | **Close Window** |
+==============+==============+==================+=================+==================+
| Mac: S       | Mac: ⇧S      | Mac: O           | Mac: N          | Mac: W           |
|              |              |                  |                 |                  |
| Win: CTRL+S  | Win:         | Win: CTRL+O      | Win: CTRL+N     | Win: CTRL+W      |
|              |              |                  |                 |                  |
|              | CTRL+SHIFT+S |                  |                 |                  |
+--------------+--------------+------------------+-----------------+------------------+
| **Cut**      | **Copy**     | **Paste**        | **Duplicate**   |                  |
+--------------+--------------+------------------+-----------------+------------------+
| Mac: X       | Mac: C       | Mac: V           | Mac: D          |                  |
|              |              |                  |                 |                  |
| Win: CTRL+ X | Win: CTRL+C  | Win: CTRL+V      | Win: CTRL+D     |                  |
+--------------+--------------+------------------+-----------------+------------------+
| **Delete**   | **Rename**   | **Edit**         | **Undo**        | **Redo**         |
+--------------+--------------+------------------+-----------------+------------------+
| Mac:         | Mac: R       | Mac: E           | Mac: Z          | Mac: Y           |
|              |              |                  |                 |                  |
| Win:         | Win: CTRL+R  | Win: CTRL+E      | Win: CTRL+Z     | Win: CTRL+Y      |
|              |              |                  |                 |                  |
| CTRL+DELETE  |              |                  |                 |                  |
+--------------+--------------+------------------+-----------------+------------------+

The remaining shortcut keys perform actions that are specific to the
CogTool window you are using.

+-------------------+-----------------------+-----------------------+
| **Design**      |                       |                       |
+===================+=======================+=======================+
| **New Design**    |                       |                       |
+-------------------+-----------------------+-----------------------+
| Mac: ⇧D           |                       |                       |
|                   |                       |                       |
| Win: CTRL+SHIFT+D |                       |                       |
+-------------------+-----------------------+-----------------------+
|                   | **Frame**           |                       |
+-------------------+-----------------------+-----------------------+
| **New Frame**     | **Setting Background  | **Removing Background |
|                   | Image**               | Image**               |
+-------------------+-----------------------+-----------------------+
| Mac: ⇧F           | Mac: B                | Mac: ⇧B               |
|                   |                       |                       |
| Win: CTRL+SHIFT+F | Win: CTRL+B           | Win: CTRL+SHIFT+B     |
+-------------------+-----------------------+-----------------------+
| **Widget**      |                       |                       |
+-------------------+-----------------------+-----------------------+
| **New Widget**    | **Setting Layer       |                       |
|                   | Color**               |                       |
+-------------------+-----------------------+-----------------------+
| Mac: ⇧I           | Mac: ⇧C               |                       |
|                   |                       |                       |
| Win: CTRL+SHIFT+I | Win: CTRL+SHIFT+C     |                       |
+-------------------+-----------------------+-----------------------+

+----------------+----------------+----------------+----------------+
| **Task/Task  |                |                |                |
| Group**      |                |                |                |
+================+================+================+================+
| **New Task**   | **New Task     |                |                |
|                | Group**        |                |                |
+----------------+----------------+----------------+----------------+
| Mac: ⇧T        | Mac: ⇧G        |                |                |
|                |                |                |                |
| Win:           | Win:           |                |                |
| CTRL+SHIFT+T   | CTRL+SHIFT+G   |                |                |
+----------------+----------------+----------------+----------------+
|                | **Zoom for   |                |                |
|                | Design,      |                |                |
|                | Frame,       |                |                |
|                | Script**     |                |                |
+----------------+----------------+----------------+----------------+
| **Zoom In**    | **Zoom Out**   | **Normal       | **Zoom to      |
|                |                | Zoom**         | Fit**          |
+----------------+----------------+----------------+----------------+
| Mac: +         | Mac: -         | Mac: 0         | Mac: /         |
|                |                |                |                |
| Win: CTRL+=    | Win: CTRL+ -   | Win: CTRL+0    | Win: CTRL+/    |
+----------------+----------------+----------------+----------------+

#### cogtool context menUs

##### Project Window

![](/assets/user-guide/media/image630.png)
![](/assets/user-guide/media/image631.jpg)


Context Menu - Nothing selected Context Menu - Design selected

![](/assets/user-guide/media/image632.jpg)


Context Menu - Task selected

##### Design Window

![](/assets/user-guide/media/image633.jpg)

![](/assets/user-guide/media/image634.jpg)


Context Menu - Nothing selected Context Menu - Frame selected

![](/assets/user-guide/media/image635.jpg)


Context Menu - Transition selected

##### Frame Window

![](/assets/user-guide/media/image636.jpg)

![](/assets/user-guide/media/image637.jpg)


Context Menu - Nothing selected Context Menu - Widget selected

##### Script Editor

![](/assets/user-guide/media/image639.png)
![](/assets/user-guide/media/image640.jpg)


Context Menu - Left pane Context Menu - Step list

## Appendix H: Glossary

ACT-R
-----

ACT-R is a cognitive theory of how human perception, cognition, and
motor actions. It ia computational theory that is implemented in Lisp
and runs inside CogTool to produce it predictions of human
performance. For more information on ACT-R, go to :
http://act-r.psy.cmu.edu/about/.

Demonstration
-------------

A Demonstration follows a series of Transitions from a start Frame to
the end Frame of a Task. CogTool produce a Script from a Demonstration
and then computes a predicted execution time for the Script using
ACT-R.

Design
------

A Design is a series of Frames that represent the user interface of
the system being analyzed and the Transitions that move from Frame to
Frame.

Frame
-----

A Frame represents a single screen of a user interface. Multiple
Frames can be linked together with Transitions to form a complete
Design.

Keystroke-Level Model (KLM)
---------------------------

Keystroke-level model (KLM) is one of the frameworks used by CogTool
to make predictions on how long it would take to perform a Task using
a keyboard and mouse. For more information on the KLM, see Card, Moran
and Newell, 1983.

Project
-------

A CogTool Project stores all the interface Designs, Tasks that can be
performed on the Designs, and predictions of user behavior. A Project
is stored in a .cgt file.

Script
------

A Script is a list of steps necessary to accomplish a Task. A Script
is formed from a Demonstration and has added steps in accordance with
the Keystroke-Level Model.

**Task**

A Task represents a specific sequence of actions a user will take to
accomplish a goal.

Task Group
----------

A Task Group organizes the Tasks and displays the sum, mean, minimum,
or maximum skilled execution time predicted for the Tasks in that
group.

Transition
----------

A Transition represents the user's action that causes the system to
move from one Frame to the next. A Transition goes from a Widget to a
Device to a Frame.

Widgets
-------

A Widget is an element on a Frame with which a user may interact. A
Widget could be a button, link, checkbox, radio button, text box,
text, menu, submenu, menu item, context menu, pull-down list, pulldown
item, list box item, or Graffiti®. In CogTool, Widgets can also be
created for non-interactive elements to construct a full
representation of an interface.
