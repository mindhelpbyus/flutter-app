import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  static EdgeInsets getViewInsets(BuildContext context) {
    return MediaQuery.of(context).viewInsets;
  }

  // Responsive padding based on screen size
  static double getHorizontalPadding(BuildContext context) {
    if (isDesktop(context)) return 32.0;
    if (isTablet(context)) return 24.0;
    return 16.0;
  }

  static double getVerticalPadding(BuildContext context) {
    if (isDesktop(context)) return 24.0;
    if (isTablet(context)) return 20.0;
    return 16.0;
  }

  // Responsive font sizes
  static double getHeadingFontSize(BuildContext context) {
    if (isDesktop(context)) return 28.0;
    if (isTablet(context)) return 24.0;
    return 22.0;
  }

  static double getSubheadingFontSize(BuildContext context) {
    if (isDesktop(context)) return 20.0;
    if (isTablet(context)) return 18.0;
    return 16.0;
  }

  static double getBodyFontSize(BuildContext context) {
    if (isDesktop(context)) return 16.0;
    if (isTablet(context)) return 15.0;
    return 14.0;
  }

  static double getCaptionFontSize(BuildContext context) {
    if (isDesktop(context)) return 14.0;
    if (isTablet(context)) return 13.0;
    return 12.0;
  }

  // Responsive card dimensions
  static double getCardWidth(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    if (isDesktop(context)) {
      return (screenWidth - 96) / 3; // 3 cards per row with padding
    }
    if (isTablet(context)) {
      return (screenWidth - 72) / 2; // 2 cards per row with padding
    }
    return screenWidth * 0.4; // Mobile: 40% of screen width
  }

  static double getListItemHeight(BuildContext context) {
    if (isDesktop(context)) return 120.0;
    if (isTablet(context)) return 110.0;
    return 100.0;
  }

  // Responsive grid columns
  static int getGridColumns(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  // Responsive spacing
  static double getSpacing(BuildContext context, {double mobile = 8.0}) {
    if (isDesktop(context)) return mobile * 2;
    if (isTablet(context)) return mobile * 1.5;
    return mobile;
  }

  // Safe area with minimum touch target
  static double getMinTouchTarget() {
    return 48.0; // Material Design minimum touch target
  }

  // Responsive icon sizes
  static double getIconSize(BuildContext context, {double baseSize = 24.0}) {
    if (isDesktop(context)) return baseSize * 1.2;
    if (isTablet(context)) return baseSize * 1.1;
    return baseSize;
  }

  // Responsive border radius
  static double getBorderRadius(BuildContext context, {double baseRadius = 12.0}) {
    if (isDesktop(context)) return baseRadius * 1.2;
    if (isTablet(context)) return baseRadius * 1.1;
    return baseRadius;
  }

  // Get responsive constraints for containers
  static BoxConstraints getContainerConstraints(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    if (isDesktop(context)) {
      return BoxConstraints(
        maxWidth: 1200,
        minHeight: 0,
      );
    }
    return BoxConstraints(
      maxWidth: screenWidth,
      minHeight: 0,
    );
  }

  // Responsive app bar height
  static double getAppBarHeight(BuildContext context) {
    if (isTablet(context) || isDesktop(context)) return 64.0;
    return 56.0;
  }

  // Responsive bottom navigation height
  static double getBottomNavHeight(BuildContext context) {
    if (isTablet(context) || isDesktop(context)) return 72.0;
    return 60.0;
  }
}

// Extension for easier access to responsive utilities
extension ResponsiveContext on BuildContext {
  bool get isMobile => ResponsiveUtils.isMobile(this);
  bool get isTablet => ResponsiveUtils.isTablet(this);
  bool get isDesktop => ResponsiveUtils.isDesktop(this);
  bool get isLandscape => ResponsiveUtils.isLandscape(this);
  bool get isPortrait => ResponsiveUtils.isPortrait(this);
  
  double get screenWidth => ResponsiveUtils.getScreenWidth(this);
  double get screenHeight => ResponsiveUtils.getScreenHeight(this);
  double get horizontalPadding => ResponsiveUtils.getHorizontalPadding(this);
  double get verticalPadding => ResponsiveUtils.getVerticalPadding(this);
  
  double get headingFontSize => ResponsiveUtils.getHeadingFontSize(this);
  double get subheadingFontSize => ResponsiveUtils.getSubheadingFontSize(this);
  double get bodyFontSize => ResponsiveUtils.getBodyFontSize(this);
  double get captionFontSize => ResponsiveUtils.getCaptionFontSize(this);
}
