/*******************************************************************************
 * CogTool Copyright Notice and Distribution Terms
 * CogTool 1.2, Copyright (c) 2005-2012 Carnegie Mellon University
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
 * 
 * CogTool makes use of several third-party components, with the 
 * following notices:
 * 
 * Eclipse SWT
 * Eclipse GEF Draw2D
 * 
 * Unless otherwise indicated, all Content made available by the Eclipse 
 * Foundation is provided to you under the terms and conditions of the Eclipse 
 * Public License Version 1.0 ("EPL"). A copy of the EPL is provided with this 
 * Content and is also available at http://www.eclipse.org/legal/epl-v10.html.
 * 
 * CLISP
 * 
 * Copyright (c) Sam Steingold, Bruno Haible 2001-2006
 * This software is distributed under the terms of the FSF Gnu Public License.
 * See COPYRIGHT file in clisp installation folder for more information.
 * 
 * ACT-R 6.0
 * 
 * Copyright (c) 1998-2007 Dan Bothell, Mike Byrne, Christian Lebiere & 
 *                         John R Anderson. 
 * This software is distributed under the terms of the FSF Lesser
 * Gnu Public License (see LGPL.txt).
 * 
 * Apache Jakarta Commons-Lang 2.1
 * 
 * This product contains software developed by the Apache Software Foundation
 * (http://www.apache.org/)
 * 
 * Mozilla XULRunner 1.9.0.5
 * 
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/.
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 * 
 * The J2SE(TM) Java Runtime Environment
 * 
 * Copyright 2009 Sun Microsystems, Inc., 4150
 * Network Circle, Santa Clara, California 95054, U.S.A.  All
 * rights reserved. U.S.  
 * See the LICENSE file in the jre folder for more information.
 ******************************************************************************/

package edu.cmu.cs.hcii.cogtool.model;

import edu.cmu.cs.hcii.cogtool.util.ObjectLoader;
import edu.cmu.cs.hcii.cogtool.util.ObjectSaver;

public class RadioButtonGroup extends GridButtonGroup
{
    public static final int edu_cmu_cs_hcii_cogtool_model_RadioButtonGroup_version = 0;

    protected static final String selectionVar = "selection";

    private static ObjectSaver.IDataSaver<RadioButtonGroup> SAVER =
        new ObjectSaver.ADataSaver<RadioButtonGroup>() {
            @Override
            public int getVersion()
            {
                return edu_cmu_cs_hcii_cogtool_model_RadioButtonGroup_version;
            }

            @Override
            public void saveData(RadioButtonGroup v, ObjectSaver saver)
                throws java.io.IOException
            {
                saver.saveObject(v.selection, selectionVar);
            }
        };

    public static void registerSaver()
    {
        ObjectSaver.registerSaver(RadioButtonGroup.class.getName(), SAVER);
    }

    // This loader works for the older version since we simply moved the
    // instance variables to the superclass.
    private static ObjectLoader.IObjectLoader<RadioButtonGroup> LOADER =
        new ObjectLoader.AObjectLoader<RadioButtonGroup>() {
            @Override
            public RadioButtonGroup createObject()
            {
                return new RadioButtonGroup();
            }

            @Override
            public void set(RadioButtonGroup target, String variable, Object value)
            {
                if (variable != null) {
                    if (variable.equals(selectionVar)) {
                        target.selection = (RadioButton) value;
                    }
                }
            }

            // For older saved groups; data is now saved in the superclass
            @Override
            public void set(RadioButtonGroup target, String variable, double value)
            {
                if (variable != null) {
                    if (variable.equals(startXVar)) {
                        target.startX = value;
                    }
                    else if (variable.equals(startYVar)) {
                        target.startY = value;
                    }
                }
            }
        };

    public static void registerLoader()
    {
        ObjectLoader.registerLoader(RadioButtonGroup.class.getName(),
                                    edu_cmu_cs_hcii_cogtool_model_RadioButtonGroup_version,
                                    LOADER);
    }

    protected RadioButton selection = null;

    public RadioButtonGroup()
    {
        super();
    }

    /**
     * To support twinning
     */
    public RadioButtonGroup(double x, double y)
    {
        super(x, y);
    }

    public RadioButton getSelection()
    {
        return selection;
    }

    @Override
    public void setAttribute(String attr, Object value)
    {
        super.setAttribute(attr, value);

        // Apparently, this.selection is tracked by an actual attribute entry
        if (attr.equals(WidgetAttributes.SELECTION_ATTR) &&
            (value != selection))
        {
            RadioButton button = (RadioButton) value;
            RadioButton prevSeln = selection;

            selection = button;

            if ((prevSeln != null) && (prevSeln.getParentGroup() == this)) {
                // Check that the widget is in this group before deselecting it,
                // because when radio button groups are duplicated, the values
                // of their attributes are passed along.
                prevSeln.setAttribute(WidgetAttributes.IS_SELECTED_ATTR,
                                      WidgetAttributes.NOT_SELECTED);
            }

            if (selection != null) {
                selection.setAttribute(WidgetAttributes.IS_SELECTED_ATTR,
                                            WidgetAttributes.IS_SELECTED);
            }
        }
    }

    /**
     * Must override {@link GridButtonGroup}'s twin method because this must
     * return a RadioButtonGroup
     */
    @Override
    public SimpleWidgetGroup twin()
    {
        RadioButtonGroup groupTwin =
            new RadioButtonGroup(getStartX(), getStartY());

        groupTwin.twinState(this);

        return groupTwin;
    }
}