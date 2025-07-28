package edu.cmu.cs.hcii.cogtool.ui;

import edu.cmu.cs.hcii.cogtool.model.Design;
import edu.cmu.cs.hcii.cogtool.model.DeviceType;
import edu.cmu.cs.hcii.cogtool.model.Project;
import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.*;

public class DesignEditorUITest {

    @Test
    public void buildWindowMenuLabel() {
        Project aProject = new Project("My First Project");

        String designName = "My First Design";
        Set<DeviceType> deviceTypeSet = new HashSet<DeviceType>();
        Design aDesign = new Design(designName, deviceTypeSet);

        DesignEditorUI anEditorUI = new DesignEditorUI(aDesign,aProject, null);
        assertEquals("Design: " + designName, anEditorUI.buildWindowMenuLabel(aDesign));
    }
}