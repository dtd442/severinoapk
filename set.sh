#!/bin/bash

echo "🚀 Setup Gradle Wrapper per GitHub Actions..."

# 1. Crea cartella wrapper
mkdir -p gradle/wrapper

# 2. Crea gradlew
cat > gradlew <<'EOF'
#!/usr/bin/env sh
exec java -Xmx64m -Xms64m -jar "$(dirname "$0")/gradle/wrapper/gradle-wrapper.jar" "$@"
EOF

chmod +x gradlew

# 3. Crea gradle-wrapper.properties
cat > gradle/wrapper/gradle-wrapper.properties <<EOF
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\\://services.gradle.org/distributions/gradle-8.2-all.zip
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOF

# 4. Scarica gradle-wrapper.jar
echo "⬇️ Scarico gradle-wrapper.jar..."
curl -L -o gradle/wrapper/gradle-wrapper.jar \
  https://github.com/gradle/gradle-wrapper/raw/master/gradle-wrapper.jar

# 5. Aggiungi a git
git add gradlew gradle/wrapper
git commit -m "Aggiunto gradle wrapper per GitHub Actions"
git push

echo "✅ Gradle wrapper pronto per GitHub Actions!"
