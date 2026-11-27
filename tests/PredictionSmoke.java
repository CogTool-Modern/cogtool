import java.io.File;
import java.util.Iterator;
import org.eclipse.swt.widgets.Display;
import edu.cmu.cs.hcii.cogtool.model.*;
import edu.cmu.cs.hcii.cogtool.util.ObjectPersister;

/** Recomputes the four published phone-number example predictions. */
public class PredictionSmoke {
    public static void main(String[] args) throws Exception {
        Display display = new Display();
        try {
            CogToolSerialization init = CogToolSerialization.ONLY;
            Project project = (Project) ObjectPersister.ONLY.load(new File(args[0]));
            int computed = 0;
            for (AUndertaking task : project.getUndertakings()) {
                for (Design design : project.getDesigns()) {
                    TaskApplication ta = project.getTaskApplication(task, design);
                    if (ta == null) continue;
                    Iterator<CognitiveModelGenerator> generators = ta.getModelGenerators();
                    while (generators.hasNext()) {
                        Script script = ta.getScript(generators.next());
                        APredictionResult result = ta.determineActiveAlgorithm(project)
                            .prepareComputation(script).compute().completeWork();
                        if (result.getResultState() != APredictionResult.IS_COMPUTED ||
                            !(result instanceof TimePredictionResult)) {
                            throw new AssertionError("Prediction failed: " + result.getErrorLines());
                        }
                        double seconds = ((TimePredictionResult) result).getTaskTime();
                        double expected;
                        if (task.getName().equals("Look up one number")) {
                            expected = design.getName().equals("Pop-Up") ? 2.645 : 13.099;
                        } else if (task.getName().equals("Look up two numbers")) {
                            expected = design.getName().equals("Pop-Up") ? 4.912 : 20.943;
                        } else {
                            throw new AssertionError("Unexpected task: " + task.getName());
                        }
                        if (Math.abs(seconds - expected) > 0.05) {
                            throw new AssertionError(task.getName() + " / " + design.getName() +
                                                     ": expected " + expected + ", got " + seconds);
                        }
                        System.out.println(task.getName() + " / " + design.getName() + ": " + seconds + " seconds");
                        computed++;
                    }
                }
            }
            if (computed != 4) throw new AssertionError("Expected 4 predictions, got " + computed);
        } finally {
            display.dispose();
        }
    }
}
