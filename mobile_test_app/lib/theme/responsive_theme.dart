import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_utils.dart';
import '../utils/app_colors.dart';

class ResponsiveTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
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
        color: AppColors.textPrimary,
        letterSpacing: -0.015,
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getSubheadingFontSize(context),
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: -0.01,
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getSubheadingFontSize(context),
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        letterSpacing: -0.015,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context) + 2,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context),
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
      ),
      labelLarge: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      labelMedium: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context) + 2,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      labelSmall: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getCaptionFontSize(context),
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      ),
    );
  }

  static AppBarTheme _getResponsiveAppBarTheme(BuildContext context) {
    return AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getSubheadingFontSize(context),
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        letterSpacing: -0.015,
      ),
      toolbarHeight: ResponsiveUtils.getAppBarHeight(context),
      iconTheme: IconThemeData(
        color: AppColors.iconPrimary,
        size: ResponsiveUtils.getIconSize(context),
      ),
    );
  }

  static BottomNavigationBarThemeData _getResponsiveBottomNavTheme(BuildContext context) {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBackground,
      selectedItemColor: AppColors.navSelected,
      unselectedItemColor: AppColors.navUnselected,
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
      fillColor: AppColors.inputBackground,
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
        borderSide: BorderSide(
          color: AppColors.inputFocusedBorder,
          width: 2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getHorizontalPadding(context),
        vertical: ResponsiveUtils.getSpacing(context, mobile: 14.0),
      ),
      hintStyle: GoogleFonts.manrope(
        fontSize: ResponsiveUtils.getBodyFontSize(context),
        color: AppColors.inputHint,
      ),
    );
  }
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
