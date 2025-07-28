/*******************************************************************************
 * CogTool Copyright Notice and Distribution Terms
 * CogTool 1.3, Copyright (c) 2005-2013 Carnegie Mellon University
 * This software is distributed under the terms of the FSF Lesser
 * Gnu Public License (see LGPL.txt). 
 *******************************************************************************/

package edu.cmu.cs.hcii.cogtool.test;

import java.util.ArrayList;
import java.util.List;

import joptsimple.OptionParser;
import joptsimple.OptionSet;

/**
 * Test class to verify that file association and argument passing works correctly.
 * This test simulates the argument parsing logic used in CogTool.main().
 */
public class FileAssociationTest {
    
    public static void main(String[] args) {
        System.out.println("FileAssociationTest: Testing argument parsing...");
        System.out.println("Number of arguments received: " + args.length);
        
        for (int i = 0; i < args.length; i++) {
            System.out.println("Argument " + i + ": '" + args[i] + "'");
        }
        
        try {
            // Use the same option parser configuration as CogTool
            OptionParser parser = new OptionParser("f:i:re:s:qQ");
            // The psn is supplied on MacOS when a GUI application is double-clicked;
            // we just ignore it, but need to recognize it so we can ignore it.
            parser.accepts("psn", "process serial number (ignored)").withRequiredArg();
            OptionSet opts = parser.parse(args);
            
            List<String> filesToLoad = new ArrayList<String>();
            for (Object obj : opts.nonOptionArguments()) {
                filesToLoad.add((String)obj);
            }
            
            System.out.println("Files to load: " + filesToLoad.size());
            for (String file : filesToLoad) {
                System.out.println("  - " + file);
            }
            
            if (filesToLoad.isEmpty()) {
                System.out.println("WARNING: No files to load. File association may not be working correctly.");
            } else {
                System.out.println("SUCCESS: File association appears to be working correctly.");
            }
            
        } catch (Exception e) {
            System.err.println("ERROR: Exception during argument parsing: " + e.getMessage());
            e.printStackTrace();
        }
    }
}