import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.eclipse.swt.widgets.Display;
import edu.cmu.cs.hcii.cogtool.model.*;
import edu.cmu.cs.hcii.cogtool.util.ObjectPersister;

/** Load a project and synchronously recompute every script using its active algorithm. */
public class ProjectPredictions {
    private static String encode(String value) {
        return Base64.getEncoder().encodeToString(value.getBytes(StandardCharsets.UTF_8));
    }

    private static void compute(Project project, AUndertaking task, Set<String> keys) throws Exception {
        if (task.isTaskGroup()) {
            for (AUndertaking child : ((TaskGroup) task).getUndertakings()) {
                compute(project, child, keys);
            }
            return;
        }
        for (Design design : project.getDesigns()) {
            TaskApplication application = project.getTaskApplication(task, design);
            if (application == null) continue;
            Iterator<CognitiveModelGenerator> generators = application.getModelGenerators();
            while (generators.hasNext()) {
                Script script = application.getScript(generators.next());
                if (script == null) continue;
                String key = encode(task.getName()) + " " + encode(design.getName());
                if (!keys.add(key)) {
                    throw new IllegalStateException("Ambiguous task/design or multiple scripts: " +
                                                    task.getName() + " / " + design.getName());
                }
                APredictionResult result = application.determineActiveAlgorithm(project)
                    .prepareComputation(script).compute().completeWork();
                if (result == null || result.getResultState() != APredictionResult.IS_COMPUTED ||
                    !(result instanceof TimePredictionResult)) {
                    throw new IllegalStateException("Prediction failed: " + task.getName() + " / " +
                        design.getName() + ": " + (result == null ? "no result" : result.getErrorLines()));
                }
                double seconds = ((TimePredictionResult) result).getTaskTime();
                if (Double.isNaN(seconds) || Double.isInfinite(seconds) || seconds < 0) {
                    throw new IllegalStateException("Invalid time for " + task.getName() + " / " + design.getName() + ": " + seconds);
                }
                System.out.println("COGTOOL_PREDICTION " + key + " " + seconds);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        Display display = new Display();
        try {
            CogToolSerialization init = CogToolSerialization.ONLY;
            Project project = (Project) ObjectPersister.ONLY.load(new File(args[0]));
            Set<String> keys = new HashSet<String>();
            for (AUndertaking task : project.getUndertakings()) compute(project, task, keys);
            if (keys.isEmpty()) throw new IllegalStateException("Project has no scripts to compute");
        } finally {
            display.dispose();
        }
    }
}
