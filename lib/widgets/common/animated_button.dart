import 'package:flutter/material.dart';
import '../../config/theme.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onTap;
  final List<Color>? gradientColors;
  final double? width;

  const AnimatedButton({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
    this.gradientColors,
    this.width,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors =
        widget.gradientColors ?? [AppTheme.primaryBlue, AppTheme.primaryPurple];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovered ? colors.reversed.toList() : colors,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: colors.first.withOpacity(_isHovered ? 0.5 : 0.3),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 6 : 4),
              ),
            ],
          ),
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: Colors.white, size: 20),
                const SizedBox(width: 10),
              ],
              Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
