import 'package:flutter/material.dart';

/// Centralized color utility for consistent theming across the app
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF171115);
  static const Color primaryDark = Color(0xFF131711);
  static const Color primaryLight = Color(0xFF2A1F2D);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF87647B);
  static const Color secondaryLight = Color(0xFF6C8764);
  
  // Accent Colors
  static const Color accent = Color(0xFFE64CB3);
  static const Color accentLight = Color(0xFFFF6B9D);
  
  // Background Colors
  static const Color background = Colors.white;
  static const Color backgroundSecondary = Color(0xFFF4F0F3);
  static const Color backgroundTertiary = Color(0xFFF1F4F0);
  
  // Surface Colors
  static const Color surface = Color(0xFFF4F0F3);
  static const Color surfaceLight = Colors.white;
  
  // Border Colors
  static const Color border = Color(0xFFF1F4F0);
  static const Color borderLight = Color(0xFFF4F0F3);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF171115);
  static const Color textSecondary = Color(0xFF87647B);
  static const Color textTertiary = Color(0xFF6C8764);
  static const Color textOnAccent = Colors.white;
  static const Color textOnPrimary = Colors.white;
  
  // Icon Colors
  static const Color iconPrimary = Color(0xFF171115);
  static const Color iconSecondary = Color(0xFF87647B);
  static const Color iconTertiary = Color(0xFF6C8764);
  static const Color iconOnAccent = Colors.white;
  
  // Button Colors
  static const Color buttonPrimary = Color(0xFF171115);
  static const Color buttonSecondary = Color(0xFF87647B);
  static const Color buttonAccent = Color(0xFFE64CB3);
  static const Color buttonSurface = Color(0xFFF4F0F3);
  static const Color buttonDisabled = Color(0xFFE0E0E0);
  
  // Pill/Chip Colors
  static const Color pillBackground = Color(0xFFF4F0F3);
  static const Color pillBackgroundSelected = Color(0xFFE64CB3);
  static const Color pillBorder = Color(0xFFF1F4F0);
  static const Color pillBorderSelected = Color(0xFFE64CB3);
  static const Color pillText = Color(0xFF171115);
  static const Color pillTextSelected = Colors.white;
  
  // Card Colors
  static const Color cardBackground = Colors.white;
  static const Color cardSurface = Color(0xFFF4F0F3);
  static const Color cardBorder = Color(0xFFF1F4F0);
  
  // Input Colors
  static const Color inputBackground = Color(0xFFF4F0F3);
  static const Color inputBorder = Color(0xFFF1F4F0);
  static const Color inputFocusedBorder = Color(0xFF171115);
  static const Color inputText = Color(0xFF171115);
  static const Color inputHint = Color(0xFF87647B);
  
  // Navigation Colors
  static const Color navBackground = Colors.white;
  static const Color navBorder = Color(0xFFF1F4F0);
  static const Color navSelected = Color(0xFF171115);
  static const Color navUnselected = Color(0xFF87647B);
  
  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF171115),
    Color(0xFF2A1F2D),
  ];
  
  static const List<Color> accentGradient = [
    Color(0xFFE64CB3),
    Color(0xFFFF6B9D),
  ];
  
  static const List<Color> backgroundGradient = [
    Colors.white,
    Color(0xFFF4F0F3),
  ];
  
  // Shadow Colors
  static Color shadowLight = Colors.black.withOpacity(0.05);
  static Color shadowMedium = Colors.black.withOpacity(0.1);
  static Color shadowDark = Colors.black.withOpacity(0.2);
  
  // Overlay Colors
  static Color overlayLight = Colors.black.withOpacity(0.3);
  static Color overlayMedium = Colors.black.withOpacity(0.5);
  static Color overlayDark = Colors.black.withOpacity(0.7);
  
  // System UI Colors
  static const Color systemStatusBar = Colors.transparent;
  static const Color systemNavigationBar = Colors.white;
  
  // Material Colors (for Material widgets)
  static const Color materialTransparent = Colors.transparent;
  
  // Additional colors found in codebase that need centralization
  static const Color blueAccent = Color(0xFF3B82F6); // Used in getting_started_page
  static const Color grayText = Color(0xFF374151); // Used in getting_started_page
  static const Color lightBorder = Color(0xFFE2E8F0); // Used in getting_started_page
  static const Color starRating = Color(0xFFFFC107); // Used for star ratings (replaces Colors.amber)
  
  // Mockup specific colors
  static const Color vevaleHeaderText = Color(0xFF3A3A41); // Header text color from mockup
  static const Color searchBackground = Color(0xFFF6F6FE); // Search bar background from mockup
  static const Color searchBorder = Color(0xFF6B6EAB); // Search bar border from mockup
  static const Color fabBlue = Color(0xFF4F46E5); // FAB button color from mockup
  static const Color warmBackground = Color(0xFFFDF6E3); // Warm background gradient start
  static const Color warmBackgroundEnd = Color(0xFFF7E6D3); // Warm background gradient end
  
  // Utility methods for color variations
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
  
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
  
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}

/// Extension for easy access to color variations
extension AppColorsExtension on Color {
  Color get withLightOpacity => AppColors.withOpacity(this, 0.1);
  Color get withMediumOpacity => AppColors.withOpacity(this, 0.3);
  Color get withHeavyOpacity => AppColors.withOpacity(this, 0.7);
  
  Color lighten([double amount = 0.1]) => AppColors.lighten(this, amount);
  Color darken([double amount = 0.1]) => AppColors.darken(this, amount);
}
