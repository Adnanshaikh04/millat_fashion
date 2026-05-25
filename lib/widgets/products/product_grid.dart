import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../utils/responsive.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            children: [
              Icon(Icons.search_off, size: 60, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No products found in this category',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

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
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index], index: index);
      },
    );
  }
}
