package edu.cmu.cs.hcii.cogtool.model;

import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.*;

public class DesignTest {

    private String designName = "My First Design";
    Set<DeviceType> deviceTypeSet = new HashSet<DeviceType>();
    private Design aDesign = new Design(designName, deviceTypeSet);

    @Test
    public void getName() {
        assertEquals(designName, aDesign.getName());
    }

    @Test
    public void setName() {
        String designName = "My Second Design";
        aDesign.setName(designName);
        assertEquals(designName, aDesign.name);
    }
}