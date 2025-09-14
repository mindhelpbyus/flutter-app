import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'user_profile_page.dart';
import 'utils/responsive_utils.dart';
import 'utils/app_colors.dart';
import 'theme/responsive_theme.dart';

class MyVisitsPage extends StatefulWidget {
  const MyVisitsPage({super.key});

  @override
  State<MyVisitsPage> createState() => _MyVisitsPageState();
}

class _MyVisitsPageState extends State<MyVisitsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(),
            
            // Tab Navigation
            _buildTabNavigation(),
            
            // Main Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildUpcomingVisits(),
                  _buildPastVisits(),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 1),
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
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: minTouchTarget), // Space for centering
          Expanded(
            child: Text(
              'My Visits',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: context.subheadingFontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          Material(
            color: AppColors.materialTransparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfilePage(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(
                ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
              ),
              child: Container(
                width: minTouchTarget,
                height: minTouchTarget,
                alignment: Alignment.center,
                child: Icon(
                  Icons.person,
                  color: AppColors.secondary,
                  size: iconSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      constraints: ResponsiveUtils.getContainerConstraints(context),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: AppColors.primary,
        indicatorWeight: 2,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.secondary,
        labelStyle: GoogleFonts.manrope(
          fontSize: context.bodyFontSize,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.manrope(
          fontSize: context.bodyFontSize,
          fontWeight: FontWeight.w600,
        ),
        tabs: const [
          Tab(text: 'Upcoming'),
          Tab(text: 'Past'),
        ],
      ),
    );
  }

  Widget _buildUpcomingVisits() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildVisitCard(
          doctorName: 'Dr. Priya Sharma',
          dateTime: '25th June 2024, 10:30 AM',
          visitType: 'Video Call',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDZMiIZkY0zFJRk3FfumBWkyWRtxF3BLQe81kSud2xxDL3lXkBsyoQP3fukBVAa2FcfzUtfWVncJwJQoMRIa3UNsgILCGCplPzMk-sldvgEUg5rsqQB2MsP-CKomCmXPzfYdcrZ163rZ3gmA9NegRHa7ZIQBbilaY9bKnhJJn0KVRf6vZ4x70qpUviqSQ5Pvdpi8cxJOT0EDEyLhDpJptaZk9mxzadu-ZIhrE4VoDmDtuN87C7et6aVT530D5MgHbUo29hEl989pM0',
          canJoin: true,
        ),
        _buildDivider(),
        _buildVisitCard(
          doctorName: 'Dr. Arjun Verma',
          dateTime: '28th June 2024, 02:00 PM',
          visitType: 'In-person',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAQvghcJPACLBLiHo01mgvFkZ5wX2dsT0vkZpHO1qZDqKQqjBAHnNzVzQxVIfBpkk_5xILa2SwyJ8Yj80VQKqH7tC8_Tuwl0qxSbbjfufT-F1iTR42whoIE8_5KbLMi8uRnHAOBMJtg2wrdg3WXz6SPzdVruGeNtokoy7R_W9xSQcH2IIp7_Ge8M4ln4N3ABx1pnhHmb2OehMgtPJIHCC40pDz7kTq2VvkKJgaFzgiNibIpxzomuX7bmACsFpj5O01N_cjxoocwHcc',
          canJoin: false,
        ),
        _buildDivider(),
        _buildVisitCard(
          doctorName: 'Dr. Meera Krishnan',
          dateTime: '1st July 2024, 11:00 AM',
          visitType: 'Chat',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBJEdr_PfkUm7dqg7eJR9oVO3VJNvUxtb7xJckRI5IPVmrCWzXeFgTRu0phwL0rkjO-37xvdfOZIkohq2_IOazv3v9qrG4eY7q45NHoIICIuzrpjskte9lcivV6LaHBQvEQOdFwQtYkwasYX88DZ_gcAXl_1bwrs_5thBt6XApAKsjtuc8bDedu2oxD9c_JFbseCwWqqYIXbdcECR18_Iy6gj6C3--C9LHSLDghNpKu04ryIanOC_Q5PgA2RjGqrYC8j4Nwjz_dg0s',
          canJoin: true,
        ),
      ],
    );
  }

  Widget _buildPastVisits() {
    final pastVisitTherapists = [
      {
        'name': 'Dr. Priya Sharma',
        'specialty': 'Psychotherapist',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpSmpIV7ARRhbxn5A5R4bMU4HXYMZZ3EWqaPP62Q9JA-8lqksFT9TSpFvmlMWjmz6EKiTDSYRSwHQvvn2yZnj9XSE2g3LQEjkRB_zr36fULL6B-n053FW2CzjyRd2bwxRcWti5QKn17aRVvePkmuqPP-vTud-6fBaGiCrk17BMOi2jdoVkPzLWM4QA-OgIPN_K7xj3o0EjFLgQOpm_J6YL5rYo6ELlRSHK-2FSplh9cV0u9iQru_O3CxyvR5NoNu5_FpkLScnCuF4',
        'visitCount': 3,
      },
      {
        'name': 'Dr. Anjali Rao',
        'specialty': 'Clinical Psychologist',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDLY1u7aUrqwZ6ec1wMNBsrc4yNWBpVf4d4dOTh7pQN3oFKepkgjK8kxgJb1Uv_YmD2o-1PqvWRSfDMKkGf6SaAeHWdEXezW5tEpzOOe4vPYBUlXsUyDYQmKHgwTEfJkXhg1QD5GD5s0_7nmkaTHDgCtuGozHRQmKtdu-uJWITFekg5jUBk8djJf9IS2sDRRPaB2HRn1fRAicwhvvRrYW_QWFw8KmFzDPJAoFKhKPjuafVFagLUYHCZ_4aAsujHgfWsD8FQYJEzbFQ',
        'visitCount': 2,
      },
      {
        'name': 'Dr. Rohan Verma',
        'specialty': 'Counseling Psychologist',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBNQO7pRk3ZlJl_xdqrtf-3VZ9P14s2tQgp9Lr1NkKn9JjTOe2fWGaxafypKP9NekOJZF5GnNoHz79099g7Im3ZJhcLENl2ZD5fdq6FC1oAevH2oZ6852bRU6oNtzWIXQYN7FIFwXLK-ZkScEFftNdDAlHIn701_aUsXWYXc9mVUEOa9X29E9EU_S08bVD_3iGRKniodqrhbfL_sOng33DosN381FwtBtIlv1g6jNDoeXQtU1LXjeQmOtJBKQ_JYYG6S5DzP9DYQA0',
        'visitCount': 1,
      },
    ];

    return Container(
      color: AppColors.background,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding,
          vertical: ResponsiveSpacing.md(context),
        ),
        itemCount: pastVisitTherapists.length,
        itemBuilder: (context, index) {
          return _buildPastVisitCard(pastVisitTherapists[index]);
        },
      ),
    );
  }

  Widget _buildPastVisitCard(Map<String, dynamic> therapist) {
    return Material(
      color: AppColors.materialTransparent,
      child: InkWell(
        onTap: () {
          // Handle therapist card tap - navigate to therapist profile or visit history
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Viewing ${therapist['name']} details'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getBorderRadius(context, baseRadius: 12.0),
        ),
        child: Container(
          padding: EdgeInsets.all(ResponsiveSpacing.md(context)),
          margin: EdgeInsets.only(bottom: ResponsiveSpacing.lg(context)),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Therapist Image
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveUtils.getBorderRadius(context, baseRadius: 12.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(therapist['image'] as String),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              SizedBox(width: ResponsiveSpacing.md(context)),
              
              // Therapist Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      therapist['name'] as String,
                      style: GoogleFonts.manrope(
                        fontSize: context.subheadingFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    
                    SizedBox(height: ResponsiveSpacing.xs(context)),
                    
                    // Specialty
                    Text(
                      therapist['specialty'] as String,
                      style: GoogleFonts.manrope(
                        fontSize: context.bodyFontSize,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    
                    SizedBox(height: ResponsiveSpacing.md(context)),
                    
                    // Action Buttons
                    Row(
                      children: [
                        // Book Again Button
                        Material(
                          color: AppColors.materialTransparent,
                          child: InkWell(
                            onTap: () {
                              _handleBookAgain(therapist['name'] as String);
                            },
                            borderRadius: BorderRadius.circular(
                              ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveSpacing.md(context),
                                vertical: ResponsiveSpacing.sm(context),
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0C7EA), // Light purple from HTML
                                borderRadius: BorderRadius.circular(
                                  ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                                ),
                              ),
                              child: Text(
                                'Book Again',
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(width: ResponsiveSpacing.sm(context)),
                        
                        // Last Visits Button
                        Material(
                          color: AppColors.materialTransparent,
                          child: InkWell(
                            onTap: () {
                              _handleLastVisits(
                                therapist['name'] as String,
                                therapist['visitCount'] as int,
                              );
                            },
                            borderRadius: BorderRadius.circular(
                              ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveSpacing.md(context),
                                vertical: ResponsiveSpacing.sm(context),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.surface, // Light gray from HTML
                                borderRadius: BorderRadius.circular(
                                  ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                                ),
                              ),
                              child: Text(
                                'Last Visits (${therapist['visitCount']})',
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  void _handleBookAgain(String doctorName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking appointment with $doctorName...'),
        backgroundColor: AppColors.accent,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleLastVisits(String doctorName, int visitCount) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing $visitCount past visits with $doctorName'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildVisitCard({
    required String doctorName,
    required String dateTime,
    required String visitType,
    required String imageUrl,
    required bool canJoin,
  }) {
    return Material(
      color: AppColors.materialTransparent,
      child: InkWell(
        onTap: () {
          // Handle visit card tap - could navigate to visit details
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tapped on $doctorName visit'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        child: Container(
          constraints: ResponsiveUtils.getContainerConstraints(context),
          padding: EdgeInsets.all(context.horizontalPadding),
          child: Column(
            children: [
              Row(
                children: [
                  // Doctor Image
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  SizedBox(width: ResponsiveSpacing.md(context)),
                  
                  // Doctor Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: GoogleFonts.notoSans(
                            fontSize: context.subheadingFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: ResponsiveSpacing.xs(context)),
                        Text(
                          dateTime,
                          style: GoogleFonts.manrope(
                            fontSize: context.bodyFontSize,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonPrimary, // Pink color matching book appointment button
                          ),
                        ),
                        SizedBox(height: ResponsiveSpacing.xs(context)),
                        Text(
                          visitType,
                          style: GoogleFonts.manrope(
                            fontSize: context.bodyFontSize,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: ResponsiveSpacing.md(context)),
              
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Cancel Button
                  Material(
                    color: AppColors.materialTransparent,
                    child: InkWell(
                      onTap: () {
                        _showCancelDialog(doctorName);
                      },
                      borderRadius: BorderRadius.circular(
                        ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveSpacing.lg(context),
                          vertical: ResponsiveSpacing.sm(context),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3F6), // Card background from HTML
                          borderRadius: BorderRadius.circular(
                            ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.manrope(
                            fontSize: context.bodyFontSize,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF374151), // Gray-800 from HTML
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(width: ResponsiveSpacing.sm(context)),
                  
                  // Join Call Button
                  Material(
                    color: AppColors.materialTransparent,
                    child: InkWell(
                      onTap: canJoin ? () {
                        _handleJoinCall(doctorName, visitType);
                      } : null,
                      borderRadius: BorderRadius.circular(
                        ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveSpacing.lg(context),
                          vertical: ResponsiveSpacing.sm(context),
                        ),
                        decoration: BoxDecoration(
                          color: canJoin 
                              ? AppColors.accent // Pink color matching book appointment button
                              : AppColors.accent.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(
                            ResponsiveUtils.getBorderRadius(context, baseRadius: 8.0),
                          ),
                        ),
                        child: Text(
                          'Join Call',
                          style: GoogleFonts.manrope(
                            fontSize: context.bodyFontSize,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textOnAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      constraints: ResponsiveUtils.getContainerConstraints(context),
      child: Divider(
        height: 1,
        thickness: 1,
        color: AppColors.border,
      ),
    );
  }

  void _showCancelDialog(String doctorName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Cancel Appointment',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to cancel your appointment with $doctorName?',
            style: GoogleFonts.manrope(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Keep Appointment',
                style: GoogleFonts.manrope(
                  color: AppColors.secondary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Appointment with $doctorName cancelled'),
                    backgroundColor: AppColors.error,
                  ),
                );
              },
              child: Text(
                'Cancel Appointment',
                style: GoogleFonts.manrope(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleJoinCall(String doctorName, String visitType) {
    String message;
    switch (visitType.toLowerCase()) {
      case 'video call':
        message = 'Joining video call with $doctorName...';
        break;
      case 'chat':
        message = 'Opening chat with $doctorName...';
        break;
      case 'in-person':
        message = 'Appointment details for $doctorName';
        break;
      default:
        message = 'Connecting with $doctorName...';
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.accent,
      ),
    );
  }
}
