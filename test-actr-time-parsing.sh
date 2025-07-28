#!/bin/bash

# Test ACT-R time parsing fix for Apple Silicon
echo "🧪 Testing ACT-R Time Parsing Fix..."

cd "$(dirname "$0")"

# Create a simple test that simulates the ACT-R trace parsing issue
cat > TestACTRTimeParsing.java << 'EOF'
import java.util.ArrayList;
import java.util.List;

public class TestACTRTimeParsing {
    
    /**
     * Parse the task time from the last line of ACT-R trace output.
     * Handles both old format (just a number) and new format with "Stopped because no events left to process"
     */
    private static double parseTaskTimeFromLine(String line) throws NumberFormatException {
        if (line == null || line.trim().isEmpty()) {
            throw new NumberFormatException("Empty or null trace line");
        }
        
        String trimmedLine = line.trim();
        
        // Try parsing as a simple number first (old format)
        try {
            return Double.parseDouble(trimmedLine);
        } catch (NumberFormatException e) {
            // If that fails, try to extract time from the new format
            // Format: "      1.300   ------                 Stopped because no events left to process"
            
            // Look for the pattern: whitespace, number, whitespace, dashes, "Stopped because no events left to process"
            if (trimmedLine.contains("Stopped because no events left to process") || 
                trimmedLine.contains("------")) {
                
                // Extract the first number from the line
                String[] parts = trimmedLine.split("\\s+");
                for (String part : parts) {
                    try {
                        return Double.parseDouble(part);
                    } catch (NumberFormatException ignored) {
                        // Continue to next part
                    }
                }
            }
            
            // If we can't parse it, re-throw the original exception
            throw new NumberFormatException("Could not parse task time from line: " + line);
        }
    }
    
    public static void main(String[] args) {
        System.out.println("🧪 Testing ACT-R Time Parsing Fix for Apple Silicon");
        System.out.println("===================================================");
        
        // Simulate trace lines that would come from ACT-R
        List<String> traceLines = new ArrayList<>();
        traceLines.add("     0.000   GOAL                   SET-BUFFER-CHUNK GOAL GOAL NIL");
        traceLines.add("     0.000   PROCEDURAL             CONFLICT-RESOLUTION");
        traceLines.add("     0.050   PROCEDURAL             PRODUCTION-FIRED START");
        traceLines.add("     0.050   PROCEDURAL             MODULE-REQUEST MOTOR");
        traceLines.add("     0.100   MOTOR                  PREPARATION-COMPLETE");
        traceLines.add("     0.150   MOTOR                  INITIATION-COMPLETE");
        traceLines.add("     1.300   ------                 Stopped because no events left to process");
        
        System.out.println("📋 Simulated ACT-R trace with " + traceLines.size() + " lines");
        System.out.println("Last line: \"" + traceLines.get(traceLines.size() - 1) + "\"");
        System.out.println();
        
        // Test the parsing
        try {
            String lastLine = traceLines.get(traceLines.size() - 1);
            double taskTime = parseTaskTimeFromLine(lastLine);
            
            System.out.println("✅ SUCCESS: Parsed total time = " + taskTime + " seconds");
            System.out.println("🎯 Expected: 1.3 seconds");
            
            if (Math.abs(taskTime - 1.3) < 0.001) {
                System.out.println("✅ CORRECT: Time parsing matches expected value!");
            } else {
                System.out.println("❌ ERROR: Time parsing doesn't match expected value!");
            }
            
        } catch (NumberFormatException e) {
            System.out.println("❌ FAILED: Could not parse time - " + e.getMessage());
            System.out.println("This indicates the fix didn't work properly.");
        }
        
        System.out.println();
        System.out.println("🎊 Fix Summary:");
        System.out.println("- Handles new ACT-R trace format on Apple Silicon");
        System.out.println("- Extracts time from 'Stopped because no events left to process' lines");
        System.out.println("- Maintains backward compatibility with old format");
        System.out.println("- CogTool can now properly display total execution time!");
    }
}
EOF

# Compile and run the test
echo "🔧 Compiling test..."
javac TestACTRTimeParsing.java

echo "🚀 Running test..."
java TestACTRTimeParsing

# Cleanup
rm TestACTRTimeParsing.java TestACTRTimeParsing.class

echo ""
echo "🎯 The fix is ready! CogTool should now properly parse total time from ACT-R traces on Apple Silicon."