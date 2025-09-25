import 'package:flutter/material.dart';
import 'therapist_profile_page.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'utils/responsive_utils.dart';
import 'utils/app_colors.dart';
import 'theme/responsive_theme.dart';

class OviLandingPage extends StatefulWidget {
  const OviLandingPage({super.key});

  @override
  State<OviLandingPage> createState() => _OviLandingPageState();
}

class _OviLandingPageState extends State<OviLandingPage> {
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/union 1.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0.7),
              Colors.white,
            ],
            stops: const [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Section
              _buildHeader(),
              
              // Search Section
              _buildSearchSection(),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // How do you feel today section
                      _buildFeelingsSection(),
                      
                      // Upcoming Appointments section
                      _buildUpcomingAppointmentsSection(),
                      
                      // Recommended for you section
                      _buildRecommendedSection(),
                      
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 0),
    );
  }

  Widget _buildHeader() {
    final minTouchTarget = ResponsiveUtils.getMinTouchTarget();
    final iconSize = ResponsiveUtils.getIconSize(context);
    
    return Container(
      constraints: ResponsiveUtils.getContainerConstraints(context),
      padding: EdgeInsets.fromLTRB(
        context.horizontalPadding,
        context.verticalPadding,
        context.horizontalPadding,
        ResponsiveSpacing.sm(context),
      ),
      child: Row(
        children: [
          // Hamburger menu icon
          Material(
            color: AppColors.materialTransparent,
            child: InkWell(
              onTap: () {
                // TODO: Handle menu tap
              },
              borderRadius: BorderRadius.circular(
                ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
              ),
              child: Container(
                width: minTouchTarget,
                height: minTouchTarget,
                alignment: Alignment.center,
                child: Icon(
                  Icons.menu,
                  color: AppColors.vevaleHeaderText,
                  size: iconSize,
                ),
              ),
            ),
          ),
          // Vevale title in center
          Expanded(
            child: Text(
              'Vevale',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.vevaleHeaderText,
                fontSize: 23.85,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.35,
              ),
            ),
          ),
          // Profile picture
          Material(
            color: AppColors.materialTransparent,
            child: InkWell(
              onTap: () {
                // TODO: Handle profile tap
              },
              borderRadius: BorderRadius.circular(
                ResponsiveUtils.getBorderRadius(context, baseRadius: 20.0),
              ),
              child: Container(
                width: 42.67,
                height: 35.71,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://placehold.co/42x36',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFD9D9D9),
                        child: Icon(
                          Icons.person,
                          color: AppColors.secondary,
                          size: iconSize * 0.7,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    final iconSize = ResponsiveUtils.getIconSize(context);
    
    return Container(
      constraints: ResponsiveUtils.getContainerConstraints(context),
      padding: EdgeInsets.fromLTRB(
        context.horizontalPadding,
        ResponsiveSpacing.md(context),
        context.horizontalPadding,
        0,
      ),
      child: Container(
        width: 336.91,
        height: 40,
        decoration: ShapeDecoration(
          color: _isSearchFocused ? const Color(0xFFF6F6FE).withOpacity(0.8) : const Color(0xFFF6F6FE),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: _isSearchFocused ? 2.0 : 0.99,
              color: _isSearchFocused ? AppColors.accent : const Color(0xFF6B6EAB),
            ),
            borderRadius: BorderRadius.circular(57.29),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                Icons.search,
                color: _isSearchFocused ? AppColors.accent : const Color(0xFF6B6EAB),
                size: iconSize,
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: _searchFocusNode,
                decoration: InputDecoration(
                  hintText: 'Search for therapists',
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF6B6EAB),
                    fontSize: context.bodyFontSize,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: context.bodyFontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeelingsSection() {
    return Container(
      constraints: ResponsiveUtils.getContainerConstraints(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.horizontalPadding,
              ResponsiveSpacing.lg(context),
              context.horizontalPadding,
              ResponsiveSpacing.md(context),
            ),
            child: Text(
              'How do you feel today?',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: context.headingFontSize,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveSpacing.md(context),
            ),
            child: Wrap(
              spacing: ResponsiveSpacing.md(context),
              runSpacing: ResponsiveSpacing.md(context),
              children: [
                _buildFeelingsChip('Anxious'),
                _buildFeelingsChip('Stressed'),
                _buildFeelingsChip('Depressed'),
                _buildFeelingsChip('Addiction'),
                _buildFeelingsChip('Relationship'),
                _buildFeelingsChip('Not Sure'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeelingsChip(String text) {
    final minTouchTarget = ResponsiveUtils.getMinTouchTarget();
    
    return Material(
      color: AppColors.materialTransparent,
      child: InkWell(
        onTap: () {
          // TODO: Handle feeling selection
        },
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context, baseRadius: 20.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            minHeight: minTouchTarget * 0.7, // Slightly smaller for chips
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding,
            vertical: ResponsiveSpacing.sm(context),
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(
              ResponsiveUtils.getBorderRadius(context, baseRadius: 20.0),
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: context.bodyFontSize,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointmentsSection() {
    final listHeight = ResponsiveUtils.getListItemHeight(context) + 70; // Extra space for text
    
    return Container(
      constraints: ResponsiveUtils.getContainerConstraints(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.horizontalPadding,
              ResponsiveSpacing.lg(context),
              context.horizontalPadding,
              ResponsiveSpacing.md(context),
            ),
            child: Text(
              'Upcoming Appointments',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: context.headingFontSize,
              ),
            ),
          ),
          SizedBox(
            height: listHeight,
            child: context.isTablet || context.isDesktop
                ? _buildAppointmentGrid()
                : _buildAppointmentList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      children: [
        _buildAppointmentCard(
          'Dr. Anya Sharma',
          'Tue, Jul 23 · 10:00 AM',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDOtMvIpbAcU_sCI9NzSZFbQidSwae9_yCeXj4MruJUu7V7I4T2thx-XaVcGA4ncwqSGOjM9i9DV-hZI0ySxjUO7ZlYd64FBOBEuvkrO0WCFHGjj2Gt9da23oFHXjWyHAPoqcu6rw8C8hkCmZM9x5FD5Ec3ECR4FYBVbYxGRYiO0exFE1wdr8xaZSBixJ36NLCRflvcFs2XFlO4eI-vpOgvZ7vz7olWeQUkYN5SgD7D_gB4XU5AaDtax7uxS2OeWOPc9ZnhcteG_bc',
        ),
        SizedBox(width: ResponsiveSpacing.md(context)),
        _buildAppointmentCard(
          'Dr. Varun Verma',
          'Wed, Jul 24 · 2:00 PM',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAwZM4YIKo65Rl8G0EF8kUbruVag2R40QmimWluJNsrhvD0mgeeGMBx1cwHFHELoZdSDIQIcxx08lHi6ddJnz6Gsyh00pe-RkW6me9giNfGWYPoFrAq69nmD6R0cAWuNq_khGlaw9yG5NZzbdgWyvUMfOJXCLtM7iQ9bQ6ZXiqvAEVmgaU2WpDASmPdd9_NKFZh-3vBU4aNnfyoauv9G3VOU7sCOr3o1FxNfOe4dLw1-YCwYb5aAsCQjnufnQ-HH0RgEoovSe801Pk',
        ),
      ],
    );
  }

  Widget _buildAppointmentGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      child: Row(
        children: [
          Expanded(
            child: _buildAppointmentCard(
              'Dr. Anya Sharma',
              'Tue, Jul 23 · 10:00 AM',
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDOtMvIpbAcU_sCI9NzSZFbQidSwae9_yCeXj4MruJUu7V7I4T2thx-XaVcGA4ncwqSGOjM9i9DV-hZI0ySxjUO7ZlYd64FBOBEuvkrO0WCFHGjj2Gt9da23oFHXjWyHAPoqcu6rw8C8hkCmZM9x5FD5Ec3ECR4FYBVbYxGRYiO0exFE1wdr8xaZSBixJ36NLCRflvcFs2XFlO4eI-vpOgvZ7vz7olWeQUkYN5SgD7D_gB4XU5AaDtax7uxS2OeWOPc9ZnhcteG_bc',
            ),
          ),
          SizedBox(width: ResponsiveSpacing.md(context)),
          Expanded(
            child: _buildAppointmentCard(
              'Dr. Varun Verma',
              'Wed, Jul 24 · 2:00 PM',
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAwZM4YIKo65Rl8G0EF8kUbruVag2R40QmimWluJNsrhvD0mgeeGMBx1cwHFHELoZdSDIQIcxx08lHi6ddJnz6Gsyh00pe-RkW6me9giNfGWYPoFrAq69nmD6R0cAWuNq_khGlaw9yG5NZzbdgWyvUMfOJXCLtM7iQ9bQ6ZXiqvAEVmgaU2WpDASmPdd9_NKFZh-3vBU4aNnfyoauv9G3VOU7sCOr3o1FxNfOe4dLw1-YCwYb5aAsCQjnufnQ-HH0RgEoovSe801Pk',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(String doctorName, String dateTime, String imageUrl) {
    final imageHeight = ResponsiveUtils.getListItemHeight(context);
    
    return Material(
      color: AppColors.materialTransparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TherapistProfilePage(
                doctorName: doctorName,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context),
        ),
        child: Container(
          width: context.isTablet || context.isDesktop ? null : ResponsiveUtils.getCardWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveUtils.getBorderRadius(context),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: ResponsiveSpacing.md(context)),
              Text(
                doctorName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: context.subheadingFontSize,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: ResponsiveSpacing.xs(context)),
              Text(
                dateTime,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: context.bodyFontSize,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedSection() {
    final listHeight = ResponsiveUtils.getListItemHeight(context) + 60; // Extra space for text
    
    return Container(
      constraints: ResponsiveUtils.getContainerConstraints(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.horizontalPadding,
              ResponsiveSpacing.lg(context),
              context.horizontalPadding,
              ResponsiveSpacing.md(context),
            ),
            child: Text(
              'Recommended for you',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: context.headingFontSize,
              ),
            ),
          ),
          SizedBox(
            height: listHeight,
            child: context.isTablet || context.isDesktop
                ? _buildRecommendedGrid()
                : _buildRecommendedList(),
          ),
          SizedBox(height: ResponsiveSpacing.lg(context)),
        ],
      ),
    );
  }

  Widget _buildRecommendedList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      children: [
        _buildRecommendedCard(
          'Dr. Zara Kapoor',
          'Anxiety, Depression',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuABxHicQkQgNbBdt7r6bDUbvdkiEePY8uF6ZqUCwbljxKkOluMp4LWTJW-_SQJ3CS_fwsFEskbBp6SR8DIlTqUKDPF-IskqAZLskcickPyHJvSPkOPQU-FFx_dtIw72O2kAIBk9tRBJXThT6phMq-9lnkPUG1tY3B1YPKa72JEN4bmVHEomnu-1VmPYdtcGlqXvRdWbjXT1OnafOyvf9nQc4PPTIbLiUs7g0CnDz-ma1_iwXZr7WTgetaq-D2cHOzAffUBEjaN6IDA',
        ),
        SizedBox(width: ResponsiveSpacing.md(context)),
        _buildRecommendedCard(
          'Dr. Arjun Singh',
          'Stress Management, Relationships',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD7rEs3Vih81qcwrVLY4BL1LXFKMLmt1Vq7f2_kA9w0mI8aywFtbYMmdsM0yY3jaSa5fmvLsm4600wHJU6eRNYbyQrFkvm8CL_WX0oWTNGdXCpUKg0bPfwzhSiNYEOum05teyrbg0AMd5cfHYA5SLH4755gfhBuuEm24GibFJZSVm9BWdUxCUZOVbgGDWXrNHfomIsCUiBMlkrP86j_c8SOBmq8IfKf7JfgOZoDoygcRHDVa9QCIQzcliBYMhwtFkdCBzq953TZ0d8',
        ),
        SizedBox(width: ResponsiveSpacing.md(context)),
        _buildRecommendedCard(
          'Dr. Maya Patel',
          'Trauma, PTSD',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCFae2HGqQyjmEGRyuefGVo-NFlKz-DjVxM3a42vqA4sJI_cqjajfT9czfC9ruDXzkn2lUHrpdrNAt5ljcdac4PBtvvTv9Ma5KkjU67Kbed0CUwraOmM11JguN3QUDaNPXubHQfVatM2u7QGDEx5UjZ_t1s5GK_4w5cK8coqK-J3KZZLCxvIRVAgMSfcrbJZU1wGDePLOXuqer_wBAM6d9xErktWt4HYFRP2501RsyfO3tYOYqFfDkU7-1Y8qJb46-9SPOczTv_AcE',
        ),
      ],
    );
  }

  Widget _buildRecommendedGrid() {
    final gridColumns = ResponsiveUtils.getGridColumns(context);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      child: Row(
        children: [
          Expanded(
            child: _buildRecommendedCard(
              'Dr. Zara Kapoor',
              'Anxiety, Depression',
              'https://lh3.googleusercontent.com/aida-public/AB6AXuABxHicQkQgNbBdt7r6bDUbvdkiEePY8uF6ZqUCwbljxKkOluMp4LWTJW-_SQJ3CS_fwsFEskbBp6SR8DIlTqUKDPF-IskqAZLskcickPyHJvSPkOPQU-FFx_dtIw72O2kAIBk9tRBJXThT6phMq-9lnkPUG1tY3B1YPKa72JEN4bmVHEomnu-1VmPYdtcGlqXvRdWbjXT1OnafOyvf9nQc4PPTIbLiUs7g0CnDz-ma1_iwXZr7WTgetaq-D2cHOzAffUBEjaN6IDA',
            ),
          ),
          SizedBox(width: ResponsiveSpacing.md(context)),
          Expanded(
            child: _buildRecommendedCard(
              'Dr. Arjun Singh',
              'Stress Management, Relationships',
              'https://lh3.googleusercontent.com/aida-public/AB6AXuD7rEs3Vih81qcwrVLY4BL1LXFKMLmt1Vq7f2_kA9w0mI8aywFtbYMmdsM0yY3jaSa5fmvLsm4600wHJU6eRNYbyQrFkvm8CL_WX0oWTNGdXCpUKg0bPfwzhSiNYEOum05teyrbg0AMd5cfHYA5SLH4755gfhBuuEm24GibFJZSVm9BWdUxCUZOVbgGDWXrNHfomIsCUiBMlkrP86j_c8SOBmq8IfKf7JfgOZoDoygcRHDVa9QCIQzcliBYMhwtFkdCBzq953TZ0d8',
            ),
          ),
          if (gridColumns > 2) ...[
            SizedBox(width: ResponsiveSpacing.md(context)),
            Expanded(
              child: _buildRecommendedCard(
                'Dr. Maya Patel',
                'Trauma, PTSD',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCFae2HGqQyjmEGRyuefGVo-NFlKz-DjVxM3a42vqA4sJI_cqjajfT9czfC9ruDXzkn2lUHrpdrNAt5ljcdac4PBtvvTv9Ma5KkjU67Kbed0CUwraOmM11JguN3QUDaNPXubHQfVatM2u7QGDEx5UjZ_t1s5GK_4w5cK8coqK-J3KZZLCxvIRVAgMSfcrbJZU1wGDePLOXuqer_wBAM6d9xErktWt4HYFRP2501RsyfO3tYOYqFfDkU7-1Y8qJb46-9SPOczTv_AcE',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRecommendedCard(String doctorName, String specialties, String imageUrl) {
    final cardWidth = ResponsiveUtils.getCardWidth(context);
    final imageHeight = ResponsiveUtils.getListItemHeight(context) * 0.8;
    
    return Material(
      color: AppColors.materialTransparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TherapistProfilePage(
                doctorName: doctorName,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context),
        ),
        child: Container(
          width: context.isTablet || context.isDesktop ? null : cardWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveUtils.getBorderRadius(context),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: ResponsiveSpacing.xs(context)),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      doctorName,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: context.bodyFontSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: ResponsiveSpacing.xs(context) / 2),
                    Text(
                      specialties,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: context.captionFontSize,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
