import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          // Rainbow strip at top
          Container(
            height: 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: AppTheme.rainbowColors),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.getHorizontalPadding(context),
              vertical: 50,
            ),
            child: isMobile
                ? _buildMobileFooter(context)
                : _buildDesktopFooter(context),
          ),

          // Bottom bar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
            ),
            child: Center(
              child: Text(
                '© 2024 ${AppConstants.fullName}. All rights reserved. Made with ❤️ for kids.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildBrandSection()),
        const SizedBox(width: 40),
        Expanded(child: _buildQuickLinks(context)),
        const SizedBox(width: 40),
        Expanded(child: _buildCategories()),
        const SizedBox(width: 40),
        Expanded(flex: 2, child: _buildContactSection()),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        _buildBrandSection(),
        const SizedBox(height: 30),
        _buildContactSection(),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildQuickLinks(context)),
            Expanded(child: _buildCategories()),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppTheme.primaryRed,
                    AppTheme.primaryOrange,
                    AppTheme.primaryYellow,
                    AppTheme.primaryGreen,
                    AppTheme.primaryBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'MF',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      AppTheme.primaryRed,
                      AppTheme.primaryOrange,
                      AppTheme.primaryYellow,
                      AppTheme.primaryGreen,
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'Millat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Fashion Kids Wear',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.7),
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          AppConstants.description,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        // Social icons
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, const Color(0xFF1877F2)),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.camera_alt, const Color(0xFFE4405F)),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.chat, const Color(0xFF25D366)),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.play_arrow, const Color(0xFFFF0000)),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    final links = ['Home', 'Products', 'About Us', 'Contact'];
    final routes = ['/', '/products', '/about', '/contact'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Links',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 30,
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.primaryOrange,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(links.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, routes[index]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: AppTheme.primaryOrange.withOpacity(0.7),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    links[index],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCategories() {
    final categories = [
      'Boys Wear',
      'Party Wear',
      'Casual Wear',
      'Shoes',
      'Winter Collection',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 30,
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        ...categories.map(
          (cat) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_right,
                  color: AppTheme.primaryGreen.withOpacity(0.7),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  cat,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Get In Touch',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 30,
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          Icons.location_on,
          AppConstants.address,
          AppTheme.primaryRed,
        ),
        const SizedBox(height: 12),
        _buildContactItem(
          Icons.phone,
          AppConstants.phone,
          AppTheme.primaryGreen,
        ),
        const SizedBox(height: 12),
        _buildContactItem(
          Icons.email,
          AppConstants.email,
          AppTheme.primaryBlue,
        ),
        const SizedBox(height: 20),
        // WhatsApp CTA
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF25D366), Color(0xFF128C7E)],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chat, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                'Order on WhatsApp',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text, Color color) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
