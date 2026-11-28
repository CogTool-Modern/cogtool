import java.io.File;
import java.lang.reflect.Proxy;
import java.util.Iterator;
import org.eclipse.swt.widgets.Display;
import edu.cmu.cs.hcii.cogtool.CogToolLID;
import edu.cmu.cs.hcii.cogtool.controller.DemoScriptCmd;
import edu.cmu.cs.hcii.cogtool.controller.DemoStateManager;
import edu.cmu.cs.hcii.cogtool.model.*;
import edu.cmu.cs.hcii.cogtool.ui.Interaction;
import edu.cmu.cs.hcii.cogtool.util.ObjectPersister;

/** Exercises automatic predictions after real edits to the example project. */
public class AutomaticPredictionSmoke {
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void pumpUntil(Display display, TaskApplication ta,
                                  CognitiveModelGenerator gen, IPredictionAlgo alg,
                                  int state) throws Exception {
        long deadline = System.currentTimeMillis() + 60000;
        while (System.currentTimeMillis() < deadline) {
            while (display.readAndDispatch()) { }
            APredictionResult result = ta.getResult(gen, alg);
            if (result != null && result.getResultState() == state) return;
            Thread.sleep(10);
        }
        throw new AssertionError("Timed out waiting for result state " + state);
    }

    public static void main(String[] args) throws Exception {
        Display display = new Display();
        try {
            CogToolSerialization init = CogToolSerialization.ONLY;
            Project project = (Project) ObjectPersister.ONLY.load(new File(args[0]));
            Interaction interaction = (Interaction) Proxy.newProxyInstance(
                Interaction.class.getClassLoader(), new Class<?>[] { Interaction.class },
                (proxy, method, params) -> {
                    throw new AssertionError("Unexpected interaction: " + method.getName());
                });
            Design design = project.getDesigns().iterator().next();
            AUndertaking task = project.getUndertakings().iterator().next();
            TaskApplication ta = project.getTaskApplication(task, design);
            Demonstration demo = ta.getDemonstration();
            CognitiveModelGenerator gen = ta.getModelGenerators().next();
            Script script = ta.getScript(gen);
            IPredictionAlgo alg = ta.determineActiveAlgorithm(project);
            DemoStateManager mgr = DemoStateManager.getStateManager(project, design);
            IWidget target = null;
            Transition transition = null;
            for (Frame frame : design.getFrames()) {
                for (IWidget widget : frame.getWidgets()) {
                    for (int i = 0; i < demo.getStepCount(); i++) {
                        AScriptStep step = demo.getStepAt(i);
                        if (step.usesWidget(widget)) {
                            for (Transition t : widget.getTransitions().values()) {
                                if (step.usesTransition(t)) {
                                    target = widget;
                                    transition = t;
                                    break;
                                }
                            }
                        }
                    }
                    if (target != null) break;
                }
                if (target != null) break;
            }
            require(target != null && transition != null, "No demonstrated transition found");
            APredictionResult initial = alg.prepareComputation(script).compute().completeWork();
            require(initial.getResultState() == APredictionResult.IS_COMPUTED, "Initial prediction failed");
            ta.setResult(gen, alg, initial);

            DemoStateManager.ObsoletingEdit move =
                new DemoStateManager.ObsoletingEdit(CogToolLID.Help, mgr);
            target.moveElement(250, 100);
            mgr.noteWidgetEdit(target, move);
            DemoScriptCmd.regenerateDesignScripts(project, design, interaction);
            require(ta.getResult(gen, alg) == null, "Old result was not cleared");
            // Undo and redo before the debounce expires. The final geometry,
            // not one of the intermediate states, must be computed.
            target.moveElement(-250, -100);
            mgr.noteWidgetEdit(target, move);
            DemoScriptCmd.regenerateDesignScripts(project, design, interaction);
            target.moveElement(250, 100);
            mgr.noteWidgetEdit(target, move);
            DemoScriptCmd.regenerateDesignScripts(project, design, interaction);
            pumpUntil(display, ta, gen, alg, APredictionResult.IS_COMPUTED);
            APredictionResult automatic = ta.getResult(gen, alg);
            APredictionResult expected = alg.prepareComputation(script).compute().completeWork();
            require(Math.abs(((TimePredictionResult) automatic).getTaskTime() -
                             ((TimePredictionResult) expected).getTaskTime()) < 0.001,
                    "Automatic prediction differs from a fresh computation");

            // A second edit starts a worker; invalidate and restore its transition
            // before processing its completion, so the old worker cannot publish.
            DemoStateManager.ObsoletingEdit resize =
                new DemoStateManager.ObsoletingEdit(CogToolLID.Help, mgr);
            target.setWidgetSize(target.getEltBounds().width + 20, target.getEltBounds().height + 20);
            mgr.noteWidgetEdit(target, resize);
            DemoScriptCmd.regenerateDesignScripts(project, design, interaction);
            pumpUntil(display, ta, gen, alg, APredictionResult.COMPUTATION_IN_PROGRESS);
            DemoStateManager.InvalidatingEdit delete =
                new DemoStateManager.InvalidatingEdit(CogToolLID.Help, mgr);
            mgr.noteTransitionEdit(transition, delete);
            require(demo.isInvalid(), "Transition edit did not invalidate demonstration");
            mgr.noteTransitionEdit(transition, delete);
            require(!demo.isInvalid(), "Undo did not restore demonstration validity");
            long deadline = System.currentTimeMillis() + 60000;
            while (ta.getResult(gen, alg) != null && System.currentTimeMillis() < deadline) {
                while (display.readAndDispatch()) { }
                Thread.sleep(10);
            }
            require(ta.getResult(gen, alg) == null, "Stale prediction was published");
            System.out.println("Automatic prediction, resize, and stale-result checks passed");
        } finally {
            display.dispose();
        }
    }
}
