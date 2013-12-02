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

package edu.cmu.cs.hcii.cogtool.ui;

import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.widgets.TreeColumn;
import org.eclipse.swt.widgets.TreeItem;

import edu.cmu.cs.hcii.cogtool.model.Design;
import edu.cmu.cs.hcii.cogtool.model.GroupNature;
import edu.cmu.cs.hcii.cogtool.model.TaskGroup;
import edu.cmu.cs.hcii.cogtool.model.AUndertaking;

public class ProjectMouseState extends SWTMouseState
{
    protected ProjectUI ui;

    public ProjectMouseState(ProjectUI projUI)
    {
        super(projUI);

        ui = projUI;
    }

    @Override
    protected void dealWithMouseUp(MouseEvent me)
    {
        super.dealWithMouseUp(me);

        if (me.button == 1) {
            TreeItem item = ui.tree.getItem(new Point(me.x, me.y));
            TreeColumn column = ui.findColumn(me.x);

            if ((item == null) && (column == null)) {
                ui.selection.deselectAll();
            }
            else {
                ui.selection.setSelectedCell(item, column);
            }
        }
    }

    @Override
    protected void dealWithMouseDoubleClick(MouseEvent me)
    {
        super.dealWithMouseDoubleClick(me);

        TreeItem item = ui.tree.getItem(new Point(me.x, me.y));
        TreeColumn column = ui.findColumn(me.x);

        // If there is a Task and we're right of all designs,
        // check to see if the group visibility should toggle
        if ((item != null) && (column == null)) {
            // Toggle tree expand when a TaskGroup is double-clicked,
            // but not if double-clicking on the first column to edit the name
            AUndertaking u = (AUndertaking) item.getData();

            if (u.isTaskGroup()) {
                item.setExpanded(! item.getExpanded());
            }
        }

        // If on a valid cell, either edit script or open the script viewer
        if ((item != null) &&
            (column != null) &&
            (column.getData() != null))
        {
            AUndertaking u = (AUndertaking) item.getData();

            // At the intersection of a task and design
            ProjectContextSelectionState seln =
                new ProjectContextSelectionState(ui.getProject());

            seln.setSelectedDesign((Design) column.getData());
            seln.addSelectedTask(u);

            if (u.isTaskGroup()) {
                TaskGroup group = (TaskGroup) u;

                if (GroupNature.SUM.equals(group.getNature())) {
                    item.setExpanded(true);

                    ui.cleanupTaskEditor();

//TODO: won't work since repaint won't occur until after we're all done.
                    ui.performAction(ProjectLID.ViewGroupScript, seln);
                }
            }
            else {
                ui.cleanupTaskEditor();

//TODO: won't work since repaint won't occur until after we're all done.
                ui.performAction(ProjectLID.EditScript, seln);
            }
        }
        else if ((item != null) &&
                 (column != null) &&
                 (column.getData() == null))
        {
            // In a valid row, first column
            if (ui.treeOperationOccurred == 0) {
                ui.initiateTaskRename(item, true);
            }
        }
    }
}