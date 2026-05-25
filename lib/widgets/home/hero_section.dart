import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';
import '../common/animated_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: isMobile ? 600 : 700),
      decoration: BoxDecoration(gradient: AppTheme.heroGradient),
      child: Stack(
        children: [
          // Background decorative elements
          ..._buildBackgroundDecorations(),

          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.getHorizontalPadding(context),
              vertical: 40,
            ),
            child: isMobile
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context, isTablet),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundDecorations() {
    return [
      // Floating circles
      Positioned(
        top: 50,
        right: 100,
        child: AnimatedBuilder2(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatAnimation.value),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryYellow.withOpacity(0.2),
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        bottom: 100,
        left: 50,
        child: AnimatedBuilder2(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_floatAnimation.value, 0),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryPink.withOpacity(0.2),
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        top: 200,
        left: 200,
        child: AnimatedBuilder2(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(-_floatAnimation.value, _floatAnimation.value),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryGreen.withOpacity(0.15),
                ),
              ),
            );
          },
        ),
      ),
      // Star decorations
      Positioned(
        top: 120,
        right: 300,
        child: AnimatedBuilder2(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_floatAnimation.value * 0.5),
              child: const Icon(
                Icons.star,
                color: AppTheme.primaryYellow,
                size: 24,
              ),
            );
          },
        ),
      ),
      Positioned(
        bottom: 150,
        right: 200,
        child: AnimatedBuilder2(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_floatAnimation.value * 0.5, 0),
              child: Icon(
                Icons.star,
                color: AppTheme.primaryOrange.withOpacity(0.6),
                size: 18,
              ),
            );
          },
        ),
      ),
    ];
  }

  Widget _buildDesktopLayout(BuildContext context, bool isTablet) {
    return Row(
      children: [
        Expanded(flex: 5, child: _buildTextContent(context)),
        const SizedBox(width: 40),
        Expanded(flex: 5, child: _buildHeroImage()),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        _buildTextContent(context),
        const SizedBox(height: 40),
        SizedBox(height: 300, child: _buildHeroImage()),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.primaryOrange.withOpacity(0.15),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppTheme.primaryOrange.withOpacity(0.3)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.auto_awesome, color: AppTheme.primaryOrange, size: 16),
              SizedBox(width: 8),
              Text(
                '✨ New Collection Available!',
                style: TextStyle(
                  color: AppTheme.primaryOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Main title
        Text(
          'Style Your',
          style: TextStyle(
            fontSize: isMobile ? 36 : 52,
            fontWeight: FontWeight.w700,
            color: AppTheme.textDark,
            height: 1.2,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              AppTheme.primaryRed,
              AppTheme.primaryOrange,
              AppTheme.primaryYellow,
              AppTheme.primaryGreen,
              AppTheme.primaryBlue,
            ],
          ).createShader(bounds),
          child: Text(
            'Little Stars! ⭐',
            style: TextStyle(
              fontSize: isMobile ? 36 : 52,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 20),

        // Subtitle
        Text(
          AppConstants.heroSubtitle,
          style: TextStyle(
            fontSize: isMobile ? 15 : 17,
            color: AppTheme.textGrey,
            height: 1.7,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 32),

        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            AnimatedButton(
              text: 'Explore Collection',
              icon: Icons.shopping_bag_rounded,
              onTap: () => Navigator.pushNamed(context, '/products'),
              gradientColors: [AppTheme.primaryBlue, AppTheme.primaryPurple],
            ),
            AnimatedButton(
              text: 'Order via WhatsApp',
              icon: Icons.chat,
              onTap: () {},
              gradientColors: [
                const Color(0xFF25D366),
                const Color(0xFF128C7E),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Stats
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            _buildStat('500+', 'Happy Kids', AppTheme.primaryRed),
            const SizedBox(width: 30),
            _buildStat('200+', 'Products', AppTheme.primaryBlue),
            const SizedBox(width: 30),
            _buildStat('100%', 'Quality', AppTheme.primaryGreen),
          ],
        ),
      ],
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: AppTheme.textGrey),
        ),
      ],
    );
  }

  Widget _buildHeroImage() {
    return AnimatedBuilder2(
      animation: _floatController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.primaryBlue.withOpacity(0.1),
                      AppTheme.primaryPink.withOpacity(0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              // Product showcase cards
              _buildShowcaseCard(
                'assets/images/products/black_suit.png',
                'Party Wear',
                -20,
                -30,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShowcaseCard(
    String image,
    String label,
    double offsetX,
    double offsetY,
  ) {
    return Container(
      width: 300,
      height: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFFF8F9FF), Color(0xFFFFf0f5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.15),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryPurple.withOpacity(0.05),
                      AppTheme.primaryPink.withOpacity(0.05),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.checkroom,
                    size: 120,
                    color: AppTheme.primaryBlue.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const Text(
                      'Premium Collection',
                      style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: AppTheme.primaryBlue,
                    size: 20,
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

class AnimatedBuilder2 extends AnimatedWidget {
  final Widget Function(BuildContext, Widget?) builder;

  const AnimatedBuilder2({
    super.key,
    required Animation<double> animation,
    required this.builder,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return builder(context, null);
  }
}
