import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonials = [
      {
        'name': 'Ayesha Khan',
        'text':
            'My son loves the outfits from Millat Fashion! The quality is amazing and the designs are so trendy. Highly recommended!',
        'rating': 5,
        'avatar': 'AK',
        'color': AppTheme.primaryPink,
      },
      {
        'name': 'Ahmed Ali',
        'text':
            'Best kids wear brand! I ordered a party suit for my son and it was perfect. Great stitching and fabric quality.',
        'rating': 5,
        'avatar': 'AA',
        'color': AppTheme.primaryBlue,
      },
      {
        'name': 'Fatima Noor',
        'text':
            'Affordable and stylish! My kids always get compliments when they wear Millat Fashion. Will order again!',
        'rating': 5,
        'avatar': 'FN',
        'color': AppTheme.primaryGreen,
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryBlue.withOpacity(0.03),
            AppTheme.primaryPurple.withOpacity(0.03),
          ],
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'What Parents Say',
            subtitle: 'Trusted by hundreds of happy families across Pakistan',
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              if (Responsive.isMobile(context)) {
                return Column(
                  children: testimonials
                      .map(
                        (t) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _TestimonialCard(
                            name: t['name'] as String,
                            text: t['text'] as String,
                            rating: t['rating'] as int,
                            avatar: t['avatar'] as String,
                            color: t['color'] as Color,
                          ),
                        ),
                      )
                      .toList(),
                );
              }

              return Row(
                children: testimonials
                    .map(
                      (t) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: _TestimonialCard(
                            name: t['name'] as String,
                            text: t['text'] as String,
                            rating: t['rating'] as int,
                            avatar: t['avatar'] as String,
                            color: t['color'] as Color,
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
}

class _TestimonialCard extends StatefulWidget {
  final String name;
  final String text;
  final int rating;
  final String avatar;
  final Color color;

  const _TestimonialCard({
    required this.name,
    required this.text,
    required this.rating,
    required this.avatar,
    required this.color,
  });

  @override
  State<_TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<_TestimonialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(28),
        transform: Matrix4.identity()..scale(_isHovered ? 1.03 : 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(_isHovered ? 0.2 : 0.08),
              blurRadius: _isHovered ? 25 : 15,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Quote icon
            Icon(
              Icons.format_quote,
              size: 40,
              color: widget.color.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            // Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.rating,
                (index) => const Icon(
                  Icons.star,
                  color: AppTheme.primaryYellow,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Text
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 15,
                color: AppTheme.textGrey,
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Divider
            Container(
              width: 40,
              height: 3,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            // Avatar & Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.avatar,
                      style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      'Happy Parent ❤️',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.textGrey.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
