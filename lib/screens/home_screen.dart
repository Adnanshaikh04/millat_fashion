import 'package:flutter/material.dart';
import '../widgets/common/navbar.dart';
import '../widgets/common/footer.dart';
import '../widgets/home/hero_section.dart';
import '../widgets/home/categories_section.dart';
import '../widgets/home/featured_products_section.dart';
import '../widgets/home/why_choose_us_section.dart';
import '../widgets/home/testimonials_section.dart';
import '../widgets/home/cta_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Navbar(currentIndex: 0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  HeroSection(),
                  CategoriesSection(),
                  FeaturedProductsSection(),
                  WhyChooseUsSection(),
                  TestimonialsSection(),
                  CtaBanner(),
                  SizedBox(height: 40),
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
