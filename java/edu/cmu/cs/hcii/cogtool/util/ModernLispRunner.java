/*******************************************************************************
 * CogTool Copyright Notice and Distribution Terms
 * CogTool 1.3, Copyright (c) 2005-2013 Carnegie Mellon University
 * This software is distributed under the terms of the FSF Lesser
 * Gnu Public License (see LGPL.txt). 
 * 
 * CogTool is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 * 
 * CogTool is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with CogTool; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 ******************************************************************************/

package edu.cmu.cs.hcii.cogtool.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/**
 * Modern LISP runner that provides better cross-platform support
 * and handles Apple Silicon Macs properly.
 */
public class ModernLispRunner {
    
    /**
     * Execute LISP with modern cross-platform support
     */
    public static int execModernLisp(String memoryImageName,
                                   List<File> filesToLoad,
                                   String initialCommand,
                                   List<String> outLines,
                                   List<String> errLines,
                                   ProcessTraceCallback traceCB,
                                   Cancelable cancelable)
    {
        String lispProgName = null;
        String osName = null;
        
        if (OSUtils.WINDOWS) {
            lispProgName = "lisp.exe";
            osName = "win";
        }
        else if (OSUtils.MACOSX) {
            lispProgName = "lisp.run";
            if (OSUtils.isAppleSiliconMac()) {
                osName = "mac-arm64";
            }
            else if (OSUtils.isIntelMac()) {
                osName = "mac-intel";
            }
            else {
                throw new IllegalStateException("Unsupported Mac architecture");
            }
        }
        else {
            // Linux support
            lispProgName = "lisp.run";
            osName = "linux";
        }

        File clispDir = new File("clisp-" + osName);
        
        // Fallback strategy for Apple Silicon - use Intel version with Rosetta 2
        if (OSUtils.isAppleSiliconMac() && !clispDir.exists()) {
            System.out.println("Apple Silicon native LISP not found, falling back to Intel version with Rosetta 2");
            clispDir = new File("clisp-mac-intel");
            osName = "mac-intel";
        }
        
        if (!clispDir.exists()) {
            throw new IllegalStateException("LISP runtime not found for platform: " + osName);
        }

        List<String> cmdList = new ArrayList<String>();

        // the executable itself
        File lispExecutable = new File(clispDir, lispProgName);
        if (!lispExecutable.exists()) {
            throw new IllegalStateException("LISP executable not found: " + lispExecutable.getAbsolutePath());
        }
        
        cmdList.add(lispExecutable.getAbsolutePath());

        // make it quiet
        cmdList.add("-q");

        // Set the character encoding used. It appears that the default
        // UTF-8 is causing problems on some small number of machines.
        // Why these machines are failing to correctly launch CLisp
        // with the default encoding remains a mystery, however.
        cmdList.add("-E");
        cmdList.add("ISO-8859-1");

        // load the memory image
        cmdList.add("-M");
        File memoryImage = new File(clispDir, memoryImageName);
        if (!memoryImage.exists()) {
            throw new IllegalStateException("LISP memory image not found: " + memoryImage.getAbsolutePath());
        }
        cmdList.add(memoryImage.getAbsolutePath());

        // load lisp files
        if (filesToLoad != null) {
            for (File file : filesToLoad) {
                cmdList.add("-i");
                cmdList.add(file.getPath());
            }
        }

        // what to execute
        cmdList.add("-x");
        cmdList.add(initialCommand);

        // Windows mangles command line arguments, so escape them as
        // necessary.
        if (OSUtils.WINDOWS) {
            for (ListIterator<String> it = cmdList.listIterator(); it.hasNext();)
            {
                String cmd = it.next();

                if (cmd.indexOf(' ') != -1) {
                    it.set("\"" + cmd + "\"");
                }
            }
        }

        return Subprocess.exec(cmdList, outLines, errLines, traceCB, cancelable);
    }
}