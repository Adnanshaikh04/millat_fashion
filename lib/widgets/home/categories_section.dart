import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Boys Wear',
        'icon': Icons.boy,
        'color': AppTheme.primaryBlue,
        'count': '50+ Items',
      },
      {
        'name': 'Party Wear',
        'icon': Icons.celebration,
        'color': AppTheme.primaryPurple,
        'count': '30+ Items',
      },
      {
        'name': 'Casual Wear',
        'icon': Icons.weekend,
        'color': AppTheme.primaryGreen,
        'count': '40+ Items',
      },
      {
        'name': 'Shoes',
        'icon': Icons.ice_skating,
        'color': AppTheme.primaryOrange,
        'count': '25+ Items',
      },
      {
        'name': 'Winter Wear',
        'icon': Icons.ac_unit,
        'color': AppTheme.primaryRed,
        'count': '35+ Items',
      },
      {
        'name': 'Summer Wear',
        'icon': Icons.wb_sunny,
        'color': AppTheme.primaryYellow,
        'count': '45+ Items',
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
            title: 'Shop by Category',
            subtitle: 'Find the perfect outfit for every occasion',
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = Responsive.isMobile(context)
                  ? 2
                  : Responsive.isTablet(context)
                  ? 3
                  : 6;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _CategoryCard(
                    name: categories[index]['name'] as String,
                    icon: categories[index]['icon'] as IconData,
                    color: categories[index]['color'] as Color,
                    count: categories[index]['count'] as String,
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

class _CategoryCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color color;
  final String count;
  final int index;

  const _CategoryCard({
    required this.name,
    required this.icon,
    required this.color,
    required this.count,
    required this.index,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/products'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          decoration: BoxDecoration(
            color: _isHovered ? widget.color : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: widget.color.withOpacity(0.2), width: 2),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(_isHovered ? 0.3 : 0.1),
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
                  color: _isHovered
                      ? Colors.white.withOpacity(0.2)
                      : widget.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: _isHovered ? Colors.white : widget.color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _isHovered ? Colors.white : AppTheme.textDark,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                widget.count,
                style: TextStyle(
                  fontSize: 12,
                  color: _isHovered
                      ? Colors.white.withOpacity(0.8)
                      : AppTheme.textGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
