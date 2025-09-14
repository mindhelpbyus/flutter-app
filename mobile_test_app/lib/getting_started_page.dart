import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/app_colors.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  // Hero Image Section
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuD-ZSjHiLmKxB3zZHrnlNC5rasNp0Piq4B0Qz66t9uJf-t2zU-YJ9IdqTitpnHhR_RN3SEI_7oRmwY9Qvsh0IzIBa6pXeIVvwunhP2bzQ36unqxJa5G_VJAvdmWbyNYZW17mOIvu28133FhhLq7xbkxdwBrmvXIkCMMBAtHdxgQZrVJY9xk1TBtoZnFq4gJ77AqB2o876xxCRuYEyGwoWRfFmyjqLVfyinTzCaPfOvnFV9bLiWPW9njs7b4E-J5yVeAvcaBak2dXbI',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  // Title Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Text(
                      'Welcome to OVI',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF171115),
                        letterSpacing: -0.5,
                        height: 1.2,
                      ),
                    ),
                  ),
                  
                  // Description Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Text(
                      'Find the right therapist for you, schedule video appointments, chat with doctors, and explore session packages.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF171115),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Bottom Section with Button
            Column(
              children: [
                // Get Started Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to main app or next screen
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MindfulMomentsHome(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF2A6D9),
                        foregroundColor: const Color(0xFF171115),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Bottom spacing
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Import the existing home page
class MindfulMomentsHome extends StatefulWidget {
  const MindfulMomentsHome({super.key});

  @override
  State<MindfulMomentsHome> createState() => _MindfulMomentsHomeState();
}

class _MindfulMomentsHomeState extends State<MindfulMomentsHome> {
  String? selectedMood;
  int selectedNavIndex = 0;

  final List<String> moods = ['Happy', 'Calm', 'Neutral', 'Anxious', 'Sad'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Mindful Moments',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      size: 28,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Mood Selection Section
                    const Text(
                      'How are you feeling today?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Mood Chips
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: moods
                          .map((mood) => _buildMoodChip(mood))
                          .toList(),
                    ),

                    const SizedBox(height: 32),

                    // Quick Mindfulness Section
                    const Text(
                      'Quick Mindfulness',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Mindfulness Cards
                    _buildMindfulnessCard(
                      duration: '5 min',
                      title: 'Breathing Exercise',
                      description:
                          'Reduce stress with a simple breathing technique.',
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAKfgDv0cfAyyZfulheSPqDEsfWA42DQEbPv4v9q9ma3RQeYP68sARnjWBWKAEcerDzwvK_eNNyRB2purwePQ7FgTwFMNtiKRNQ3eZ5udZ7LWRA9kz7SivD4yoDn47QZogk2RUok5JNRht0naDDz7qOOTeR27pQOu_AzWduFWMBSlO4YyTq5pX9Gww9Z3Iz5BfsgIpWFIQN0O9RCwiamnoaljxCCmSFDI30PpDx_EgWbmTF-VG-NtJeUUpGzcaMvFO9AjbdcwOhZaI',
                    ),
                    const SizedBox(height: 16),
                    _buildMindfulnessCard(
                      duration: '10 min',
                      title: 'Gratitude Journaling',
                      description:
                          'Reflect on the positive aspects of your day.',
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuA8du8QHhWYlDLhMUEtwl0SHFmTzaihAi1pTwci21tBfNm1a9aWdPFmOrLs9XNsf-VfLFqRFH3JbhBj8XD0lt5U_pyYBku8tgJegYrnXhLvDiQgygZQ3KIBWfUF70wH-QDLa-MZYn5LHdwlqN-oky6Thl34jaqMT_ITOETsw39dRuDpknB5fZIsExl9jtrxIdbhS4Zkdo3jMsAhBBtsmPcMz0naScPuYSN9jSpSt13xKvVAvUrHUEAmtCI0ys5BPzlDT169QBgp5UM',
                    ),

                    const SizedBox(height: 32),

                    // Guided Meditations Section
                    const Text(
                      'Guided Meditations',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Meditation Cards Horizontal Scroll
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 0),
                        children: [
                          _buildMeditationCard(
                            title: 'Morning Calm',
                            description: 'Start your day with peace.',
                            imageUrl:
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuB9dCqTS5iMmH19icu1Rh3fJQ2M-Yz9Ijfp3Gem9lyrYG2tP8kuL_D-bQ5V9KbqOiTbCqyVbrmDvGTPaO0L4db6x2ReCQGxziMXEZrZ1ueJz9Et0300XCpulkTIE2WNPb0M0hY96TdllmhrFDkTS8RruVzltT9Bouf4zGPUInFstJj33XMaMe5gU4bZNZ_OmJNSXEkdNKkdS3oLV9Y7QBmBIe3VRBlx1zHHDBVohkg0YodD0KdMT2gYP5OD2TCOdzkMvN_wfUjP670',
                          ),
                          const SizedBox(width: 16),
                          _buildMeditationCard(
                            title: 'Nature Sounds',
                            description: 'Relax with nature\'s sounds.',
                            imageUrl:
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCqRpRxh6Uor_O9QEn_nGHa4-4Y4ToVqiTna5-k_GSI-47qvmDmP-1qudv-oR5N5fdGGo-3OBV5L0_oqRuJtdYj1D2toEN-l8KZcdNB3X_j3T8T3-88zoSizMMl5uGIdMMtBb6DAW3YBCHPS0uUB47AkC5SeDQdJ2ieE5hf2N259srBcHRdiUXhp1IuwHZZERLK7JuVYkm3XWPOcx7DRU7zm9c8JQ25cJIbhF7OLCN-GMLOqEPQWP_BneBG81mXOMv2rckuAKZZYqQ',
                          ),
                          const SizedBox(width: 16),
                          _buildMeditationCard(
                            title: 'Mindful Walk',
                            description: 'Focus on the present moment.',
                            imageUrl:
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuBifMq9wY9e6iaeG4SwCs09YPH2va1y0xvFWM4NVERcKyp5Z6v1SqBkkmdX99uN0Ub-NfM4cpdFjHjiuFuONSEF-0y0xbv1aEVetbereGs_wmco-vlDbjNkyKA-Exa94eH0Qu1L1xFZj77r5uw8FXahasxR01ug9f6WvfhD0mmFjNJTJtOrmsnLVIEkgR1PECANBSVb5H3uxwerw1FE5mTiZliuQWWSmCP_sw1Fcc1maGEQnd9Vd1EJTTUPQXMw165qTxCxar7ddPA',
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32), // Adequate bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          border: Border(top: BorderSide(color: Color(0xFFE2E8F0), width: 1)),
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 3,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Dashboard', 0),
                _buildNavItem(Icons.search, 'Discover', 1),
                _buildNavItem(Icons.trending_up, 'Progress', 2),
                _buildNavItem(Icons.person, 'Profile', 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodChip(String mood) {
    final isSelected = selectedMood == mood;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = isSelected ? null : mood;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blueAccent : AppColors.background,
          border: Border.all(
            color: isSelected
                ? const Color(0xFF3B82F6)
                : const Color(0xFFCBD5E1),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          mood,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.textOnAccent : AppColors.grayText,
          ),
        ),
      ),
    );
  }

  Widget _buildMindfulnessCard({
    required String duration,
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeditationCard({
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 160,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedNavIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNavIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color(0xFF3B82F6)
                : const Color(0xFF64748B),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? const Color(0xFF3B82F6)
                  : const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}
