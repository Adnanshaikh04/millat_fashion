import 'package:flutter/material.dart';
import '../../config/theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? titleColor;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Decorative element
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 3,
              decoration: BoxDecoration(
                color: AppTheme.primaryOrange,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.star, color: AppTheme.primaryYellow, size: 20),
            const SizedBox(width: 8),
            Container(
              width: 30,
              height: 3,
              decoration: BoxDecoration(
                color: AppTheme.primaryOrange,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: titleColor != null
                ? [titleColor!, titleColor!]
                : [
                    AppTheme.primaryRed,
                    AppTheme.primaryBlue,
                    AppTheme.primaryPurple,
                  ],
          ).createShader(bounds),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            color: AppTheme.textGrey,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        // Decorative dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              width: index == 2 ? 12 : 6,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: AppTheme
                    .rainbowColors[index % AppTheme.rainbowColors.length],
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
