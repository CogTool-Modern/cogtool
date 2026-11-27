#!/bin/bash
# Usage: JAVA_HOME=/path/to/jdk17-or-newer tests/smoke-arm64-predictions.sh /path/to/CogTool.app
set -eu
ROOT=$(cd "$(dirname "$0")/.." && pwd)
APP=$(cd "$1" && pwd)
JAVAROOT="$APP/Contents/Resources/Java"
TESTDIR=$(mktemp -d "${TMPDIR:-/tmp}/cogtool-prediction-smoke.XXXXXX")
trap 'rm -rf "$TESTDIR"' EXIT
JAVA="${JAVA_HOME:+$JAVA_HOME/bin/}java"
JAVAC="${JAVA_HOME:+$JAVA_HOME/bin/}javac"
CP="$TESTDIR:$JAVAROOT/swt-arm64.jar"
for jar in "$JAVAROOT"/*.jar; do
    case "$jar" in */swt.jar|*/swt-arm64.jar) continue ;; esac
    CP="$CP:$jar"
done
"$JAVAC" -cp "$CP" -d "$TESTDIR" "$ROOT/tests/PredictionSmoke.java"
cd "$APP/Contents/Resources"
"$JAVA" -XstartOnFirstThread -Djava.library.path="$JAVAROOT/dll/arm64" \
    -cp "$CP" PredictionSmoke "$ROOT/docs/examples/phone-number-lookup/N&P93.cgt"
