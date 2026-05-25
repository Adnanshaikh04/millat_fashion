import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../utils/responsive.dart';
import '../widgets/common/navbar.dart';
import '../widgets/common/footer.dart';
import '../widgets/common/section_title.dart';
import '../widgets/home/cta_banner.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Column(
        children: [
          const Navbar(currentIndex: 2),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Hero Banner
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.getHorizontalPadding(context),
                      vertical: 80,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryOrange.withOpacity(0.05),
                          AppTheme.primaryYellow.withOpacity(0.05),
                        ],
                      ),
                    ),
                    child: const SectionTitle(
                      title: 'About Millat Fashion',
                      subtitle:
                          'Where style meets comfort for your little ones',
                    ),
                  ),

                  // Story Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.getHorizontalPadding(context),
                      vertical: 60,
                    ),
                    child: isMobile
                        ? _buildMobileStory()
                        : _buildDesktopStory(),
                  ),

                  // Values Section
                  _buildValuesSection(context),

                  // Mission Section
                  _buildMissionSection(context),

                  const CtaBanner(),
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

  Widget _buildDesktopStory() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [
                  AppTheme.primaryBlue.withOpacity(0.1),
                  AppTheme.primaryPurple.withOpacity(0.1),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
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
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'MF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Millat Fashion',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const Text(
                    'Kids Wear',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.primaryRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(child: _buildStoryContent()),
      ],
    );
  }

  Widget _buildMobileStory() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryBlue.withOpacity(0.1),
                AppTheme.primaryPurple.withOpacity(0.1),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'MF',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Millat Fashion Kids Wear',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        _buildStoryContent(),
      ],
    );
  }

  Widget _buildStoryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppTheme.primaryRed, AppTheme.primaryBlue],
          ).createShader(bounds),
          child: const Text(
            'Our Story',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppTheme.rainbowColors),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Millat Fashion Kids Wear was born from a simple idea — every child '
          'deserves to look adorable and feel comfortable in their clothes.',
          style: TextStyle(fontSize: 16, color: AppTheme.textGrey, height: 1.8),
        ),
        const SizedBox(height: 16),
        const Text(
          'We started our journey with a passion for kids fashion and a commitment '
          'to quality. Today, we\'re proud to serve hundreds of happy families '
          'across Pakistan with our trendy, affordable, and comfortable kids wear.',
          style: TextStyle(fontSize: 16, color: AppTheme.textGrey, height: 1.8),
        ),
        const SizedBox(height: 16),
        const Text(
          'From casual day wear to stunning party outfits, from cozy winter '
          'collections to breezy summer styles — we\'ve got everything to '
          'keep your little ones stylish throughout the year.',
          style: TextStyle(fontSize: 16, color: AppTheme.textGrey, height: 1.8),
        ),
        const SizedBox(height: 30),
        // Stats
        Row(
          children: [
            _buildStatItem('500+', 'Happy Kids', AppTheme.primaryRed),
            const SizedBox(width: 30),
            _buildStatItem('200+', 'Products', AppTheme.primaryBlue),
            const SizedBox(width: 30),
            _buildStatItem('4.9⭐', 'Rating', AppTheme.primaryOrange),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppTheme.textGrey),
        ),
      ],
    );
  }

  Widget _buildValuesSection(BuildContext context) {
    final values = [
      {
        'icon': Icons.diamond,
        'title': 'Quality First',
        'desc': 'Premium fabrics and excellent stitching in every product.',
        'color': AppTheme.primaryBlue,
      },
      {
        'icon': Icons.favorite,
        'title': 'Made with Love',
        'desc':
            'Every piece is designed keeping your child\'s comfort in mind.',
        'color': AppTheme.primaryRed,
      },
      {
        'icon': Icons.trending_up,
        'title': 'Latest Trends',
        'desc':
            'We stay updated with the latest kids fashion trends worldwide.',
        'color': AppTheme.primaryPurple,
      },
      {
        'icon': Icons.handshake,
        'title': 'Customer Trust',
        'desc':
            'Building lasting relationships with our happy customer families.',
        'color': AppTheme.primaryGreen,
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
            title: 'Our Values',
            subtitle: 'What drives us every day',
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = Responsive.isMobile(context);

              if (isMobile) {
                return Column(
                  children: values
                      .map(
                        (v) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildValueCard(
                            v['icon'] as IconData,
                            v['title'] as String,
                            v['desc'] as String,
                            v['color'] as Color,
                          ),
                        ),
                      )
                      .toList(),
                );
              }

              return Row(
                children: values
                    .map(
                      (v) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _buildValueCard(
                            v['icon'] as IconData,
                            v['title'] as String,
                            v['desc'] as String,
                            v['color'] as Color,
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

  Widget _buildValueCard(
    IconData icon,
    String title,
    String desc,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: color),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textGrey,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMissionSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 60,
      ),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryBlue.withOpacity(0.05),
              AppTheme.primaryPurple.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.flag,
                size: 36,
                color: AppTheme.primaryBlue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'To make every child look and feel amazing by providing high-quality, '
              'trendy, and affordable kids fashion. We believe every kid is a star, '
              'and their clothes should make them shine! ⭐',
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.textGrey,
                height: 1.8,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
