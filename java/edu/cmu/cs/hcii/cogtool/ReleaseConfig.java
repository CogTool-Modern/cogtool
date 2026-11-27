package edu.cmu.cs.hcii.cogtool;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/** Release metadata shared by the build and the application. */
public final class ReleaseConfig
{
    private static final Properties PROPERTIES = loadProperties();

    public static final String VERSION = getRequired("version");
    public static final String DOCUMENTATION_URL = getRequired("documentation.url");
    public static final String UPDATES_URL = getRequired("updates.url");

    private ReleaseConfig() { }

    private static Properties loadProperties()
    {
        Properties properties = new Properties();
        try (InputStream input = ReleaseConfig.class.getResourceAsStream(
                "/edu/cmu/cs/hcii/cogtool/resources/release.properties")) {
            if (input == null) {
                throw new IllegalStateException("Missing release.properties resource");
            }
            properties.load(input);
        }
        catch (IOException e) {
            throw new IllegalStateException("Could not read release.properties", e);
        }
        return properties;
    }

    private static String getRequired(String key)
    {
        String value = PROPERTIES.getProperty(key);
        if (value == null || value.trim().length() == 0) {
            throw new IllegalStateException("Missing release property: " + key);
        }
        return value.trim();
    }
}
