// Test the ACT-R trace parsing logic with the Apple Silicon output format

public class TestTraceParsing {
    
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
        // Test with the Apple Silicon ACT-R output format
        String testLine = "      1.300   ------                 Stopped because no events left to process";
        
        try {
            double time = parseTaskTimeFromLine(testLine);
            System.out.println("✅ Successfully parsed time: " + time + " seconds");
            System.out.println("Expected: 1.3, Got: " + time);
            
            if (Math.abs(time - 1.3) < 0.001) {
                System.out.println("✅ Time parsing is working correctly!");
            } else {
                System.out.println("❌ Time parsing returned unexpected value");
            }
        } catch (NumberFormatException e) {
            System.out.println("❌ Failed to parse time: " + e.getMessage());
        }
        
        // Test with other formats
        System.out.println("\n🧪 Testing other formats:");
        
        String[] testCases = {
            "1.300",  // Simple number format
            "1.300   ------                 Stopped because no events left to process",  // Without leading spaces
            "   2.500   ------   Stopped because no events left to process   ",  // Different time
            "      0.750   ------                 Stopped because no events left to process",  // Different time
        };
        
        for (String testCase : testCases) {
            try {
                double time = parseTaskTimeFromLine(testCase);
                System.out.println("✅ Parsed '" + testCase.trim() + "' -> " + time);
            } catch (NumberFormatException e) {
                System.out.println("❌ Failed to parse '" + testCase.trim() + "': " + e.getMessage());
            }
        }
    }
}