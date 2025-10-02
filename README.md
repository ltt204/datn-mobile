# DATN Mobile

A Flutter mobile application project.

## Prerequisites

Before you begin, ensure you have the following installed on your development machine:

### Required Software

- **Flutter SDK**: Version 3.8.0 or higher (latest stable recommended)
  - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
  - Ensure Flutter is added to your PATH

- **Dart SDK**: Comes bundled with Flutter (version 3.8.0+)

- **Android Studio** or **Xcode** (for mobile development):
  - Android Studio for Android development
  - Xcode for iOS development (macOS only)

- **Git**: For version control

### Development Tools

- **Visual Studio Code** (recommended) with Flutter extensions
- **Android Emulator** or **iOS Simulator** for testing
- **Physical device** for testing (optional but recommended)

## Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd datn_mobile
```

### 2. Quick Setup

This project includes a Makefile and initialization script for easy setup.

#### Option A: Using Makefile (Recommended)

```bash
make init
```

This will automatically:
- Copy config sample if needed
- Install Flutter dependencies
- Setup pre-commit hooks
- Run build_runner for code generation
- Run Slang for translations
- Analyze the project

#### Option B: Manual Setup

```bash
# Make init script executable and run it
chmod +x init.sh
./init.sh
```

#### Option C: Step by Step

1. Copy config file (if not exists):
```bash
cp lib/core/config/config.dart.sample lib/core/config/config.dart
```

2. Install dependencies:
```bash
flutter pub get
```

3. Setup pre-commit hooks:
```bash
dart pub global activate flutter_pre_commit
flutter_pre_commit install
```

4. Generate code:
```bash
dart run build_runner build
```

5. Generate translations:
```bash
dart run slang
```

### 3. Running the Application

#### Run with VS Code:
1. Open `main.dart` file.
2. Press `F5` or go to the Run and Debug section and start debugging.
3. Select the target device (if prompted).

#### Using Makefile:

```bash
# Run in debug mode
make run-dev

# Run in release mode
make run-prod
```

#### Using Flutter CLI:

```bash
# Development mode
flutter run

# Debug mode with specific device
flutter run -d <device_id>

# Release mode
flutter run --release
```

### 4. Testing

#### Using Makefile:

```bash
make test
```

#### Using Flutter CLI:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/path/to/test_file.dart
```

### 5. Code Analysis and Formatting

#### Using Makefile:

```bash
# Run static analysis
make analyze

# Format code
make format
```

#### Using Flutter CLI:

```bash
# Run static analysis
flutter analyze

# Format code
dart format .

# Run custom lints
flutter packages pub run custom_lint

# Run specific lints
flutter packages pub run custom_lint --packages riverpod_lint
```

### 6. Building for Production

#### Using Makefile:

```bash
# Build Android APK
make build-apk

# Build iOS app
make build-ios
```

#### Using Flutter CLI:

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release
```

## Makefile Commands

The project includes a Makefile for common tasks:

```bash
make help          # Show all available commands
make init          # Initialize project (run init.sh)
make clean         # Clean build artifacts
make get           # Get Flutter dependencies
make build-runner  # Run build_runner for code generation
make slang         # Run Slang for translations
make analyze       # Analyze code for issues
make format        # Format code
make test          # Run tests
make run-dev       # Run app in debug mode
make run-prod      # Run app in release mode
make build-apk     # Build Android APK
make build-ios     # Build iOS app
make hooks         # Setup pre-commit hooks
```

## Project Structure

```
lib/
├── app/                    # App-level configuration
├── core/                   # Core functionality (config, storage, router, theme)
├── features/               # Feature modules
├── shared/                 # Shared components and utilities
├── i18n/                   # Internationalization files
└── main.dart              # Application entry point
```

## Development Workflow

1. **Before starting development**: Run `make init` or `make get && make build-runner`
2. **Before committing**: Ensure `flutter_pre_commit` passes all checks (runs automatically)
3. **When adding new models/routes**: Run `make build-runner`
4. **When updating translations**: Run `make slang`
5. **Clean build**: Run `make clean` then `make get`

## Continuous Integration

This project includes a GitHub Actions CI workflow that:
- Runs on push/PR to main and develop branches
- Installs Flutter and dependencies
- Generates required code
- Runs analysis, formatting, and lint checks
- Executes all tests with coverage
- Builds the application for Android

## Contributing

1. Ensure all prerequisites are installed
2. Run `make init` to set up the project
3. Make your changes
4. Run `make test` and `make analyze` to ensure they pass
5. Commit your changes (pre-commit hooks will run automatically)
6. Push and create a pull request

## Troubleshooting

### Common Issues

1. **Build runner conflicts**: Run `make clean` then `make build-runner`
2. **Dependency conflicts**: Delete `pubspec.lock` and run `make get`
3. **Flutter doctor issues**: Run `flutter doctor` to diagnose setup problems
4. **Pre-commit failures**: Run `flutter_pre_commit` manually to see detailed error messages
5. **Clean rebuild**: Run `make clean` followed by `make init`

### Getting Help

- Check the [Flutter documentation](https://flutter.dev/docs)
- Review project-specific architecture documentation in `/architecture`
- Create an issue in the repository for project-specific problems
