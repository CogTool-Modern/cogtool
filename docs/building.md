---
title: Building CogTool
author: justing
layout: page
---

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
