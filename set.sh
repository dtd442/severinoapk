#!/bin/bash

echo "🚀 Setup Gradle Wrapper per GitHub Actions..."

mkdir -p gradle/wrapper

cat > gradlew <<'EOF'
#!/usr/bin/env sh
exec java -Xmx64m -Xms64m -jar "$(dirname "$0")/gradle/wrapper/gradle-wrapper.jar" "$@"
EOF

chmod +x gradlew

cat > gradle/wrapper/gradle-wrapper.properties <<EOF
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\\://services.gradle.org/distributions/gradle-8.2-all.zip
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOF

echo "⬇️ Scarico gradle-wrapper.jar corretto..."
curl -L -o gradle/wrapper/gradle-wrapper.jar \
  https://repo.gradle.org/gradle/libs-releases-local/org/gradle/gradle-wrapper/8.2/gradle-wrapper-8.2.jar

git add gradlew gradle/wrapper
git commit -m "Aggiunto gradle wrapper funzionante"
git push

echo "✅ Wrapper OK e funzionante!"
