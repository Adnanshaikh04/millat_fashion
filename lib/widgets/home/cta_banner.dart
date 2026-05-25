import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../utils/responsive.dart';
import '../common/animated_button.dart';

class CtaBanner extends StatelessWidget {
  const CtaBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 40,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 40 : 50,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2), Color(0xFFf093fb)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF764ba2).withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative elements
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.08),
              ),
            ),
          ),

          // Content
          Column(
            children: [
              const Text('🌟', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 16),
              Text(
                'Ready to Style Your Little One?',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Browse our complete collection and order easily via WhatsApp.\nFast delivery across Pakistan!',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white.withOpacity(0.85),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  AnimatedButton(
                    text: 'Shop Now',
                    icon: Icons.shopping_bag_rounded,
                    onTap: () => Navigator.pushNamed(context, '/products'),
                    gradientColors: const [Colors.white, Colors.white],
                  ),
                  AnimatedButton(
                    text: 'Chat on WhatsApp',
                    icon: Icons.chat,
                    onTap: () {},
                    gradientColors: const [
                      Color(0xFF25D366),
                      Color(0xFF128C7E),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
