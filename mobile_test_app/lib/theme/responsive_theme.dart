import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_utils.dart';

class ResponsiveTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF171115)),
      useMaterial3: true,
      textTheme: _getResponsiveTextTheme(context),
      appBarTheme: _getResponsiveAppBarTheme(context),
      bottomNavigationBarTheme: _getResponsiveBottomNavTheme(context),
      cardTheme: _getResponsiveCardTheme(context),
      elevatedButtonTheme: _getResponsiveButtonTheme(context),
      inputDecorationTheme: _getResponsiveInputTheme(context),
    );
  }

  static TextTheme _getResponsiveTextTheme(BuildContext context) {
    return TextTheme(
      headlineLarge: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getHeadingFontSize(context),
        fontWeight: FontWeight.bold,
        color: const Color(0xFF171115),
        letterSpacing: -0.015,
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getSubheadingFontSize(context),
        fontWeight: FontWeight.w600,
        color: const Color(0xFF171115),
        letterSpacing: -0.01,
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getSubheadingFontSize(context),
        fontWeight: FontWeight.bold,
        color: const Color(0xFF171115),
        letterSpacing: -0.015,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context) + 2,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF171115),
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        fontWeight: FontWeight.normal,
        color: const Color(0xFF171115),
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        fontWeight: FontWeight.normal,
        color: const Color(0xFF87647B),
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context),
        fontWeight: FontWeight.normal,
        color: const Color(0xFF87647B),
      ),
      labelLarge: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF171115),
      ),
      labelMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context) + 2,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF171115),
      ),
      labelSmall: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF87647B),
      ),
    );
  }

  static AppBarTheme _getResponsiveAppBarTheme(BuildContext context) {
    return AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF171115),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getSubheadingFontSize(context),
        fontWeight: FontWeight.bold,
        color: const Color(0xFF171115),
        letterSpacing: -0.015,
      ),
      toolbarHeight: ResponsiveUtils.getAppBarHeight(context),
      iconTheme: IconThemeData(
        color: const Color(0xFF171115),
        size: ResponsiveUtils.getIconSize(context),
      ),
    );
  }

  static BottomNavigationBarThemeData _getResponsiveBottomNavTheme(BuildContext context) {
    return BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF171115),
      unselectedItemColor: const Color(0xFF87647B),
      selectedLabelStyle: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.015,
      ),
      unselectedLabelStyle: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.015,
      ),
      type: BottomNavigationBarType.fixed,
    );
  }

  static CardThemeData _getResponsiveCardTheme(BuildContext context) {
    return CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context),
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getHorizontalPadding(context),
        vertical: ResponsiveUtils.getSpacing(context, mobile: 8.0),
      ),
    );
  }

  static ElevatedButtonThemeData _getResponsiveButtonTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          ResponsiveUtils.getMinTouchTarget(),
          ResponsiveUtils.getMinTouchTarget(),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getHorizontalPadding(context),
          vertical: ResponsiveUtils.getSpacing(context, mobile: 12.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ResponsiveUtils.getBorderRadius(context),
          ),
        ),
        textStyle: GoogleFonts.manrope(
          fontSize: ResponsiveUtils.getBodyFontSize(context),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static InputDecorationTheme _getResponsiveInputTheme(BuildContext context) {
    return InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF4F0F3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context),
        ),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context),
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context),
        ),
        borderSide: const BorderSide(
          color: Color(0xFF171115),
          width: 2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getHorizontalPadding(context),
        vertical: ResponsiveUtils.getSpacing(context, mobile: 14.0),
      ),
      hintStyle: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        color: const Color(0xFF87647B),
      ),
    );
  }
}

// Color constants for consistent theming
class AppColors {
  static const Color primary = Color(0xFF171115);
  static const Color secondary = Color(0xFF87647B);
  static const Color accent = Color(0xFFE64CB3);
  static const Color background = Colors.white;
  static const Color surface = Color(0xFFF4F0F3);
  static const Color border = Color(0xFFF1F4F0);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  
  // Gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFF171115),
    Color(0xFF2A1F2D),
  ];
  
  static const List<Color> accentGradient = [
    Color(0xFFE64CB3),
    Color(0xFFFF6B9D),
  ];
}

// Spacing constants
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

// Responsive spacing helper
class ResponsiveSpacing {
  static double xs(BuildContext context) => ResponsiveUtils.getSpacing(context, mobile: AppSpacing.xs);
  static double sm(BuildContext context) => ResponsiveUtils.getSpacing(context, mobile: AppSpacing.sm);
  static double md(BuildContext context) => ResponsiveUtils.getSpacing(context, mobile: AppSpacing.md);
  static double lg(BuildContext context) => ResponsiveUtils.getSpacing(context, mobile: AppSpacing.lg);
  static double xl(BuildContext context) => ResponsiveUtils.getSpacing(context, mobile: AppSpacing.xl);
  static double xxl(BuildContext context) => ResponsiveUtils.getSpacing(context, mobile: AppSpacing.xxl);
}
