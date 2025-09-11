# Flutter Build and Deploy Scripts

This repository contains comprehensive build and deploy scripts for the Flutter mobile test app that support multiple platforms and deployment options.

## Files Created

- `build_and_deploy.sh` - Unix/Linux/macOS shell script
- `build_and_deploy.bat` - Windows batch script
- `README_BUILD_DEPLOY.md` - This documentation file

## Prerequisites

### Required Software
- Flutter SDK (3.35.3 or later)
- Platform-specific development tools:
  - **Android**: Android Studio, Android SDK
  - **iOS**: Xcode (macOS only), CocoaPods
  - **Web**: Chrome browser
  - **Windows**: Visual Studio with C++ tools
  - **Linux**: Linux development libraries
  - **macOS**: Xcode (macOS only)

### Optional Deployment Tools
- Firebase CLI (`npm install -g firebase-tools`) for web deployment
- Fastlane for automated app store deployments

## Usage

### Unix/Linux/macOS

```bash
# Make script executable (first time only)
chmod +x build_and_deploy.sh

# Show help
./build_and_deploy.sh --help

# Build for specific platform
./build_and_deploy.sh --platform android
./build_and_deploy.sh --platform web
./build_and_deploy.sh --platform ios

# Build all platforms
./build_and_deploy.sh --platform all

# Build with additional options
./build_and_deploy.sh --platform android --clean --test
./build_and_deploy.sh --platform web --deploy
./build_and_deploy.sh --platform all --clean --test --deploy
```

### Windows

```cmd
# Show help
build_and_deploy.bat --help

# Build for specific platform
build_and_deploy.bat --platform android
build_and_deploy.bat --platform web
build_and_deploy.bat --platform windows

# Build all platforms
build_and_deploy.bat --platform all

# Build with additional options
build_and_deploy.bat --platform android --clean --test
build_and_deploy.bat --platform web --deploy
build_and_deploy.bat --platform all --clean --test --deploy
```

## Command Line Options

| Option | Description |
|--------|-------------|
| `-p, --platform PLATFORM` | Build for specific platform: `android`, `ios`, `web`, `macos`, `linux`, `windows`, or `all` |
| `-d, --deploy` | Deploy after building (where supported) |
| `-t, --test` | Run Flutter tests before building |
| `-c, --clean` | Clean project before building |
| `-h, --help` | Show help message |

## Platform Support

### Android
- **Builds**: APK and App Bundle (AAB)
- **Output**: 
  - `build/app/outputs/flutter-apk/app-release.apk`
  - `build/app/outputs/bundle/release/app-release.aab`
- **Deployment**: Manual upload to Google Play Console

### iOS
- **Builds**: iOS app (requires macOS)
- **Output**: `build/ios/iphoneos/Runner.app`
- **Deployment**: Manual upload via Xcode or App Store Connect

### Web
- **Builds**: Web application
- **Output**: `build/web/`
- **Deployment**: Automatic via Firebase Hosting (if Firebase CLI installed)

### Desktop Platforms
- **macOS**: `build/macos/Build/Products/Release/` (macOS only)
- **Linux**: `build/linux/x64/release/bundle/` (Linux only)
- **Windows**: `build/windows/runner/Release/` (Windows only)

## Deployment Options

### Web Deployment (Firebase Hosting)
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Initialize Firebase in your project: `firebase init hosting`
3. Run script with deploy flag: `./build_and_deploy.sh --platform web --deploy`

### Android Deployment (Google Play Store)
1. Build AAB: `./build_and_deploy.sh --platform android`
2. Upload `build/app/outputs/bundle/release/app-release.aab` to Google Play Console
3. Or set up Fastlane for automated deployment

### iOS Deployment (App Store)
1. Build iOS app: `./build_and_deploy.sh --platform ios`
2. Open `ios/Runner.xcworkspace` in Xcode
3. Archive and upload to App Store Connect
4. Or set up Fastlane for automated deployment

## Examples

### Quick Development Build
```bash
# Build for web with clean and test
./build_and_deploy.sh --platform web --clean --test
```

### Production Release
```bash
# Build all platforms with clean, test, and deploy
./build_and_deploy.sh --platform all --clean --test --deploy
```

### Android-only Release
```bash
# Build and prepare Android for Play Store
./build_and_deploy.sh --platform android --clean --test
```

## Troubleshooting

### Common Issues

1. **Flutter not found**: Ensure Flutter is installed and in your PATH
2. **Platform build fails**: Check that platform-specific tools are installed
3. **Permission denied**: Make sure script is executable (`chmod +x build_and_deploy.sh`)
4. **Firebase deployment fails**: Install Firebase CLI and initialize project

### Platform-Specific Issues

- **Android**: Ensure Android SDK and build tools are installed
- **iOS**: Requires macOS with Xcode installed
- **Web**: Requires Chrome browser for testing
- **Windows**: Requires Visual Studio with C++ build tools

## Script Features

- ✅ Cross-platform support (Unix/Linux/macOS and Windows)
- ✅ Multiple platform builds (Android, iOS, Web, Desktop)
- ✅ Automated dependency management
- ✅ Optional testing integration
- ✅ Clean build support
- ✅ Deployment automation (where supported)
- ✅ Colored output for better readability
- ✅ Error handling and validation
- ✅ Comprehensive help documentation

## Configuration

The scripts are pre-configured for the `mobile_test_app` project. To use with a different project:

1. Edit the `PROJECT_DIR` variable in the script
2. Update the `APP_NAME` variable if needed
3. Modify version information in the `VERSION` variable

## Contributing

To improve these scripts:

1. Test on your target platforms
2. Add new deployment targets as needed
3. Enhance error handling for edge cases
4. Add support for additional Flutter build options

## License

These scripts are provided as-is for the Flutter mobile test app project.
