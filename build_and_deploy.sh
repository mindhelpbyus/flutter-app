#!/bin/bash

# Flutter Build and Deploy Script
# This script builds and deploys the Flutter app for multiple platforms

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
APP_NAME="mobile_test_app"
PROJECT_DIR="mobile_test_app"
VERSION="1.0.0+1"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if Flutter is installed
check_flutter() {
    if ! command -v flutter &> /dev/null; then
        print_error "Flutter is not installed or not in PATH"
        exit 1
    fi
    print_success "Flutter found: $(flutter --version | head -n 1)"
}

# Function to clean the project
clean_project() {
    print_status "Cleaning Flutter project..."
    cd "$PROJECT_DIR"
    flutter clean
    print_success "Project cleaned"
}

# Function to get dependencies
get_dependencies() {
    print_status "Getting Flutter dependencies..."
    flutter pub get
    print_success "Dependencies updated"
}

# Function to run tests
run_tests() {
    print_status "Running Flutter tests..."
    if flutter test; then
        print_success "All tests passed"
    else
        print_warning "Some tests failed, but continuing with build..."
    fi
}

# Function to build for Android
build_android() {
    print_status "Building Android APK..."
    flutter build apk --release
    print_success "Android APK built successfully"
    
    print_status "Building Android App Bundle..."
    flutter build appbundle --release
    print_success "Android App Bundle built successfully"
    
    print_status "Android build artifacts:"
    echo "  - APK: build/app/outputs/flutter-apk/app-release.apk"
    echo "  - AAB: build/app/outputs/bundle/release/app-release.aab"
}

# Function to build for iOS
build_ios() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        print_status "Building iOS app..."
        flutter build ios --release --no-codesign
        print_success "iOS app built successfully"
        print_status "iOS build artifacts: build/ios/iphoneos/Runner.app"
    else
        print_warning "iOS build skipped (requires macOS)"
    fi
}

# Function to build for Web
build_web() {
    print_status "Building Web app..."
    flutter build web --release
    print_success "Web app built successfully"
    print_status "Web build artifacts: build/web/"
}

# Function to build for macOS
build_macos() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        print_status "Building macOS app..."
        flutter build macos --release
        print_success "macOS app built successfully"
        print_status "macOS build artifacts: build/macos/Build/Products/Release/"
    else
        print_warning "macOS build skipped (requires macOS)"
    fi
}

# Function to build for Linux
build_linux() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        print_status "Building Linux app..."
        flutter build linux --release
        print_success "Linux app built successfully"
        print_status "Linux build artifacts: build/linux/x64/release/bundle/"
    else
        print_warning "Linux build skipped (requires Linux)"
    fi
}

# Function to build for Windows
build_windows() {
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        print_status "Building Windows app..."
        flutter build windows --release
        print_success "Windows app built successfully"
        print_status "Windows build artifacts: build/windows/runner/Release/"
    else
        print_warning "Windows build skipped (requires Windows)"
    fi
}

# Function to deploy to Firebase Hosting (Web)
deploy_web_firebase() {
    if command -v firebase &> /dev/null; then
        print_status "Deploying to Firebase Hosting..."
        firebase deploy --only hosting
        print_success "Deployed to Firebase Hosting"
    else
        print_warning "Firebase CLI not found. Install with: npm install -g firebase-tools"
        print_status "Manual deployment: Upload build/web/ contents to your web server"
    fi
}

# Function to deploy Android to Play Store (requires manual setup)
deploy_android_playstore() {
    print_status "Android Play Store deployment requires manual upload"
    print_status "Upload build/app/outputs/bundle/release/app-release.aab to Google Play Console"
    print_status "Or use fastlane for automated deployment (requires setup)"
}

# Function to deploy iOS to App Store (requires manual setup)
deploy_ios_appstore() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        print_status "iOS App Store deployment requires Xcode and manual upload"
        print_status "Open ios/Runner.xcworkspace in Xcode and archive for distribution"
        print_status "Or use fastlane for automated deployment (requires setup)"
    else
        print_warning "iOS deployment requires macOS"
    fi
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -p, --platform PLATFORM    Build for specific platform (android|ios|web|macos|linux|windows|all)"
    echo "  -d, --deploy               Deploy after building"
    echo "  -t, --test                 Run tests before building"
    echo "  -c, --clean                Clean project before building"
    echo "  -h, --help                 Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --platform android --deploy"
    echo "  $0 --platform all --test --clean"
    echo "  $0 --platform web --deploy"
}

# Main function
main() {
    local platform="all"
    local deploy=false
    local run_tests_flag=false
    local clean_flag=false
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -p|--platform)
                platform="$2"
                shift 2
                ;;
            -d|--deploy)
                deploy=true
                shift
                ;;
            -t|--test)
                run_tests_flag=true
                shift
                ;;
            -c|--clean)
                clean_flag=true
                shift
                ;;
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
    
    print_status "Starting Flutter build and deploy process..."
    print_status "Platform: $platform"
    print_status "Deploy: $deploy"
    print_status "Run tests: $run_tests_flag"
    print_status "Clean: $clean_flag"
    echo ""
    
    # Check Flutter installation
    check_flutter
    
    # Navigate to project directory
    if [ ! -d "$PROJECT_DIR" ]; then
        print_error "Project directory '$PROJECT_DIR' not found"
        exit 1
    fi
    
    # Clean project if requested
    if [ "$clean_flag" = true ]; then
        clean_project
    fi
    
    # Get dependencies
    get_dependencies
    
    # Run tests if requested
    if [ "$run_tests_flag" = true ]; then
        run_tests
    fi
    
    # Build for specified platform(s)
    case $platform in
        android)
            build_android
            if [ "$deploy" = true ]; then
                deploy_android_playstore
            fi
            ;;
        ios)
            build_ios
            if [ "$deploy" = true ]; then
                deploy_ios_appstore
            fi
            ;;
        web)
            build_web
            if [ "$deploy" = true ]; then
                deploy_web_firebase
            fi
            ;;
        macos)
            build_macos
            ;;
        linux)
            build_linux
            ;;
        windows)
            build_windows
            ;;
        all)
            build_android
            build_ios
            build_web
            build_macos
            build_linux
            build_windows
            if [ "$deploy" = true ]; then
                print_status "Deployment options for all platforms:"
                deploy_android_playstore
                deploy_ios_appstore
                deploy_web_firebase
            fi
            ;;
        *)
            print_error "Invalid platform: $platform"
            print_error "Valid platforms: android, ios, web, macos, linux, windows, all"
            exit 1
            ;;
    esac
    
    cd ..
    print_success "Build and deploy process completed!"
}

# Run main function with all arguments
main "$@"
