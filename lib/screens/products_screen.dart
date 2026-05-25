import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../data/products_data.dart';
import '../models/product_model.dart';
import '../utils/responsive.dart';
import '../widgets/common/navbar.dart';
import '../widgets/common/footer.dart';
import '../widgets/common/section_title.dart';
import '../widgets/products/product_grid.dart';
import '../widgets/products/product_filter.dart';
import '../widgets/home/cta_banner.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String _selectedCategory = 'All';
  List<ProductModel> _filteredProducts = ProductsData.allProducts;

  void _filterProducts(String category) {
    setState(() {
      _selectedCategory = category;
      _filteredProducts = ProductsData.getByCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Navbar(currentIndex: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header Banner
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.getHorizontalPadding(context),
                      vertical: 60,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryBlue.withOpacity(0.05),
                          AppTheme.primaryPurple.withOpacity(0.05),
                          AppTheme.primaryPink.withOpacity(0.05),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        const SectionTitle(
                          title: 'Our Collection',
                          subtitle:
                              'Browse our complete kids fashion collection. '
                              'From casual to formal — style your little ones today!',
                        ),
                        const SizedBox(height: 30),
                        // Filter
                        ProductFilter(
                          selectedCategory: _selectedCategory,
                          onCategorySelected: _filterProducts,
                        ),
                      ],
                    ),
                  ),

                  // Products Grid
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.getHorizontalPadding(context),
                      vertical: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Results count
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.textDark,
                                ),
                                children: [
                                  const TextSpan(text: 'Showing '),
                                  TextSpan(
                                    text: '${_filteredProducts.length}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryBlue,
                                    ),
                                  ),
                                  TextSpan(
                                    text: _selectedCategory == 'All'
                                        ? ' products'
                                        : ' products in $_selectedCategory',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Grid
                        ProductGrid(products: _filteredProducts),
                      ],
                    ),
                  ),

                  const CtaBanner(),
                  const SizedBox(height: 40),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
