import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/app_colors.dart';
import 'book_appointment_page.dart';
import 'chat_page.dart';

class TherapistProfilePage extends StatefulWidget {
  final String doctorName;
  final String imageUrl;
  
  const TherapistProfilePage({
    super.key,
    required this.doctorName,
    required this.imageUrl,
  });

  @override
  State<TherapistProfilePage> createState() => _TherapistProfilePageState();
}

class _TherapistProfilePageState extends State<TherapistProfilePage> {
  int selectedDate = 5;
  
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Section
                    _buildProfileSection(),
                    
                    // Specialization Section
                    _buildSpecializationSection(),
                    
                    // About Section
                    _buildAboutSection(),
                    
                    // Availability Section
                    _buildAvailabilitySection(),
                    
                    // Rates Section
                    _buildRatesSection(),
                    
                    // Session Packages Section
                    _buildSessionPackagesSection(),
                    
                    // Reviews Section
                    _buildReviewsSection(),
                    
                    // Individual Reviews
                    _buildIndividualReviews(),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            
            // Bottom Action Buttons
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF171115),
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 48),
              child: Text(
                'Therapist Profile',
                textAlign: TextAlign.center,
                style: GoogleFonts.splineSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF171115),
                  letterSpacing: -0.015,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile Image
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Doctor Info
          Column(
            children: [
              Text(
                widget.doctorName,
                style: GoogleFonts.splineSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF171115),
                  letterSpacing: -0.015,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Clinical Psychologist',
                style: GoogleFonts.splineSans(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF87647B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                '10+ years of experience',
                style: GoogleFonts.splineSans(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF87647B),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecializationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Specialization',
            style: GoogleFonts.splineSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildSpecializationChip('Anxiety'),
              _buildSpecializationChip('Depression'),
              _buildSpecializationChip('Relationship Issues'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecializationChip(String text) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0F3),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.splineSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF171115),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'About',
            style: GoogleFonts.splineSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
          child: Text(
            'Dr. Sharma is a licensed clinical psychologist with over 10 years of experience helping individuals navigate life\'s challenges. She specializes in anxiety, depression, and relationship issues, using evidence-based approaches to support her patients\' well-being.',
            style: GoogleFonts.splineSans(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF171115),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailabilitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Availability',
            style: GoogleFonts.splineSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 336),
            child: Column(
              children: [
                // Calendar Header
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Color(0xFF171115),
                            size: 18,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'July 2024',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.splineSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF171115),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chevron_right,
                            color: Color(0xFF171115),
                            size: 18,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Calendar Grid
                _buildCalendarGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    final weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    
    return Column(
      children: [
        // Week day headers
        Row(
          children: weekDays.map((day) => Expanded(
            child: Container(
              height: 48,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  day,
                  style: GoogleFonts.splineSans(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF171115),
                    letterSpacing: 0.015,
                  ),
                ),
              ),
            ),
          )).toList(),
        ),
        
        // Calendar dates
        _buildCalendarRows(),
      ],
    );
  }

  Widget _buildCalendarRows() {
    return Column(
      children: [
        // First row (starts on Wednesday)
        Row(
          children: [
            const Expanded(child: SizedBox()),
            const Expanded(child: SizedBox()),
            const Expanded(child: SizedBox()),
            _buildDateButton(1),
            _buildDateButton(2),
            _buildDateButton(3),
            _buildDateButton(4),
          ],
        ),
        // Second row
        Row(
          children: [
            _buildDateButton(5, isSelected: true),
            _buildDateButton(6),
            _buildDateButton(7),
            _buildDateButton(8),
            _buildDateButton(9),
            _buildDateButton(10),
            _buildDateButton(11),
          ],
        ),
        // Third row
        Row(
          children: [
            _buildDateButton(12),
            _buildDateButton(13),
            _buildDateButton(14),
            _buildDateButton(15),
            _buildDateButton(16),
            _buildDateButton(17),
            _buildDateButton(18),
          ],
        ),
        // Fourth row
        Row(
          children: [
            _buildDateButton(19),
            _buildDateButton(20),
            _buildDateButton(21),
            _buildDateButton(22),
            _buildDateButton(23),
            _buildDateButton(24),
            _buildDateButton(25),
          ],
        ),
        // Fifth row
        Row(
          children: [
            _buildDateButton(26),
            _buildDateButton(27),
            _buildDateButton(28),
            _buildDateButton(29),
            _buildDateButton(30),
            const Expanded(child: SizedBox()),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildDateButton(int date, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        height: 48,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = date;
            });
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.accent : AppColors.materialTransparent,
            ),
            alignment: Alignment.center,
            child: Text(
              date.toString(),
              style: GoogleFonts.splineSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.textOnAccent : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Rates',
            style: GoogleFonts.splineSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
          child: Text(
            '\$120 per hour',
            style: GoogleFonts.splineSans(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF171115),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSessionPackagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Session Packages',
            style: GoogleFonts.splineSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        _buildSessionPackageCard(
          'Popular',
          '3 Sessions',
          'Save 15% on three sessions',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC7Yp7IpwzKwiruHgDpmkImc2g7Fi7Hf9t4ca8mavrXzfqK_9K-v-wA4NAs_LUQhM4QMRrElsJg2lhLLb0XyPMKiU_YoBcP3sFJo2qAmqmB8WDbTY_EhRLfp4Wnm9-o1WjaKoMKUcXY4f-j7VxtkIL_Xp29SPyzV1ED0V8zLf3FoOYj1CaE83eC1Y2KNPVx6k7qW53BzrW-subrpf4UBEu19xz1-O_LYq_wLgg2kcyJrEUu6ove4evIuSKa6Ojzj4wLTpRXG8Gr07c',
          showPopular: true,
        ),
        _buildSessionPackageCard(
          '',
          '5 Sessions',
          'Save 20% on five sessions',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDbhnoz27nwDJpuOfqWybOHGG-3_Bx-gREs4z5PWn-NG6XnhMK0NBdBovyFyFIrYqxFqR3lCvNsftUGA0sVXsdhkhEoQVLcwdgqVutvDztX1dzLlaBjJ14B2HxyQvZmpOopAKXo8LhFUlel6M4RDohTo6c2ZatT22gWBsP6ccIshLvcPRprPOnZ11_SaDwXE2vcqWWZDYBU-c2Q9GBYzeMPMwPxEARQkhwin48O6gtfb_06g-4LzhfNdkVUcplqeV0vQcDkj5PvIKA',
          showPopular: false,
        ),
      ],
    );
  }

  Widget _buildSessionPackageCard(String popular, String title, String description, String imageUrl, {required bool showPopular}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showPopular)
                      Text(
                        popular,
                        style: GoogleFonts.splineSans(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF87647B),
                        ),
                      ),
                    if (showPopular) const SizedBox(height: 4),
                    Text(
                      title,
                      style: GoogleFonts.splineSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF171115),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: GoogleFonts.splineSans(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF87647B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F0F3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Select',
                    style: GoogleFonts.splineSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF171115),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Reviews',
            style: GoogleFonts.splineSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rating Summary
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.8',
                    style: GoogleFonts.splineSans(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF171115),
                      letterSpacing: -0.033,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ...List.generate(4, (index) => const Padding(
                        padding: EdgeInsets.only(right: 2),
                        child: Icon(
                          Icons.star,
                          color: Color(0xFF171115),
                          size: 18,
                        ),
                      )),
                      const Padding(
                        padding: EdgeInsets.only(right: 2),
                        child: Icon(
                          Icons.star_border,
                          color: Color(0xFF171115),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '250 reviews',
                    style: GoogleFonts.splineSans(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF171115),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(width: 32),
              
              // Rating Breakdown
              Expanded(
                child: Column(
                  children: [
                    _buildRatingBar(5, 0.7, '70%'),
                    _buildRatingBar(4, 0.2, '20%'),
                    _buildRatingBar(3, 0.05, '5%'),
                    _buildRatingBar(2, 0.03, '3%'),
                    _buildRatingBar(1, 0.02, '2%'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBar(int stars, double percentage, String percentageText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              stars.toString(),
              style: GoogleFonts.splineSans(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF171115),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFE5DCE2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF171115),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            child: Text(
              percentageText,
              textAlign: TextAlign.right,
              style: GoogleFonts.splineSans(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF87647B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndividualReviews() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildReviewCard(
            'Priya Patel',
            '2 weeks ago',
            5,
            'Dr. Sharma is an exceptional therapist. She is empathetic, insightful, and has helped me tremendously in managing my anxiety. I highly recommend her!',
            15,
            2,
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBZhtrIpUFwbGm3C0fQa11mPh_T6wSKR1PmF4QgFGUQSiO3S0sIuWXCRhs3CVieaSNBubxlLM6l_a9WiPgg7IHfJychFun2C4q1M9k873KdUO_vkjUH5GkHMysPSYyamlNzT7HaDTUoCX-qLJioDWAABdNdXklbKG-lJTrzQsyT83ZSXFiSlUE-ARG8A8-gZm8nbEt5AKekNR5vWi-CFXiNBzmBuC29qXMFUlZX9XGXK4NzzsB6f8nAi7Ce0_MrKLkhGESxJjSwhV4',
          ),
          const SizedBox(height: 32),
          _buildReviewCard(
            'Arjun Singh',
            '1 month ago',
            4,
            'Dr. Sharma is a good listener and provides practical advice. I found our sessions helpful, although I wish we had more time to delve deeper into certain issues.',
            8,
            1,
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAmr9wdEYKlUuUL6s7_L-TfTbuvbGEi7V3AOZ7BPCwt1koTt7QqGPrDFkWSJKQ8niEzp7d8hp9HEzmwDC0Ux4omPJIXVbq41ByDMXpVKqRa3ntj6Zgkxng6q8vjvCu7l3LYDR2qY6bJEg9CrWOWqeiK2QIyu1WMf14mIKZIrZNfiYBftHbTorE397v-bd3JUCURjkdyHAiauzn6J2UDtbg1Uskb3i7niTprVOwyHXTiftbMsZ0STaQiizTAGONuiyygGIo0ahol2Wg',
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(String name, String timeAgo, int rating, String review, int likes, int dislikes, String avatarUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(avatarUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.splineSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF171115),
                    ),
                  ),
                  Text(
                    timeAgo,
                    style: GoogleFonts.splineSans(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF87647B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            ...List.generate(rating, (index) => const Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.star,
                color: Color(0xFF171115),
                size: 20,
              ),
            )),
            if (rating < 5)
              ...List.generate(5 - rating, (index) => const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(
                  Icons.star_border,
                  color: Color(0xFFCDBCC7),
                  size: 20,
                ),
              )),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          review,
          style: GoogleFonts.splineSans(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF171115),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.thumb_up_outlined,
                  color: Color(0xFF87647B),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  likes.toString(),
                  style: GoogleFonts.splineSans(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF87647B),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 36),
            Row(
              children: [
                const Icon(
                  Icons.thumb_down_outlined,
                  color: Color(0xFF87647B),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  dislikes.toString(),
                  style: GoogleFonts.splineSans(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF87647B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomActions() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookAppointmentPage(
                              doctorName: widget.doctorName,
                              imageUrl: widget.imageUrl,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE64CB3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Book Appointment',
                          style: GoogleFonts.splineSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textOnAccent,
                            letterSpacing: 0.015,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              doctorName: widget.doctorName,
                              doctorImageUrl: widget.imageUrl,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F0F3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Chat',
                          style: GoogleFonts.splineSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF171115),
                            letterSpacing: 0.015,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              color: AppColors.background,
            ),
          ],
        ),
      ),
    );
  }
}
