import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../config/constants.dart';
import '../utils/responsive.dart';
import '../widgets/common/navbar.dart';
import '../widgets/common/footer.dart';
import '../widgets/common/section_title.dart';
import '../widgets/common/animated_button.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Column(
        children: [
          const Navbar(currentIndex: 3),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.getHorizontalPadding(context),
                      vertical: 60,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryGreen.withOpacity(0.05),
                          AppTheme.primaryBlue.withOpacity(0.05),
                        ],
                      ),
                    ),
                    child: const SectionTitle(
                      title: 'Get In Touch',
                      subtitle:
                          'Have a question? Want to place an order? We\'d love to hear from you!',
                    ),
                  ),

                  // Contact Content
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.getHorizontalPadding(context),
                      vertical: 60,
                    ),
                    child: isMobile
                        ? _buildMobileContactLayout(context)
                        : _buildDesktopContactLayout(context),
                  ),

                  // Social Media Section
                  _buildSocialSection(context),

                  // WhatsApp CTA
                  _buildWhatsAppCTA(context),

                  const SizedBox(height: 40),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopContactLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactInfo()),
        const SizedBox(width: 40),
        Expanded(child: _buildContactForm(context)),
      ],
    );
  }

  Widget _buildMobileContactLayout(BuildContext context) {
    return Column(
      children: [
        _buildContactInfo(),
        const SizedBox(height: 40),
        _buildContactForm(context),
      ],
    );
  }

  Widget _buildContactInfo() {
    final contactItems = [
      {
        'icon': Icons.location_on,
        'title': 'Visit Us',
        'info': AppConstants.address,
        'color': AppTheme.primaryRed,
      },
      {
        'icon': Icons.phone,
        'title': 'Call Us',
        'info': AppConstants.phone,
        'color': AppTheme.primaryGreen,
      },
      {
        'icon': Icons.email,
        'title': 'Email Us',
        'info': AppConstants.email,
        'color': AppTheme.primaryBlue,
      },
      {
        'icon': Icons.access_time,
        'title': 'Business Hours',
        'info': 'Mon - Sat: 10:00 AM - 9:00 PM',
        'color': AppTheme.primaryOrange,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppTheme.primaryBlue, AppTheme.primaryPurple],
          ).createShader(bounds),
          child: const Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Reach out to us through any of these channels',
          style: TextStyle(fontSize: 15, color: AppTheme.textGrey),
        ),
        const SizedBox(height: 30),
        ...contactItems.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _buildContactTile(
              item['icon'] as IconData,
              item['title'] as String,
              item['info'] as String,
              item['color'] as Color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactTile(
    IconData icon,
    String title,
    String info,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                info,
                style: const TextStyle(fontSize: 14, color: AppTheme.textGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send us a Message',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField('Your Name', Icons.person, false),
          const SizedBox(height: 16),
          _buildTextField('Phone Number', Icons.phone, false),
          const SizedBox(height: 16),
          _buildTextField('Email Address', Icons.email, false),
          const SizedBox(height: 16),
          _buildTextField('Your Message', Icons.message, true),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AnimatedButton(
              text: 'Send Message',
              icon: Icons.send,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Thank you! We\'ll get back to you soon. 😊',
                    ),
                    backgroundColor: AppTheme.primaryGreen,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              gradientColors: const [
                AppTheme.primaryBlue,
                AppTheme.primaryPurple,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, bool isMultiline) {
    return TextField(
      maxLines: isMultiline ? 4 : 1,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: isMultiline
            ? null
            : Icon(icon, color: AppTheme.primaryBlue),
        filled: true,
        fillColor: AppTheme.backgroundLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildSocialSection(BuildContext context) {
    final socials = [
      {
        'name': 'Facebook',
        'icon': Icons.facebook,
        'color': const Color(0xFF1877F2),
        'handle': '@millatfashion',
      },
      {
        'name': 'Instagram',
        'icon': Icons.camera_alt,
        'color': const Color(0xFFE4405F),
        'handle': '@millatfashion',
      },
      {
        'name': 'WhatsApp',
        'icon': Icons.chat,
        'color': const Color(0xFF25D366),
        'handle': AppConstants.phone,
      },
      {
        'name': 'TikTok',
        'icon': Icons.music_note,
        'color': const Color(0xFF000000),
        'handle': '@millatfashion',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 60,
      ),
      color: Colors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Follow Us',
            subtitle:
                'Stay updated with our latest collections on social media',
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = Responsive.isMobile(context);
              if (isMobile) {
                return Column(
                  children: socials
                      .map(
                        (s) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _buildSocialCard(
                            s['name'] as String,
                            s['icon'] as IconData,
                            s['color'] as Color,
                            s['handle'] as String,
                          ),
                        ),
                      )
                      .toList(),
                );
              }
              return Row(
                children: socials
                    .map(
                      (s) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _buildSocialCard(
                            s['name'] as String,
                            s['icon'] as IconData,
                            s['color'] as Color,
                            s['handle'] as String,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialCard(
    String name,
    IconData icon,
    Color color,
    String handle,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            handle,
            style: const TextStyle(fontSize: 13, color: AppTheme.textGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatsAppCTA(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 30,
      ),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF25D366), Color(0xFF128C7E)],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF25D366).withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.chat, color: Colors.white, size: 48),
          const SizedBox(height: 16),
          const Text(
            'Prefer WhatsApp?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Most of our customers order directly via WhatsApp.\n'
            'Quick responses, easy ordering, fast delivery!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.chat, color: Color(0xFF25D366), size: 20),
                const SizedBox(width: 10),
                Text(
                  'Start Chat: ${AppConstants.phone}',
                  style: const TextStyle(
                    color: Color(0xFF128C7E),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
