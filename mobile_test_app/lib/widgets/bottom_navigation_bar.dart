import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ovi_landing_page.dart';
import '../my_visits_page.dart';
import '../explore_page.dart';
import '../user_profile_page.dart';
import '../utils/responsive_utils.dart';
import '../utils/app_colors.dart';
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
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main navigation bar container with notch for bulge effect
        ClipPath(
          clipper: BottomNavClipper(),
          child: Container(
            width: double.infinity,
            height: 111.75,
            decoration: BoxDecoration(
              color: AppColors.navBackground,
              border: Border.all(
                color: const Color(0xFFE5E5E5),
                width: 2.0,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.90),
                topRight: Radius.circular(15.90),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: context.isDesktop ? 1200 : double.infinity,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.horizontalPadding,
                    vertical: ResponsiveSpacing.md(context),
                  ),
                  child: context.isLandscape && context.isMobile
                      ? _buildCompactNavigation(context)
                      : _buildStandardNavigation(context),
                ),
              ),
            ),
          ),
        ),
        // Circular container with FAB centered - creating bulge effect
        Positioned(
          left: 0,
          right: 0,
          bottom: 73.875, // Position so exactly half the circle (35.78px) is above the nav bar top edge
          child: Center(
            child: Material(
              color: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              type: MaterialType.transparency,
              child: Stack(
                children: [
                // Full white circle background to prevent any background bleed-through
                Container(
                  width: 71.56,
                  height: 71.56,
                  decoration: BoxDecoration(
                    color: AppColors.navBackground,
                    shape: BoxShape.circle,
                    // Explicitly remove any shadow
                    boxShadow: [],
                  ),
                ),
                // Only top half circle with border (visible part above nav bar)
                ClipPath(
                  clipper: TopHalfCircleClipper(),
                  child: Container(
                    width: 71.56,
                    height: 71.56,
                    decoration: BoxDecoration(
                      color: AppColors.navBackground,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE5E5E5),
                        width: 2.0,
                      ),
                      // Explicitly remove any shadow
                      boxShadow: [],
                    ),
                  ),
                ),
                // FAB button centered with no shadow - using GestureDetector instead of Material
                Positioned.fill(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Handle FAB tap
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.fabBlue,
                          shape: BoxShape.circle,
                          // Explicitly remove any shadow
                          boxShadow: [],
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStandardNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(context, Icons.home, 'Home', 0),
        _buildNavItem(context, Icons.bar_chart, 'Stats', 1),
        // Spacer for FAB - the actual FAB is positioned above in Stack
        SizedBox(width: 60),
        _buildNavItem(context, Icons.chat_bubble_outline, 'Chat', 2),
        _buildNavItem(context, Icons.person_outline, 'Profile', 3),
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
        color: AppColors.materialTransparent,
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
              vertical: ResponsiveSpacing.xs(context),
              horizontal: ResponsiveSpacing.xs(context),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: iconSize + 4,
                  width: iconSize + 4,
                  alignment: Alignment.center,
                  child: Icon(
                    isSelected && icon == Icons.home ? Icons.home : icon,
                    color: isSelected ? Colors.black : Colors.grey,
                    size: iconSize,
                  ),
                ),
                SizedBox(height: 2),
                Flexible(
                  child: Text(
                    label,
                    style: GoogleFonts.manrope(
                      fontSize: context.captionFontSize * 0.9,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.black : Colors.grey,
                      letterSpacing: 0.015,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
      color: AppColors.materialTransparent,
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
            color: isSelected ? Colors.black : Colors.grey,
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
      case 1: // My Visits tab
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyVisitsPage()),
        );
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

class TopHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    
    // Create a rectangle that covers only the top half of the circle
    path.addRect(Rect.fromLTWH(0, 0, size.width, radius));
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    final double notchRadius = 35.0;
    final double notchMargin = 8.0;
    
    // Start from top-left
    path.lineTo(0, 0);
    
    // Top edge until notch
    path.lineTo((size.width / 2) - notchRadius - notchMargin, 0);
    
    // Create the notch curve
    path.quadraticBezierTo(
      (size.width / 2) - notchRadius, 0,
      (size.width / 2) - notchRadius, notchRadius / 2,
    );
    
    path.arcToPoint(
      Offset((size.width / 2) + notchRadius, notchRadius / 2),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    
    path.quadraticBezierTo(
      (size.width / 2) + notchRadius, 0,
      (size.width / 2) + notchRadius + notchMargin, 0,
    );
    
    // Continue top edge
    path.lineTo(size.width, 0);
    
    // Right edge
    path.lineTo(size.width, size.height);
    
    // Bottom edge
    path.lineTo(0, size.height);
    
    // Left edge back to start
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
