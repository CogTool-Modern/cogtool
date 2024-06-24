# CogTool

<img alt="designs-compared" src="https://user-images.githubusercontent.com/1075425/90916892-8a721f80-e3a7-11ea-9860-ceab32e4b204.png">
<img alt="wireframes" src="https://user-images.githubusercontent.com/1075425/90916895-8b0ab600-e3a7-11ea-816c-05a3cf16dd6e.png">
<img alt="demonstration-steps" src="https://user-images.githubusercontent.com/1075425/90916886-88a85c00-e3a7-11ea-8433-f9aa9e0fb0d9.png">

CogTool is a general purpose UI prototyping tool with a difference--
it automatically evaluates your design with a predictive human
performance model (a "cognitive crash dummy"). Simply create a
storyboard of your design idea with sketches, images or on a canvas
with CogTool's widgets, demonstrate tasks on that storyboard, then
press a button to produce a valid cognitive model predicting how long
it will take a skilled user to complete those tasks. CogTool can be
used today to baseline your current interface, or compare competitors'
interfaces, and predict how much better your new designs will be.

CogTool is free software, released under the FSF Lesser Gnu Public
License. [See LICENSE.txt for details](https://github.com/CogTool-Modern/cogtool/blob/master/LICENSE.txt).

There is a separate repository of documentation, both for end users
and for developers: [https://github.com/cogtool/documentation.git](https://github.com/cogtool/documentation.git)
TODO Merge this seperate repo with the in-branch, GitHub Pages-powered `docs/` folder.

## Building
To compile CogTool,
1. Download the source code from [GitHub](https://github.com/CogTool-Modern/cogtool).
2. Install [Apache Ant](https://ant.apache.org/bindownload.cgi)
3. From within the project directory, run `ant` 

Running the `ant` command begins the build process specified in `build.xml`. 

<details markdown="1">
<summary>Building on Windows</summary>

The step in the build process for building Windows installers will only happen when building CogTool on Windows. This steps assumes that you have installed [NSIS](https://nsis.sourceforge.io/Main_Page) and the executable is available at `C:\Program Files (x86)\NSIS\makensis.exe`

</details>

### Related 
- [CogTool - 32-bit build instructions](https://github.com/cogtool/documentation/blob/master/Processes/configuring-development-machines.txt)
- [Download Apache Ant](https://ant.apache.org/bindownload.cgi)

