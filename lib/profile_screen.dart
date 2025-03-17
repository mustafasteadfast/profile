import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_profile_screen.dart';
import 'select_language_screen.dart';
import 'help_support_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF64748B),
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.onest(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12), // Padding at the top of the profile
            // Profile section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1),
                ),
              ),
              child: Column(
                children: [
                  // Profile picture with name and phone number in a row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile picture with completion percentage
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Circular progress indicator
                          SizedBox(
                            width: 81.52,
                            height: 81.52,
                            child: CircularProgressIndicator(
                              value: 0.75, // 75% complete
                              strokeWidth: 3,
                              backgroundColor: Colors.grey[200],
                              color: const Color(
                                0xFF00B795,
                              ), // Updated green color
                            ),
                          ),
                          // Profile image
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          // Percentage indicator inside the image
                          Positioned(
                            bottom: 5,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0x80292A2C),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 28.41,
                              height: 15.71,
                              child: Center(
                                child: Text(
                                  '75%',
                                  style: GoogleFonts.onest(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Name and phone number in a column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Text(
                              'Akash Basak',
                              style: GoogleFonts.onest(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Phone number
                            Text(
                              '01626865021',
                              style: GoogleFonts.onest(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // View Profile button
                            SizedBox(
                              width: 84,
                              height: 26,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const MyProfileScreen(),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Color(0xFF00B795),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(
                                    8,
                                    4,
                                    8,
                                    4,
                                  ),
                                ),
                                child: Text(
                                  'View Profile',
                                  style: GoogleFonts.onest(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF00B795),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 12,
            ), // Padding between profile and account section
            // Account section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Account',
                style: GoogleFonts.onest(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            // Saved Addresses
            _buildMenuItem(
              iconAsset: 'assets/images/saved_address.png',
              iconBackground: const Color(0xFFE3F2FD),
              title: 'Saved Addresses',
            ),

            // Saved Promos & Vouchers
            _buildMenuItem(
              iconAsset: 'assets/images/saved_promos.png',
              iconBackground: const Color(0xFFFCE4EC),
              title: 'Saved Promos & Vouchers',
            ),

            // Help & Support
            _buildMenuItem(
              iconAsset: 'assets/images/help\$support.png',
              iconBackground: const Color(0xFFE8F5E9),
              title: 'Help & Support',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpSupportScreen(),
                  ),
                );
              },
            ),

            const SizedBox(
              height: 12,
            ), // Padding between account section and settings section
            // Settings section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Settings',
                style: GoogleFonts.onest(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            // Languages
            _buildMenuItem(
              iconAsset: 'assets/images/languages.png',
              iconBackground: const Color(0xFFE8EAF6),
              title: 'Languages',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectLanguageScreen(),
                  ),
                );
              },
            ),

            // Permissions
            _buildMenuItem(
              iconAsset: 'assets/images/permissions.png',
              iconBackground: const Color(0xFFF3E5F5),
              title: 'Permissions',
            ),

            // Terms & Conditions
            _buildMenuItem(
              iconAsset: 'assets/images/terms&conditions.png',
              iconBackground: const Color(0xFFEFF7FA),
              title: 'Terms & Conditions',
            ),

            // Change Password
            _buildMenuItem(
              iconAsset: 'assets/images/chnage_pass.png',
              iconBackground: const Color(0xFFFFF8E1),
              title: 'Change Password',
            ),

            const SizedBox(height: 12), // Padding between settings and logout
            // Log out
            _buildMenuItem(
              iconAsset: 'assets/images/logout.png',
              iconBackground: const Color(0xFFFFEBEE),
              title: 'Log out',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconAsset,
    required Color iconBackground,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        width: double.infinity, // Will expand to parent width (369 in design)
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side with icon and title
              Row(
                children: [
                  // Icon without background
                  Image.asset(
                    iconAsset,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error_outline,
                        color: Colors.black54,
                        size: 40,
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  // Title
                  Text(
                    title,
                    style: GoogleFonts.onest(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      height: 1.5, // line-height: 24px (16px * 1.5 = 24px)
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
              // Arrow icon
              const Icon(Icons.chevron_right, color: Colors.black45),
            ],
          ),
        ),
      ),
    );
  }
}
