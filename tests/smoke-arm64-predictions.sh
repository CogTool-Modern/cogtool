#!/bin/bash
# Usage: JAVA_HOME=/path/to/java-runtime tests/smoke-arm64-predictions.sh /path/to/CogTool.app
set -eu
ROOT=$(cd "$(dirname "$0")/.." && pwd)
APP=$(cd "$1" && pwd)
JAVAROOT="$APP/Contents/Resources/Java"
JAVA="${JAVA_HOME:+$JAVA_HOME/bin/}java"
HELPER="$APP/Contents/Resources/cogtool-prediction-tests.jar"
if [[ ! -f "$HELPER" ]]; then
    echo "Prediction helpers not found; rebuild the app with ant package-without-help." >&2
    exit 1
fi
CP="$HELPER:$JAVAROOT/swt-arm64.jar"
for jar in "$JAVAROOT"/*.jar; do
    case "$jar" in */swt.jar|*/swt-arm64.jar) continue ;; esac
    CP="$CP:$jar"
done
cd "$APP/Contents/Resources"
"$JAVA" -XstartOnFirstThread -Djava.library.path="$JAVAROOT/dll/arm64" \
    -cp "$CP" PredictionSmoke "$ROOT/docs/examples/phone-number-lookup/N&P93.cgt"
"$JAVA" -XstartOnFirstThread -Djava.library.path="$JAVAROOT/dll/arm64" \
    -cp "$CP" AutomaticPredictionSmoke "$ROOT/docs/examples/phone-number-lookup/N&P93.cgt"
"$JAVA" -XstartOnFirstThread -Djava.library.path="$JAVAROOT/dll/arm64" \
    -cp "$CP" edu.cmu.cs.hcii.cogtool.model.MagicEdgesSmoke "$ROOT/docs/examples/phone-number-lookup/N&P93.cgt"
