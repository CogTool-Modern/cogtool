import java.io.File;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Collections;
import edu.cmu.cs.hcii.cogtool.model.*;
import edu.cmu.cs.hcii.cogtool.controller.DesignEditorCmd;
import edu.cmu.cs.hcii.cogtool.util.ObjectPersister;

public class UpwardMenuSmoke {
    private static void at(IWidget w, double y) {
        if (Math.abs(w.getEltBounds().y - y) > 0.0001)
            throw new AssertionError(w.getTitle() + " at " + w.getEltBounds().y + ", expected " + y);
    }
    private static void xAt(IWidget w, double x) {
        if (Math.abs(w.getEltBounds().x - x) > 0.0001)
            throw new AssertionError(w.getTitle() + " at x=" + w.getEltBounds().x + ", expected " + x);
    }
    public static void main(String[] args) throws Exception {
        CogToolSerialization init = CogToolSerialization.ONLY;
        MenuHeader header = new MenuHeader(new SimpleWidgetGroup(SimpleWidgetGroup.HORIZONTAL), new DoubleRectangle(20, 100, 60, 10), "Start");
        MenuItem one = new MenuItem(header, new DoubleRectangle(20, 110, 80, 10), "One");
        MenuItem two = new MenuItem(header, new DoubleRectangle(20, 120, 80, 5), "Two");
        header.setAttribute(WidgetAttributes.MENU_OPENS_UP_ATTR, Boolean.TRUE);
        at(one, 85); at(two, 95);
        DesignEditorCmd.repositionChildren(header.getChildren());
        at(one, 85); at(two, 95);
        header.setWidgetSize(60, 20);
        at(one, 60); at(two, 80);
        header.setAttribute(WidgetAttributes.MENU_OPENS_UP_ATTR, Boolean.FALSE);
        at(one, 120); at(two, 140);
        header.setAttribute(WidgetAttributes.MENU_OPENS_UP_ATTR, Boolean.TRUE);
        header.setAttribute(WidgetAttributes.MENU_OFFSET_X_ATTR, Integer.valueOf(-15));
        header.setAttribute(WidgetAttributes.MENU_OFFSET_Y_ATTR, Integer.valueOf(7));
        xAt(one, 5); at(one, 67); xAt(two, 5); at(two, 87);
        DesignEditorCmd.repositionChildren(header);
        xAt(one, 5); at(one, 67);
        header.setWidgetOrigin(40, 120);
        xAt(one, 25); at(one, 87);
        header.setAttribute(WidgetAttributes.MENU_OPENS_UP_ATTR, Boolean.FALSE);
        xAt(one, 25); at(one, 147); at(two, 167);
        DesignEditorCmd.repositionChildren(header);
        xAt(one, 25); at(one, 147);
        header.setAttribute(WidgetAttributes.MENU_OPENS_UP_ATTR, Boolean.TRUE);
        xAt(one, 25); at(one, 87); at(two, 107);
        File file = File.createTempFile("menu-smoke", ".cgt");
        try {
            ObjectPersister.ONLY.registerForPersistence(header);
            ObjectPersister.ONLY.save(header, file);
            MenuHeader loaded = (MenuHeader) ObjectPersister.ONLY.load(file);
            if (loaded.getChildrenLocation() != AParentWidget.CHILDREN_ABOVE) throw new AssertionError("direction lost");
            xAt(loaded.getItem(0), 25); at(loaded.getItem(0), 87);
            at(loaded.getItem(1), 107);
            if (!Integer.valueOf(-15).equals(loaded.getAttribute(WidgetAttributes.MENU_OFFSET_X_ATTR)) ||
                !Integer.valueOf(7).equals(loaded.getAttribute(WidgetAttributes.MENU_OFFSET_Y_ATTR)))
                throw new AssertionError("menu offsets lost");
            DesignEditorCmd.repositionChildren(loaded);
            xAt(loaded.getItem(0), 25); at(loaded.getItem(0), 87);
            System.out.println("Upward menu layout and persistence passed");
        } finally { file.delete(); }
    }
}
