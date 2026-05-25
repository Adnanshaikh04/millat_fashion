import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';

class ProductFilter extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const ProductFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: AppConstants.productCategories.map((category) {
          final isSelected = selectedCategory == category;
          final colors = [
            AppTheme.primaryBlue,
            AppTheme.primaryPurple,
            AppTheme.primaryGreen,
            AppTheme.primaryOrange,
            AppTheme.primaryRed,
            AppTheme.primaryPink,
            AppTheme.primaryYellow,
          ];
          final colorIndex =
              AppConstants.productCategories.indexOf(category) % colors.length;
          final color = colors[colorIndex];

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: _FilterChip(
              label: category,
              isSelected: isSelected,
              color: color,
              onTap: () => onCategorySelected(category),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FilterChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  State<_FilterChip> createState() => _FilterChipState();
}

class _FilterChipState extends State<_FilterChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? widget.color
                : _isHovered
                ? widget.color.withOpacity(0.1)
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: widget.isSelected
                  ? widget.color
                  : widget.color.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : widget.color,
              fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
