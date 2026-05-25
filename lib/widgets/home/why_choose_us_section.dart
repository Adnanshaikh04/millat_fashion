import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'icon': Icons.verified,
        'title': 'Premium Quality',
        'desc':
            'We use only the finest fabrics that are gentle on your child\'s skin.',
        'color': AppTheme.primaryBlue,
      },
      {
        'icon': Icons.child_care,
        'title': 'Comfortable Fit',
        'desc': 'Designed for active kids — move, play, and explore freely!',
        'color': AppTheme.primaryGreen,
      },
      {
        'icon': Icons.style,
        'title': 'Trendy Designs',
        'desc': 'Latest fashion trends adapted for kids. Style meets comfort.',
        'color': AppTheme.primaryPurple,
      },
      {
        'icon': Icons.local_shipping,
        'title': 'Fast Delivery',
        'desc': 'Quick doorstep delivery across Pakistan. Order via WhatsApp!',
        'color': AppTheme.primaryOrange,
      },
      {
        'icon': Icons.thumb_up,
        'title': 'Trusted Brand',
        'desc': 'Loved by 500+ families. Check our reviews and social media!',
        'color': AppTheme.primaryRed,
      },
      {
        'icon': Icons.palette,
        'title': 'Wide Variety',
        'desc': 'From casual to formal — find everything at one place.',
        'color': AppTheme.primaryPink,
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 80,
      ),
      color: Colors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Why Choose Millat Fashion?',
            subtitle:
                'We\'re not just a brand, we\'re a family that cares about your kids',
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = Responsive.isMobile(context)
                  ? 1
                  : Responsive.isTablet(context)
                  ? 2
                  : 3;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: Responsive.isMobile(context) ? 2.0 : 1.5,
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return _FeatureCard(
                    icon: features[index]['icon'] as IconData,
                    title: features[index]['title'] as String,
                    description: features[index]['desc'] as String,
                    color: features[index]['color'] as Color,
                    index: index,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final int index;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.index,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        decoration: BoxDecoration(
          color: _isHovered ? widget.color.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? widget.color.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.color.withOpacity(0.15)
                  : Colors.grey.withOpacity(0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(_isHovered ? 0.15 : 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, size: 32, color: widget.color),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textGrey,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
