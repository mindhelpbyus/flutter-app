import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'therapist_profile_page.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'utils/app_colors.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedTabIndex = 0;
  int selectedDateIndex = 2; // Today is selected by default

  final List<String> weekDays = ['Mon', 'Tue', 'Today', 'Thu', 'Fri'];
  final List<int> dates = [23, 24, 25, 26, 27];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Tab Section (Therapist/Clinic)
                    _buildTabSection(),
                    
                    // Filter Pills
                    _buildFilterSection(),
                    
                    // Date Selector
                    _buildDateSelector(),
                    
                    // Therapist List
                    _buildTherapistList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 2),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top bar with back button, title, and filter
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.materialTransparent,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primary,
                    size: 24,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: Text(
                  'Explore',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.materialTransparent,
                ),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.tune,
                        color: AppColors.primary,
                        size: 24,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                        child: Center(
                          child: Text(
                            '3',
                            style: GoogleFonts.manrope(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textOnAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Search Bar
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Icon(
                    Icons.search,
                    color: AppColors.secondary,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for therapists or clinics',
                      hintStyle: GoogleFonts.manrope(
                        fontSize: 16,
                        color: AppColors.secondary,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTabIndex = 0;
                  });
                },
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: selectedTabIndex == 0 ? AppColors.background : AppColors.materialTransparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: selectedTabIndex == 0 ? [
                      BoxShadow(
                        color: AppColors.shadowMedium,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ] : null,
                  ),
                  child: Center(
                    child: Text(
                      'Therapist',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: selectedTabIndex == 0 ? FontWeight.w600 : FontWeight.w500,
                        color: selectedTabIndex == 0 ? AppColors.textPrimary : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTabIndex = 1;
                  });
                },
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: selectedTabIndex == 1 ? AppColors.background : AppColors.materialTransparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: selectedTabIndex == 1 ? [
                      BoxShadow(
                        color: AppColors.shadowMedium,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ] : null,
                  ),
                  child: Center(
                    child: Text(
                      'Clinic',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: selectedTabIndex == 1 ? FontWeight.w600 : FontWeight.w500,
                        color: selectedTabIndex == 1 ? AppColors.textPrimary : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    final filters = [
      {'name': 'Rating', 'isSelected': false},
      {'name': 'Category', 'isSelected': true},
      {'name': 'Price', 'isSelected': false},
      {'name': 'Languages', 'isSelected': false},
      {'name': 'Experience', 'isSelected': false},
      {'name': 'Gender', 'isSelected': false},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        height: 32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            final filter = filters[index];
            final isSelected = filter['isSelected'] as bool;
            
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.accent.withOpacity(0.1) : AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: isSelected ? Border.all(
                    color: AppColors.accent.withOpacity(0.2),
                    width: 1,
                  ) : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      filter['name'] as String,
                      style: GoogleFonts.manrope(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? AppColors.accent : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 14,
                      color: isSelected ? AppColors.accent : AppColors.textPrimary,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.materialTransparent,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_left,
                color: AppColors.textPrimary,
                size: 20,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(weekDays.length, (index) {
                final isSelected = index == selectedDateIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDateIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.accent : AppColors.materialTransparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          weekDays[index],
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? AppColors.textOnAccent : AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dates[index].toString(),
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? AppColors.textOnAccent : AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.materialTransparent,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                color: AppColors.textPrimary,
                size: 20,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTherapistList() {
    final therapists = [
      {
        'name': 'Dr. Priya Sharma',
        'location': 'Chennai, Tamil Nadu',
        'rating': 4.8,
        'reviews': 120,
        'price': '₹1,500',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAvx5SRTH8B08c3T7teOC931oNhbxfbWHFOa9f2FZLGggrACmzBEypllMemnQoyqpSXANAtOhL_z35IsUOasWrhKFUN7a7oOdF4jP3HGxn7lnr3EzQ1zRefA1MZG1HC5N_8Zn74iro7c_jxP0bK2pNzxuhjFH7_dImMHFzboO2IaT_vka_uYzkXv4oT4Et7AscAGyjAF3-I-dWH575_NzblApFuSAxTWHrhgpQyZqJBT1d8HxEF2BEO0rUjYcI2KzFpk5Ptw5TazvM',
        'specialties': ['Cognitive Behavioral Therapy', 'Tamil, English', 'Female'],
        'timeSlots': ['10:00 AM', '11:00 AM'],
        'selectedSlot': 1,
      },
      {
        'name': 'Mindful Solutions Clinic',
        'location': 'Bangalore, Karnataka',
        'rating': 4.5,
        'reviews': 85,
        'price': '₹2,000',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBBDnQw6YiAKvKVLdbTquYe8pKgk7QORt6-nQOEPlUGKFkQ5lo2RVHNqsKFZAnEu7HGooiDV7JSt6ol0-3_C0nY0FOSMilMN30xT81_G3Q1FCphoxKcuCJpCYFqJ98-BVAQp5ypZm9CNsWh1N69RfphtGe9nohxnzf7_RYNZMcRdDUwc_g3sLGR4ldiPmjvRSZmeBnvWhNKEc2jI16hZuhqt_Tztl3rRKcULO_QYoUz9hEc-6wbtnxfIxeiHhCByXQRIW4V-NxmEBI',
        'specialties': ['Family Therapy', 'Kannada, English, Telugu'],
        'timeSlots': ['2:00 PM', '3:00 PM'],
        'selectedSlot': -1,
      },
      {
        'name': 'Dr. Arjun Rao',
        'location': 'Hyderabad, Telangana',
        'rating': 4.9,
        'reviews': 150,
        'price': '₹1,800',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB-Gve_XfOEiTpLvh68UWqxHE_M-54OgZn_jMBRbFTV1tizkxK4VNL5LxyNk0LqOw4mqRxwd5TA7KDOWks08WO2Qyk9bNeS1bvC3n-o6klDW_acibuXxJDqqScSZE5xqPScuUm8Jf-38GgIv826qbZkSJ8JjndXfzQYopktRd2is7AJHj14pDW5QmlPD_Nw8flCAXUEJq9JhZdo7z181pNU8nmDLjg23ug9wk6WZ6SQiIYUTVtpxohqEyyz2IPrb-f1qqxxU4uu5VE',
        'specialties': ['Stress Management', 'Telugu, English, Hindi', 'Male'],
        'timeSlots': ['4:30 PM'],
        'selectedSlot': -1,
      },
      {
        'name': 'Kerala Wellness Center',
        'location': 'Kochi, Kerala',
        'rating': 4.7,
        'reviews': 95,
        'price': '₹2,200',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBqgHolCpWfcaQ9ftOOqATKDkQGnuMttsBNtfitj0nZWeXQAiVUxUbRqyUEG6yYdlAEE3lZlsPjcMvKssTTWzQpSx8MqptSiFbEq4YgugbDOgyZ8R7_dZHPqxgamqE00liPpsHZHvTuLQr8cR5kmgCSMx4vfZJvBGWXPCTBx07csuRssRwm3_0pQsfCIjAhgLItmI4T1Ip14pBWtcUq4m9oNdlmQLzD8BuEE5Z_06ytpUt7_0UTgyepA-kFV3M0_hpHC1ZjLT-DpgA',
        'specialties': ['Couples Counseling', 'Malayalam, English'],
        'timeSlots': ['11:00 AM'],
        'selectedSlot': -1,
      },
      {
        'name': 'Dr. Lakshmi Krishnan',
        'location': 'Coimbatore, Tamil Nadu',
        'rating': 4.6,
        'reviews': 110,
        'price': '₹1,600',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuC5ZbvV3l7AWcWfpDa8_8QlpEbfpiKmPr9PB3EGuQKQutVNVzbuQ195OTsR_k2_7zBshqugaVCgbsDnDXQtuYp9NfpUkeKUU7s29gV98XSIjP4VbdX1yM4XsRPBVl7-PRIMEkf0oRS8CxIq19s6tVDOjREC0oV9vgOGQbTm-k9qzGI-UrN0uY1crZrI-pxn7pwWbkArO7Fykt24lvcZTuZ-rH1Cds-uqy3Mo64br4kY2CtbN2XOUrrioCtH4xB29yR-bjlmL8LoioA',
        'specialties': ['Anxiety Management', 'Tamil, English', 'Female'],
        'timeSlots': ['3:00 PM'],
        'selectedSlot': -1,
      },
    ];

    return Column(
      children: therapists.map((therapist) => _buildTherapistCard(therapist)).toList(),
    );
  }

  Widget _buildTherapistCard(Map<String, dynamic> therapist) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TherapistProfilePage(
                doctorName: therapist['name'] as String,
                imageUrl: therapist['image'] as String,
              ),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(therapist['image'] as String),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name, Location, Rating, Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              therapist['name'] as String,
                              style: GoogleFonts.manrope(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              therapist['location'] as String,
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.starRating,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  therapist['rating'].toString(),
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(${therapist['reviews']} reviews)',
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        therapist['price'] as String,
                        style: GoogleFonts.manrope(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Specialties
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (therapist['specialties'] as List<String>).map((specialty) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          specialty,
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Time Slots and See More
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: (therapist['timeSlots'] as List<String>).asMap().entries.map((entry) {
                            final index = entry.key;
                            final timeSlot = entry.value;
                            final isSelected = therapist['selectedSlot'] == index;
                            
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.accent.withOpacity(0.1) : AppColors.background,
                                  border: Border.all(
                                    color: isSelected ? AppColors.accent : AppColors.border,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  timeSlot,
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? AppColors.accent : AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Text(
                        'See more',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.accent,
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
    );
  }

}
