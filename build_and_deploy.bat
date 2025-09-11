@echo off
REM Flutter Build and Deploy Script for Windows
REM This script builds and deploys the Flutter app for multiple platforms

setlocal enabledelayedexpansion

REM Configuration
set APP_NAME=mobile_test_app
set PROJECT_DIR=mobile_test_app
set VERSION=1.0.0+1

REM Default values
set PLATFORM=all
set DEPLOY=false
set RUN_TESTS=false
set CLEAN=false

REM Parse command line arguments
:parse_args
if "%~1"=="" goto end_parse
if "%~1"=="-p" (
    set PLATFORM=%~2
    shift
    shift
    goto parse_args
)
if "%~1"=="--platform" (
    set PLATFORM=%~2
    shift
    shift
    goto parse_args
)
if "%~1"=="-d" (
    set DEPLOY=true
    shift
    goto parse_args
)
if "%~1"=="--deploy" (
    set DEPLOY=true
    shift
    goto parse_args
)
if "%~1"=="-t" (
    set RUN_TESTS=true
    shift
    goto parse_args
)
if "%~1"=="--test" (
    set RUN_TESTS=true
    shift
    goto parse_args
)
if "%~1"=="-c" (
    set CLEAN=true
    shift
    goto parse_args
)
if "%~1"=="--clean" (
    set CLEAN=true
    shift
    goto parse_args
)
if "%~1"=="-h" (
    goto show_usage
)
if "%~1"=="--help" (
    goto show_usage
)
echo [ERROR] Unknown option: %~1
goto show_usage

:end_parse

echo [INFO] Starting Flutter build and deploy process...
echo [INFO] Platform: %PLATFORM%
echo [INFO] Deploy: %DEPLOY%
echo [INFO] Run tests: %RUN_TESTS%
echo [INFO] Clean: %CLEAN%
echo.

REM Check Flutter installation
flutter --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Flutter is not installed or not in PATH
    exit /b 1
)
echo [SUCCESS] Flutter found

REM Navigate to project directory
if not exist "%PROJECT_DIR%" (
    echo [ERROR] Project directory '%PROJECT_DIR%' not found
    exit /b 1
)

cd "%PROJECT_DIR%"

REM Clean project if requested
if "%CLEAN%"=="true" (
    echo [INFO] Cleaning Flutter project...
    flutter clean
    if errorlevel 1 (
        echo [ERROR] Failed to clean project
        exit /b 1
    )
    echo [SUCCESS] Project cleaned
)

REM Get dependencies
echo [INFO] Getting Flutter dependencies...
flutter pub get
if errorlevel 1 (
    echo [ERROR] Failed to get dependencies
    exit /b 1
)
echo [SUCCESS] Dependencies updated

REM Run tests if requested
if "%RUN_TESTS%"=="true" (
    echo [INFO] Running Flutter tests...
    flutter test
    if errorlevel 1 (
        echo [WARNING] Some tests failed, but continuing with build...
    ) else (
        echo [SUCCESS] All tests passed
    )
)

REM Build for specified platform(s)
if "%PLATFORM%"=="android" goto build_android
if "%PLATFORM%"=="ios" goto build_ios
if "%PLATFORM%"=="web" goto build_web
if "%PLATFORM%"=="macos" goto build_macos
if "%PLATFORM%"=="linux" goto build_linux
if "%PLATFORM%"=="windows" goto build_windows
if "%PLATFORM%"=="all" goto build_all

echo [ERROR] Invalid platform: %PLATFORM%
echo [ERROR] Valid platforms: android, ios, web, macos, linux, windows, all
exit /b 1

:build_android
echo [INFO] Building Android APK...
flutter build apk --release
if errorlevel 1 (
    echo [ERROR] Failed to build Android APK
    exit /b 1
)
echo [SUCCESS] Android APK built successfully

echo [INFO] Building Android App Bundle...
flutter build appbundle --release
if errorlevel 1 (
    echo [ERROR] Failed to build Android App Bundle
    exit /b 1
)
echo [SUCCESS] Android App Bundle built successfully

echo [INFO] Android build artifacts:
echo   - APK: build\app\outputs\flutter-apk\app-release.apk
echo   - AAB: build\app\outputs\bundle\release\app-release.aab

if "%DEPLOY%"=="true" (
    echo [INFO] Android Play Store deployment requires manual upload
    echo [INFO] Upload build\app\outputs\bundle\release\app-release.aab to Google Play Console
)
goto end_build

:build_ios
echo [WARNING] iOS build requires macOS
if "%DEPLOY%"=="true" (
    echo [INFO] iOS App Store deployment requires Xcode and manual upload
)
goto end_build

:build_web
echo [INFO] Building Web app...
flutter build web --release
if errorlevel 1 (
    echo [ERROR] Failed to build Web app
    exit /b 1
)
echo [SUCCESS] Web app built successfully
echo [INFO] Web build artifacts: build\web\

if "%DEPLOY%"=="true" (
    where firebase >nul 2>&1
    if errorlevel 1 (
        echo [WARNING] Firebase CLI not found. Install with: npm install -g firebase-tools
        echo [INFO] Manual deployment: Upload build\web\ contents to your web server
    ) else (
        echo [INFO] Deploying to Firebase Hosting...
        firebase deploy --only hosting
        echo [SUCCESS] Deployed to Firebase Hosting
    )
)
goto end_build

:build_macos
echo [WARNING] macOS build requires macOS
goto end_build

:build_linux
echo [WARNING] Linux build requires Linux
goto end_build

:build_windows
echo [INFO] Building Windows app...
flutter build windows --release
if errorlevel 1 (
    echo [ERROR] Failed to build Windows app
    exit /b 1
)
echo [SUCCESS] Windows app built successfully
echo [INFO] Windows build artifacts: build\windows\runner\Release\
goto end_build

:build_all
call :build_android
call :build_web
call :build_windows
if "%DEPLOY%"=="true" (
    echo [INFO] Deployment options for all platforms:
    echo [INFO] Android Play Store deployment requires manual upload
    echo [INFO] Upload build\app\outputs\bundle\release\app-release.aab to Google Play Console
    where firebase >nul 2>&1
    if errorlevel 1 (
        echo [WARNING] Firebase CLI not found for web deployment
    ) else (
        echo [INFO] Deploying web to Firebase Hosting...
        firebase deploy --only hosting
    )
)
goto end_build

:end_build
cd ..
echo [SUCCESS] Build and deploy process completed!
exit /b 0

:show_usage
echo Usage: %0 [OPTIONS]
echo.
echo Options:
echo   -p, --platform PLATFORM    Build for specific platform (android^|ios^|web^|macos^|linux^|windows^|all)
echo   -d, --deploy               Deploy after building
echo   -t, --test                 Run tests before building
echo   -c, --clean                Clean project before building
echo   -h, --help                 Show this help message
echo.
echo Examples:
echo   %0 --platform android --deploy
echo   %0 --platform all --test --clean
echo   %0 --platform web --deploy
exit /b 0
