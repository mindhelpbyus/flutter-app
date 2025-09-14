import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/bottom_navigation_bar.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Details Section
                    _buildUserDetailsSection(),
                    
                    // Payment Methods Section
                    _buildPaymentMethodsSection(),
                    
                    // Billing History Section
                    _buildBillingHistorySection(),
                    
                    // Emergency Contact Section
                    _buildEmergencyContactSection(),
                    
                    // Account Settings Section
                    _buildAccountSettingsSection(),
                    
                    // Footer Note
                    _buildFooterNote(),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 4),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        'Profile',
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF171115),
          letterSpacing: -0.015,
        ),
      ),
    );
  }

  Widget _buildUserDetailsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // User Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1693035730007-fbc2c14c6814?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwcm9mZXNzaW9uYWwlMjBtYW4lMjBhdmF0YXJ8ZW58MXx8fHwxNzU3NDk1NDkyfDA&ixlib=rb-4.1.0&q=80&w=1080'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ethan Rodriguez',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF171115),
                    letterSpacing: -0.015,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'ethan.rodriguez@email.com',
                  style: GoogleFonts.manrope(
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
    );
  }

  Widget _buildPaymentMethodsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Methods',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF171115),
                  letterSpacing: -0.015,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Add New',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFB34CE6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Payment Method Items
          Column(
            children: [
              _buildPaymentMethodItem(
                icon: Icons.credit_card,
                title: 'Credit Card',
                subtitle: 'Visa •••• 4532 • Expires 12/26',
                hasDefaultBadge: true,
              ),
              const SizedBox(height: 12),
              _buildPaymentMethodItem(
                icon: Icons.account_balance,
                title: 'Bank Account',
                subtitle: 'Chase Bank •••• 7890',
                hasDefaultBadge: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool hasDefaultBadge,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F0F3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF171115),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF171115),
                        ),
                      ),
                      if (hasDefaultBadge) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB34CE6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Default',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF87647B),
                    ),
                  ),
                ],
              ),
            ),
            // Chevron
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF87647B),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingHistorySection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Billing History',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF171115),
                  letterSpacing: -0.015,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFB34CE6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Billing History Items
          Column(
            children: [
              _buildBillingHistoryItem(
                title: 'Therapy Session - Dr. Anya Sharma',
                subtitle: 'Dec 15, 2024 • Paid',
                amount: '\$120',
              ),
              const SizedBox(height: 12),
              _buildBillingHistoryItem(
                title: '3 Session Package - Dr. Anya Sharma',
                subtitle: 'Dec 1, 2024 • Paid',
                amount: '\$306',
              ),
              const SizedBox(height: 12),
              _buildBillingHistoryItem(
                title: 'Therapy Session - Dr. Aisha Kapoor',
                subtitle: 'Nov 15, 2024 • Paid',
                amount: '\$110',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBillingHistoryItem({
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F0F3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.attach_money,
                color: Color(0xFF171115),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF171115),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF87647B),
                    ),
                  ),
                ],
              ),
            ),
            // Amount
            Text(
              amount,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF171115),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContactSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Emergency Contact',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF171115),
                  letterSpacing: -0.015,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFB34CE6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Emergency Contact Item
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F0F3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF171115),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maria Rodriguez',
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF171115),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Sister • +1 (555) 987-6543',
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF87647B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Chevron
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0xFF87647B),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettingsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Text(
            'Account Settings',
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171115),
              letterSpacing: -0.015,
            ),
          ),
          const SizedBox(height: 12),
          // Account Settings Items
          Column(
            children: [
              _buildAccountSettingItem(
                icon: Icons.person,
                title: 'Personal Information',
                subtitle: 'Update your profile details',
              ),
              const SizedBox(height: 12),
              _buildAccountSettingItem(
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Manage your notification preferences',
              ),
              const SizedBox(height: 12),
              _buildAccountSettingItem(
                icon: Icons.security,
                title: 'Privacy & Security',
                subtitle: 'Control your privacy settings',
              ),
              const SizedBox(height: 12),
              _buildAccountSettingItem(
                icon: Icons.settings,
                title: 'App Settings',
                subtitle: 'Customize your app experience',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F0F3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF171115),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF171115),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF87647B),
                    ),
                  ),
                ],
              ),
            ),
            // Chevron
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF87647B),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterNote() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Text(
        'Product of Bedrock Health Solutions',
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF87647B),
        ),
      ),
    );
  }

}
