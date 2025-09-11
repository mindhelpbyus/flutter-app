import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'therapist_profile_page.dart';

class OviLandingPage extends StatefulWidget {
  const OviLandingPage({super.key});

  @override
  State<OviLandingPage> createState() => _OviLandingPageState();
}

class _OviLandingPageState extends State<OviLandingPage> {
  int selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
      
      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          const SizedBox(width: 48), // Space for centering
          Expanded(
            child: Text(
              'OVI',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF171115),
                letterSpacing: -0.015,
              ),
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Color(0xFF171115),
                size: 24,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F0F3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                Icons.search,
                color: Color(0xFF87647B),
                size: 24,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for therapists',
                  hintStyle: GoogleFonts.manrope(
                    color: const Color(0xFF87647B),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
                style: GoogleFonts.manrope(
                  color: const Color(0xFF171115),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeelingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            'How do you feel today?',
            style: GoogleFonts.manrope(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
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
    );
  }

  Widget _buildFeelingsChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF171115),
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            'Upcoming Appointments',
            style: GoogleFonts.manrope(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildAppointmentCard(
                'Dr. Anya Sharma',
                'Tue, Jul 23 · 10:00 AM',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDOtMvIpbAcU_sCI9NzSZFbQidSwae9_yCeXj4MruJUu7V7I4T2thx-XaVcGA4ncwqSGOjM9i9DV-hZI0ySxjUO7ZlYd64FBOBEuvkrO0WCFHGjj2Gt9da23oFHXjWyHAPoqcu6rw8C8hkCmZM9x5FD5Ec3ECR4FYBVbYxGRYiO0exFE1wdr8xaZSBixJ36NLCRflvcFs2XFlO4eI-vpOgvZ7vz7olWeQUkYN5SgD7D_gB4XU5AaDtax7uxS2OeWOPc9ZnhcteG_bc',
              ),
              const SizedBox(width: 12),
              _buildAppointmentCard(
                'Dr. Varun Verma',
                'Wed, Jul 24 · 2:00 PM',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAwZM4YIKo65Rl8G0EF8kUbruVag2R40QmimWluJNsrhvD0mgeeGMBx1cwHFHELoZdSDIQIcxx08lHi6ddJnz6Gsyh00pe-RkW6me9giNfGWYPoFrAq69nmD6R0cAWuNq_khGlaw9yG5NZzbdgWyvUMfOJXCLtM7iQ9bQ6ZXiqvAEVmgaU2WpDASmPdd9_NKFZh-3vBU4aNnfyoauv9G3VOU7sCOr3o1FxNfOe4dLw1-YCwYb5aAsCQjnufnQ-HH0RgEoovSe801Pk',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentCard(String doctorName, String dateTime, String imageUrl) {
    return GestureDetector(
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
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 160,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              doctorName,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF171115),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dateTime,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF87647B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            'Recommended for you',
            style: GoogleFonts.manrope(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildRecommendedCard(
                'Dr. Zara Kapoor',
                'Anxiety, Depression',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuABxHicQkQgNbBdt7r6bDUbvdkiEePY8uF6ZqUCwbljxKkOluMp4LWTJW-_SQJ3CS_fwsFEskbBp6SR8DIlTqUKDPF-IskqAZLskcickPyHJvSPkOPQU-FFx_dtIw72O2kAIBk9tRBJXThT6phMq-9lnkPUG1tY3B1YPKa72JEN4bmVHEomnu-1VmPYdtcGlqXvRdWbjXT1OnafOyvf9nQc4PPTIbLiUs7g0CnDz-ma1_iwXZr7WTgetaq-D2cHOzAffUBEjaN6IDA',
              ),
              const SizedBox(width: 12),
              _buildRecommendedCard(
                'Dr. Arjun Singh',
                'Stress Management, Relationships',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD7rEs3Vih81qcwrVLY4BL1LXFKMLmt1Vq7f2_kA9w0mI8aywFtbYMmdsM0yY3jaSa5fmvLsm4600wHJU6eRNYbyQrFkvm8CL_WX0oWTNGdXCpUKg0bPfwzhSiNYEOum05teyrbg0AMd5cfHYA5SLH4755gfhBuuEm24GibFJZSVm9BWdUxCUZOVbgGDWXrNHfomIsCUiBMlkrP86j_c8SOBmq8IfKf7JfgOZoDoygcRHDVa9QCIQzcliBYMhwtFkdCBzq953TZ0d8',
              ),
              const SizedBox(width: 12),
              _buildRecommendedCard(
                'Dr. Maya Patel',
                'Trauma, PTSD',
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCFae2HGqQyjmEGRyuefGVo-NFlKz-DjVxM3a42vqA4sJI_cqjajfT9czfC9ruDXzkn2lUHrpdrNAt5ljcdac4PBtvvTv9Ma5KkjU67Kbed0CUwraOmM11JguN3QUDaNPXubHQfVatM2u7QGDEx5UjZ_t1s5GK_4w5cK8coqK-J3KZZLCxvIRVAgMSfcrbJZU1wGDePLOXuqer_wBAM6d9xErktWt4HYFRP2501RsyfO3tYOYqFfDkU7-1Y8qJb46-9SPOczTv_AcE',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedCard(String doctorName, String specialties, String imageUrl) {
    return GestureDetector(
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
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 160,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    doctorName,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF171115),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    specialties,
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF87647B),
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
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFF4F0F3), width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', 0, true),
                  _buildNavItem(Icons.calendar_today_outlined, 'Appointments', 1, false),
                  _buildNavItem(Icons.people_outline, 'Explore', 2, false),
                  _buildNavItem(Icons.forum_outlined, 'Chat', 3, false),
                  _buildNavItem(Icons.person_outline, 'Profile', 4, false),
                ],
              ),
            ),
            Container(
              height: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNavIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            child: Icon(
              isSelected && icon == Icons.home ? Icons.home : icon,
              color: isSelected ? const Color(0xFF171115) : const Color(0xFF87647B),
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xFF171115) : const Color(0xFF87647B),
              letterSpacing: 0.015,
            ),
          ),
        ],
      ),
    );
  }
}
