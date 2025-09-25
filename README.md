# DATN Mobile

A Flutter mobile application project.

## Prerequisites

Before you begin, ensure you have the following installed on your development machine:

### Required Software

- **Flutter SDK**: Version 3.8.0 or higher
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

### 2. Install Dependencies

After cloning the repository, install all required dependencies:

```bash
flutter pub get
```

This command will:
- Download all packages listed in `pubspec.yaml`
- Install both main dependencies and dev dependencies
- Set up the project for development

### 3. Set Up flutter_pre_commit

This project uses `flutter_pre_commit` to ensure code quality and consistency before commits.

#### Install flutter_pre_commit globally:

```bash
dart pub global activate flutter_pre_commit
```

#### Initialize pre-commit hooks:

```bash
flutter_pre_commit install
```

#### Run pre-commit checks manually:

```bash
flutter_pre_commit
```

The pre-commit hook will automatically:
- Format code using `dart format`
- Run static analysis with `flutter analyze`
- Check for linting issues
- Run custom lints (riverpod_lint, custom_lint)

### 4. Code Generation with build_runner

This project uses `build_runner` for code generation (routes, JSON serialization, etc.).

#### Install build_runner globally (recommended):

```bash
dart pub global activate build_runner
```

#### Generate code:

```bash
# One-time generation
flutter packages pub run build_runner build

# Generation with cleanup (removes conflicting outputs)
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch mode (regenerates on file changes)
flutter packages pub run build_runner watch
```

#### Generate translations:

```bash
flutter packages pub run slang
```

### 5. Running the Application

#### Development mode:

```bash
flutter run
```

#### Debug mode with specific device:

```bash
flutter run -d <device_id>
```

#### Release mode:

```bash
flutter run --release
```

### 6. Testing

#### Run all tests:

```bash
flutter test
```

#### Run tests with coverage:

```bash
flutter test --coverage
```

#### Run specific test file:

```bash
flutter test test/path/to/test_file.dart
```

### 7. Code Analysis and Formatting

#### Run static analysis:

```bash
flutter analyze
```

#### Format code:

```bash
dart format .
```

#### Run custom lints:

```bash
# Run all custom lints
flutter packages pub run custom_lint

# Run specific lints
flutter packages pub run custom_lint --packages riverpod_lint
```

### 8. Building for Production

#### Android APK:

```bash
flutter build apk --release
```

#### Android App Bundle:

```bash
flutter build appbundle --release
```

#### iOS (macOS only):

```bash
flutter build ios --release
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

1. **Before starting development**: Run `flutter pub get` and `flutter packages pub run build_runner build`
2. **Before committing**: Ensure `flutter_pre_commit` passes all checks
3. **When adding new models/routes**: Run `flutter packages pub run build_runner build --delete-conflicting-outputs`
4. **When updating translations**: Run `flutter packages pub run slang`

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
2. Run `flutter_pre_commit install` to set up pre-commit hooks
3. Make your changes
4. Run tests and ensure they pass
5. Commit your changes (pre-commit hooks will run automatically)
6. Push and create a pull request

## Troubleshooting

### Common Issues

1. **Build runner conflicts**: Run `flutter packages pub run build_runner clean` then rebuild
2. **Dependency conflicts**: Delete `pubspec.lock` and run `flutter pub get`
3. **Flutter doctor issues**: Run `flutter doctor` to diagnose setup problems
4. **Pre-commit failures**: Run `flutter_pre_commit` manually to see detailed error messages

### Getting Help

- Check the [Flutter documentation](https://flutter.dev/docs)
- Review project-specific architecture documentation in `/architecture`
- Create an issue in the repository for project-specific problems
