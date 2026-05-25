import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../data/products_data.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';
import '../common/animated_button.dart';
import '../products/product_card.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = ProductsData.getFeaturedProducts();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.backgroundLight, Colors.white.withOpacity(0.8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Featured Collection',
            subtitle:
                'Our handpicked favorites that your little ones will love!',
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
                  childAspectRatio: Responsive.isMobile(context) ? 0.85 : 0.75,
                ),
                itemCount: featured.length > 6 ? 6 : featured.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: featured[index], index: index);
                },
              );
            },
          ),
          const SizedBox(height: 40),
          AnimatedButton(
            text: 'View All Products',
            icon: Icons.arrow_forward_rounded,
            onTap: () => Navigator.pushNamed(context, '/products'),
          ),
        ],
      ),
    );
  }
}
