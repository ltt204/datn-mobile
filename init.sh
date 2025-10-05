#!/bin/bash

set -e

echo "🚀 Initializing Flutter project..."

# Copy config sample if config doesn't exist
echo " "
if [ ! -f "lib/core/config/config.dart" ]; then
  echo "📋 Copying config.dart.sample to config.dart..."
  cp lib/core/config/config.dart.sample lib/core/config/config.dart
else
  echo "⏭️  config.dart already exists, skipping copy..."
fi

# Install Flutter dependencies
echo " "
echo " "
echo "📦 Installing Flutter dependencies..."
echo " "
flutter pub get

# Setup pre-commit hooks
echo " "
echo " "
echo "🔧 Setting up pre-commit hooks..."
echo " "
dart pub global activate flutter_pre_commit
flutter_pre_commit install

# Run build_runner for code generation
echo " "
echo " "
echo "🏗️  Running build_runner..."
echo " "
dart run build_runner build

# Run Slang for translations
echo " "
echo " "
echo "🌍 Running Slang for translations..."
echo " "
dart run slang

echo " "
echo " "
echo "Analyzing project for issues..."
# Analyze the project for issues
echo " "
flutter analyze

echo "✅ Project initialization complete!"
