import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ovi_landing_page.dart';
import '../explore_page.dart';
import '../user_profile_page.dart';
import '../utils/responsive_utils.dart';
import '../theme/responsive_theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablet || context.isDesktop;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        boxShadow: isTablet ? [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ] : null,
      ),
      child: SafeArea(
        top: false,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.isDesktop ? 1200 : double.infinity,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.horizontalPadding,
                  vertical: ResponsiveSpacing.sm(context),
                ),
                child: context.isLandscape && context.isMobile
                    ? _buildCompactNavigation(context)
                    : _buildStandardNavigation(context),
              ),
              // Add extra padding for devices without home indicator
              if (bottomPadding == 0)
                SizedBox(height: ResponsiveSpacing.md(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStandardNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(context, Icons.home, 'Home', 0),
        _buildNavItem(context, Icons.calendar_today_outlined, 'My Visits', 1),
        _buildNavItem(context, Icons.people_outline, 'Explore', 2),
        _buildNavItem(context, Icons.forum_outlined, 'Chat', 3),
        _buildNavItem(context, Icons.person, 'Profile', 4),
      ],
    );
  }

  Widget _buildCompactNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCompactNavItem(context, Icons.home, 0),
        _buildCompactNavItem(context, Icons.calendar_today_outlined, 1),
        _buildCompactNavItem(context, Icons.people_outline, 2),
        _buildCompactNavItem(context, Icons.forum_outlined, 3),
        _buildCompactNavItem(context, Icons.person, 4),
      ],
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    final isSelected = selectedIndex == index;
    final iconSize = ResponsiveUtils.getIconSize(context);
    final minTouchTarget = ResponsiveUtils.getMinTouchTarget();

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!(index);
            } else {
              _handleNavigation(context, index);
            }
          },
          borderRadius: BorderRadius.circular(
            ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: minTouchTarget,
              minWidth: minTouchTarget,
            ),
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveSpacing.sm(context),
              horizontal: ResponsiveSpacing.xs(context),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: iconSize + 8,
                  width: iconSize + 8,
                  alignment: Alignment.center,
                  child: Icon(
                    isSelected && icon == Icons.home ? Icons.home : icon,
                    color: isSelected ? AppColors.primary : AppColors.secondary,
                    size: iconSize,
                  ),
                ),
                SizedBox(height: ResponsiveSpacing.xs(context)),
                Text(
                  label,
                  style: GoogleFonts.manrope(
                    fontSize: context.captionFontSize,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.primary : AppColors.secondary,
                    letterSpacing: 0.015,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactNavItem(
    BuildContext context,
    IconData icon,
    int index,
  ) {
    final isSelected = selectedIndex == index;
    final iconSize = ResponsiveUtils.getIconSize(context, baseSize: 20.0);
    final minTouchTarget = ResponsiveUtils.getMinTouchTarget();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(index);
          } else {
            _handleNavigation(context, index);
          }
        },
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            minHeight: minTouchTarget * 0.8, // Slightly smaller for landscape
            minWidth: minTouchTarget * 0.8,
          ),
          padding: EdgeInsets.all(ResponsiveSpacing.sm(context)),
          child: Icon(
            isSelected && icon == Icons.home ? Icons.home : icon,
            color: isSelected ? AppColors.primary : AppColors.secondary,
            size: iconSize,
          ),
        ),
      ),
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0: // Home tab
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OviLandingPage()),
          (route) => false,
        );
        break;
      case 1: // Appointments tab
        // TODO: Navigate to appointments page when implemented
        break;
      case 2: // Explore tab
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ExplorePage()),
        );
        break;
      case 3: // Chat tab
        // TODO: Navigate to chat page when implemented
        break;
      case 4: // Profile tab
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserProfilePage()),
        );
        break;
    }
  }
}
