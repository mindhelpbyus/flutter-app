import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/bottom_navigation_bar.dart';

class BookAppointmentPage extends StatefulWidget {
  final String doctorName;
  final String imageUrl;
  
  const BookAppointmentPage({
    super.key,
    required this.doctorName,
    required this.imageUrl,
  });

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  String visitType = 'in-person';
  int selectedDate = 11; // Monday is selected by default
  String selectedTime = '10:30 AM';
  String paymentMethod = 'upi';
  bool acceptedTerms = true;

  // Color scheme matching the app's existing colors
  static const Color primaryColor = Color(0xFFE64CB3); // Pink color from app
  static const Color secondaryColor = Color(0xFFF3F0F4);
  static const Color textPrimary = Color(0xFF161117);
  static const Color textSecondary = Color(0xFF7E6487);
  static const Color borderColor = Color(0xFFE3DCE5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Doctor Profile Section
                      _buildDoctorProfile(),
                      
                      const SizedBox(height: 24),
                      
                      // Visit Type Section
                      _buildVisitTypeSection(),
                      
                      const SizedBox(height: 24),
                      
                      // Date Selection Section
                      _buildDateSelectionSection(),
                      
                      const SizedBox(height: 24),
                      
                      // Time Selection Section
                      _buildTimeSelectionSection(),
                      
                      const SizedBox(height: 24),
                      
                      // Payment Details Section
                      _buildPaymentDetailsSection(),
                      
                      const SizedBox(height: 100), // Space for bottom navigation
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomSection(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF1F1F1),
            width: 1,
          ),
        ),
      ),
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
                color: textPrimary,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Book Appointment',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildDoctorProfile() {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doctorName,
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Psychologist',
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVisitTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Visit Type',
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildVisitTypeOption('in-person', 'In-person'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildVisitTypeOption('video', 'Video visit'),
            ),
          ],
        ),
        if (visitType == 'in-person') ...[
          const SizedBox(height: 16),
          _buildAddressSection(),
        ],
      ],
    );
  }

  Widget _buildVisitTypeOption(String value, String label) {
    final isSelected = visitType == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          visitType = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? primaryColor : borderColor,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? primaryColor.withOpacity(0.05) : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? primaryColor : borderColor,
                  width: 2,
                ),
                color: isSelected ? primaryColor : Colors.white,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.circle,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.manrope(
              fontSize: 16,
              color: textSecondary,
            ),
            children: [
              TextSpan(
                text: 'Address: ',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              const TextSpan(
                text: '1234 8th st, Villivakkam, Chennai 600089',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: const Color(0xFFF5F5F5),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 48,
                      color: Color(0xFFCCCCCC),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Map View',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelectionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select Date',
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            Row(
              children: [
                Text(
                  'March 2024',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.calendar_month,
                  color: primaryColor,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildDateButton('Sun', 10, false),
              _buildDateButton('Mon', 11, true),
              _buildDateButton('Tue', 12, false),
              _buildDateButton('Today', 13, false),
              _buildDateButton('Thu', 14, false),
              _buildDateButton('Fri', 15, false),
              _buildDateButton('Sat', 16, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateButton(String day, int date, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
      },
      child: Container(
        width: 64,
        height: 80,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? primaryColor : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? primaryColor.withOpacity(0.05) : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? primaryColor : textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date.toString(),
              style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.bold,
                color: isSelected ? primaryColor : textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelectionSection() {
    final timeSlots = [
      '09:00 AM', '09:30 AM', '10:00 AM',
      '10:30 AM', '02:00 PM', '02:30 PM',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Time',
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            final time = timeSlots[index];
            final isSelected = selectedTime == time;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTime = time;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? primaryColor : borderColor,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: isSelected ? primaryColor.withOpacity(0.05) : Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  time,
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? primaryColor : textPrimary,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPaymentDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Details',
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        // Payment Summary
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Consultation Fee',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: textSecondary,
                    ),
                  ),
                  Text(
                    '₹1,500',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking Fee',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: textSecondary,
                    ),
                  ),
                  Text(
                    '₹50',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: borderColor,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textPrimary,
                    ),
                  ),
                  Text(
                    '₹1,550',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Payment Method
        Text(
          'Payment Method',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        
        _buildPaymentMethodOption('upi', 'UPI', Icons.account_balance_wallet),
        const SizedBox(height: 12),
        _buildPaymentMethodOption('card', 'Credit/Debit Card', Icons.credit_card),
        
        const SizedBox(height: 24),
        
        // Terms and Conditions
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  acceptedTerms = !acceptedTerms;
                });
              },
              child: Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: acceptedTerms ? primaryColor : borderColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: acceptedTerms ? primaryColor : Colors.white,
                ),
                child: acceptedTerms
                    ? const Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    color: textSecondary,
                  ),
                  children: [
                    const TextSpan(
                      text: 'I have read and accept the ',
                    ),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Cancellation Policy',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodOption(String value, String label, IconData icon) {
    final isSelected = paymentMethod == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          paymentMethod = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? primaryColor : borderColor,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? primaryColor.withOpacity(0.05) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: textSecondary,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textPrimary,
              ),
            ),
            const Spacer(),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? primaryColor : borderColor,
                  width: 2,
                ),
                color: isSelected ? primaryColor : Colors.white,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.circle,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Pay Now Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: acceptedTerms ? () {
                    // Handle payment
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Payment processing...'),
                        backgroundColor: primaryColor,
                      ),
                    );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor: borderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Pay Now',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            
            // Bottom Navigation
            CustomBottomNavigationBar(
              selectedIndex: 1, // My Visits tab
              onTap: (index) {
                // Handle navigation
                switch (index) {
                  case 0:
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    break;
                  case 1:
                    // Already on My Visits related page
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/explore');
                    break;
                  case 3:
                    // Chat functionality
                    break;
                  case 4:
                    Navigator.pushNamed(context, '/profile');
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
