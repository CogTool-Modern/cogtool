package edu.cmu.cs.hcii.cogtool.model;

import java.io.File;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import edu.cmu.cs.hcii.cogtool.CogToolLID;
import edu.cmu.cs.hcii.cogtool.CogToolPref;
import edu.cmu.cs.hcii.cogtool.controller.DefaultCmd;
import edu.cmu.cs.hcii.cogtool.controller.FrameEditorController;
import edu.cmu.cs.hcii.cogtool.ui.FrameEditorUI;
import edu.cmu.cs.hcii.cogtool.view.FrameEditorView;
import edu.cmu.cs.hcii.cogtool.view.WidgetPropertiesPane;
import edu.cmu.cs.hcii.cogtool.util.UndoManager;
import edu.cmu.cs.hcii.cogtool.util.CompoundUndoableEdit;
import edu.cmu.cs.hcii.cogtool.util.ObjectPersister;

/** Checks the per-widget Fitts option, persistence, undo, and real predictions. */
public class MagicEdgesSmoke {
    private static final String ATTR = WidgetAttributes.INFINITE_FITTS_WIDTH_ATTR;

    private static void require(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static double predict(IPredictionAlgo algorithm, Script script) {
        APredictionResult result = algorithm.prepareComputation(script).compute().completeWork();
        require(result.getResultState() == APredictionResult.IS_COMPUTED,
                "Prediction failed: " + result.getErrorLines());
        return ((TimePredictionResult) result).getTaskTime();
    }

    public static void main(String[] args) throws Exception {
        Display display = new Display();
        try {
            CogToolSerialization init = CogToolSerialization.ONLY;
            Project project = (Project) ObjectPersister.ONLY.load(new File(args[0]));
            require(WidgetAttributes.isObsoleting(ATTR), "The attribute must invalidate predictions");
            boolean improved = false;
            IWidget savedWidget = null;
            Design savedDesign = null;
            Demonstration savedDemo = null;
            for (AUndertaking task : project.getUndertakings()) {
                for (Design design : project.getDesigns()) {
                    TaskApplication ta = project.getTaskApplication(task, design);
                    if (ta == null) continue;
                    List<IWidget> demonstrated = new ArrayList<IWidget>();
                    Demonstration demo = ta.getDemonstration();
                    for (Frame frame : design.getFrames()) {
                        for (IWidget widget : frame.getWidgets()) {
                            require(!Boolean.TRUE.equals(widget.getAttribute(ATTR)), "Expected option to default off");
                            for (int i = 0; i < demo.getStepCount(); i++) {
                                if (demo.getStepAt(i).usesWidget(widget)) {
                                    demonstrated.add(widget);
                                    break;
                                }
                            }
                        }
                    }
                    Iterator<CognitiveModelGenerator> generators = ta.getModelGenerators();
                    while (generators.hasNext()) {
                        Script script = ta.getScript(generators.next());
                        IPredictionAlgo algorithm = ta.determineActiveAlgorithm(project);
                        double normal = predict(algorithm, script);
                        for (IWidget widget : demonstrated) widget.setAttribute(ATTR, Boolean.TRUE);
                        double allEnabled = predict(algorithm, script);
                        require(allEnabled <= normal + 0.001, "Enabled widgets increased prediction");
                        for (IWidget widget : demonstrated) widget.setAttribute(ATTR, Boolean.FALSE);
                        double restored = predict(algorithm, script);
                        require(Math.abs(normal - restored) < 0.001, "Disabling widgets did not restore prediction");
                        if (!improved && allEnabled < normal - 0.001) {
                            for (IWidget widget : demonstrated) {
                                widget.setAttribute(ATTR, Boolean.TRUE);
                                double single = predict(algorithm, script);
                                if (single < normal - 0.001) {
                                    improved = true;
                                    savedWidget = widget;
                                    savedDesign = design;
                                    savedDemo = demo;
                                    System.out.println("One widget: " + normal + " -> " + single);
                                    break;
                                }
                                widget.setAttribute(ATTR, Boolean.FALSE);
                            }
                        }
                        System.out.println(task.getName() + " / " + design.getName() + ": " + normal + " -> " + allEnabled);
                        if (improved) break;
                    }
                    if (improved) break;
                }
                if (improved) break;
            }
            require(improved, "Enabling a single demonstrated widget had no effect");
            Frame savedFrame = savedWidget.getFrame();
            String widgetName = savedWidget.getName();
            String frameName = savedFrame.getName();
            String designName = savedDesign.getName();
            IWidget other = null;
            for (IWidget widget : savedFrame.getWidgets()) {
                if (widget != savedWidget && !Boolean.TRUE.equals(widget.getAttribute(ATTR))) {
                    other = widget;
                    break;
                }
            }
            require(other != null, "Need an unselected widget for isolation check");
            String otherName = other.getName();

            CompoundUndoableEdit edit = new CompoundUndoableEdit("Fitts width", CogToolLID.SetAttribute);
            DefaultCmd.setAttribute(savedWidget, null, ATTR, Boolean.FALSE, null, edit);
            edit.end();
            require(!Boolean.TRUE.equals(savedWidget.getAttribute(ATTR)), "Edit did not disable setting");
            edit.undo();
            require(Boolean.TRUE.equals(savedWidget.getAttribute(ATTR)), "Undo did not restore setting");
            edit.redo();
            require(!Boolean.TRUE.equals(savedWidget.getAttribute(ATTR)), "Redo did not disable setting");
            edit.undo();

            File saved = File.createTempFile("cogtool-fitts-widget-", ".cgt");
            try {
                ObjectPersister.ONLY.save(project, saved);
                Project reloaded = (Project) ObjectPersister.ONLY.load(saved);
                Frame frame = reloaded.getDesign(designName).getFrame(frameName);
                require(Boolean.TRUE.equals(frame.getWidget(widgetName).getAttribute(ATTR)), "Enabled setting did not persist");
                require(!Boolean.TRUE.equals(frame.getWidget(otherName).getAttribute(ATTR)), "Setting leaked to another widget");
            } finally {
                saved.delete();
            }
            // Exercise the actual inspector and controller, including the
            // selected-widget display and its undo/redo refresh.
            Field prefValue = CogToolPref.class.getDeclaredField("value");
            prefValue.setAccessible(true);
            Object automatic = prefValue.get(CogToolPref.REGENERATE_AUTOMATICALLY);
            prefValue.set(CogToolPref.REGENERATE_AUTOMATICALLY, Boolean.FALSE);
            FrameEditorUI ui = null;
            try {
                UndoManager.getUndoManager(project);
                FrameEditorController controller = new FrameEditorController(savedFrame, savedDesign, project);
                ui = (FrameEditorUI) controller.getUI();
                ui.getSelectionState().setSelectedSelnFig(ui.getFrameUI().getWidgetFigure(savedWidget));
                ui.updateView();
                WidgetPropertiesPane pane = ((FrameEditorView) ui.getView()).getWidgetPropertiesPane();
                Button checkbox = null;
                for (Control control : pane.getChildren()) {
                    if (control instanceof Button && ((Button) control).getText().equals("Infinite Fitts width")) {
                        checkbox = (Button) control;
                    }
                }
                require(checkbox != null && checkbox.isVisible() && checkbox.isEnabled(), "Inspector checkbox missing");
                require(checkbox.getSelection(), "Inspector did not show enabled widget");
                require(!savedDemo.isObsolete(), "Demonstration was already obsolete");
                checkbox.setSelection(false);
                checkbox.notifyListeners(SWT.Selection, new Event());
                require(!Boolean.TRUE.equals(savedWidget.getAttribute(ATTR)), "Inspector did not update widget");
                require(savedDemo.isObsolete(), "Inspector change did not mark prediction obsolete");
                UndoManager manager = UndoManager.getUndoManager(savedFrame, project);
                manager.undo();
                require(Boolean.TRUE.equals(savedWidget.getAttribute(ATTR)) && checkbox.getSelection(), "Inspector did not refresh on undo");
                require(!savedDemo.isObsolete(), "Undo did not restore demonstration state");
                manager.redo();
                require(!Boolean.TRUE.equals(savedWidget.getAttribute(ATTR)) && !checkbox.getSelection(), "Inspector did not refresh on redo");
                ui.getSelectionState().setSelectedSelnFig(ui.getFrameUI().getWidgetFigure(other));
                ui.updateView();
                require(!checkbox.getSelection(), "Inspector showed the prior widget's setting");
            } finally {
                if (ui != null) ui.dispose();
                prefValue.set(CogToolPref.REGENERATE_AUTOMATICALLY, automatic);
            }
            System.out.println("Inspector, per-widget isolation, undo/redo, and save/reload passed");
        } finally {
            display.dispose();
        }
    }
}
