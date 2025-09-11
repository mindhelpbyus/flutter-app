import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OVI',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF171115),
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const OVIDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OVIDashboard extends StatefulWidget {
  const OVIDashboard({super.key});

  @override
  State<OVIDashboard> createState() => _OVIDashboardState();
}

class _OVIDashboardState extends State<OVIDashboard> {
  int selectedNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<String> moodChips = [
    'Anxious',
    'Stressed', 
    'Depressed',
    'Addiction',
    'Relationship',
    'Not Sure'
  ];

  final List<Map<String, String>> upcomingAppointments = [
    {
      'name': 'Dr. Anya Sharma',
      'date': 'Tue, Jul 23 · 10:00 AM',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDOtMvIpbAcU_sCI9NzSZFbQidSwae9_yCeXj4MruJUu7V7I4T2thx-XaVcGA4ncwqSGOjM9i9DV-hZI0ySxjUO7ZlYd64FBOBEuvkrO0WCFHGjj2Gt9da23oFHXjWyHAPoqcu6rw8C8hkCmZM9x5FD5Ec3ECR4FYBVbYxGRYiO0exFE1wdr8xaZSBixJ36NLCRflvcFs2XFlO4eI-vpOgvZ7vz7olWeQUkYN5SgD7D_gB4XU5AaDtax7uxS2OeWOPc9ZnhcteG_bc'
    },
    {
      'name': 'Dr. Varun Verma',
      'date': 'Wed, Jul 24 · 2:00 PM',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAwZM4YIKo65Rl8G0EF8kUbruVag2R40QmimWluJNsrhvD0mgeeGMBx1cwHFHELoZdSDIQIcxx08lHi6ddJnz6Gsyh00pe-RkW6me9giNfGWYPoFrAq69nmD6R0cAWuNq_khGlaw9yG5NZzbdgWyvUMfOJXCLtM7iQ9bQ6ZXiqvAEVmgaU2WpDASmPdd9_NKFZh-3vBU4aNnfyoauv9G3VOU7sCOr3o1FxNfOe4dLw1-YCwYb5aAsCQjnufnQ-HH0RgEoovSe801Pk'
    }
  ];

  final List<Map<String, String>> recommendedTherapists = [
    {
      'name': 'Dr. Zara Kapoor',
      'specialties': 'Anxiety, Depression',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuABxHicQkQgNbBdt7r6bDUbvdkiEePY8uF6ZqUCwbljxKkOluMp4LWTJW-_SQJ3CS_fwsFEskbBp6SR8DIlTqUKDPF-IskqAZLskcickPyHJvSPkOPQU-FFx_dtIw72O2kAIBk9tRBJXThT6phMq-9lnkPUG1tY3B1YPKa72JEN4bmVHEomnu-1VmPYdtcGlqXvRdWbjXT1OnafOyvf9nQc4PPTIbLiUs7g0CnDz-ma1_iwXZr7WTgetaq-D2cHOzAffUBEjaN6IDA'
    },
    {
      'name': 'Dr. Arjun Singh',
      'specialties': 'Stress Management, Relationships',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuD7rEs3Vih81qcwrVLY4BL1LXFKMLmt1Vq7f2_kA9w0mI8aywFtbYMmdsM0yY3jaSa5fmvLsm4600wHJU6eRNYbyQrFkvm8CL_WX0oWTNGdXCpUKg0bPfwzhSiNYEOum05teyrbg0AMd5cfHYA5SLH4755gfhBuuEm24GibFJZSVm9BWdUxCUZOVbgGDWXrNHfomIsCUiBMlkrP86j_c8SOBmq8IfKf7JfgOZoDoygcRHDVa9QCIQzcliBYMhwtFkdCBzq953TZ0d8'
    },
    {
      'name': 'Dr. Maya Patel',
      'specialties': 'Trauma, PTSD',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCFae2HGqQyjmEGRyuefGVo-NFlKz-DjVxM3a42vqA4sJI_cqjajfT9czfC9ruDXzkn2lUHrpdrNAt5ljcdac4PBtvvTv9Ma5KkjU67Kbed0CUwraOmM11JguN3QUDaNPXubHQfVatM2u7QGDEx5UjZ_t1s5GK_4w5cK8coqK-J3KZZLCxvIRVAgMSfcrbJZU1wGDePLOXuqer_wBAM6d9xErktWt4HYFRP2501RsyfO3tYOYqFfDkU7-1Y8qJb46-9SPOczTv_AcE'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with OVI title and notification bell
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 48), // Spacer for centering
                  const Text(
                    'OVI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF171115),
                      letterSpacing: -0.015,
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                        size: 24,
                        color: Color(0xFF171115),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
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
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(
                        Icons.search,
                        size: 24,
                        color: Color(0xFF87647B),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search for therapists',
                          hintStyle: TextStyle(
                            color: Color(0xFF87647B),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF171115),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // How do you feel today section
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      child: Text(
                        'How do you feel today?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF171115),
                          letterSpacing: -0.015,
                        ),
                      ),
                    ),

                    // Mood chips
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: moodChips.map((mood) => _buildMoodChip(mood)).toList(),
                      ),
                    ),

                    // Upcoming Appointments section
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      child: Text(
                        'Upcoming Appointments',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF171115),
                          letterSpacing: -0.015,
                        ),
                      ),
                    ),

                    // Appointments horizontal scroll
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: upcomingAppointments.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: index < upcomingAppointments.length - 1 ? 12 : 0),
                            child: _buildAppointmentCard(upcomingAppointments[index]),
                          );
                        },
                      ),
                    ),

                    // Recommended for you section
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      child: Text(
                        'Recommended for you',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF171115),
                          letterSpacing: -0.015,
                        ),
                      ),
                    ),

                    // Recommended therapists horizontal scroll
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: recommendedTherapists.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: index < recommendedTherapists.length - 1 ? 12 : 0),
                            child: _buildTherapistCard(recommendedTherapists[index]),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
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
                    _buildNavItem(Icons.chat_bubble_outline, 'Chat', 3, false),
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
      ),
    );
  }

  Widget _buildMoodChip(String mood) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0F3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          mood,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF171115),
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(Map<String, String> appointment) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 90, // Video aspect ratio (16:9 approximation)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(appointment['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            appointment['name']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF171115),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            appointment['date']!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color(0xFF87647B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTherapistCard(Map<String, String> therapist) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 120, // 3:4 aspect ratio (160 * 0.75)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(therapist['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            therapist['name']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF171115),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            therapist['specialties']!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color(0xFF87647B),
            ),
          ),
        ],
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
            child: Icon(
              icon,
              size: 24,
              color: isSelected ? const Color(0xFF171115) : const Color(0xFF87647B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
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
