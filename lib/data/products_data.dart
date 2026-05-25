import '../models/product_model.dart';

class ProductsData {
  static const List<ProductModel> allProducts = [
    ProductModel(
      id: '1',
      name: 'Cute Baby Shoes',
      description:
          'Perfect for tiny feet! Adorable and comfortable baby shoes designed '
          'to support your little one\'s first steps. Soft sole, breathable material.',
      category: 'Shoes',
      imageUrl: 'assets/images/products/shoes_kids.png',
      tags: ['Baby', 'Shoes', 'Comfort', 'First Steps'],
      ageGroup: '0-3 Years',
      availableColors: ['Blue', 'Pink', 'White', 'Yellow'],
      availableSizes: ['16', '17', '18', '19', '20'],
      isFeatured: true,
      isNewArrival: true,
    ),
    ProductModel(
      id: '2',
      name: 'Striped Casual Sweatshirt',
      description:
          'Trendy striped sweatshirt for boys. Perfect for casual outings, '
          'school days and play time. Made with premium cotton blend for extra comfort.',
      category: 'Boys Wear',
      imageUrl: 'assets/images/products/striped_shirt.png',
      tags: ['Boys', 'Casual', 'Sweatshirt', 'Trendy'],
      ageGroup: '4-10 Years',
      availableColors: ['Black/White', 'Navy/White', 'Green/White'],
      availableSizes: ['22', '24', '26', '28', '30', '32'],
      isFeatured: true,
    ),
    ProductModel(
      id: '3',
      name: 'Premium Black Jodhpuri Suit',
      description:
          'Elegant Jodhpuri suit for special occasions. Your little prince will '
          'steal the show! Premium fabric with detailed button work.',
      category: 'Party Wear',
      imageUrl: 'assets/images/products/black_suit.png',
      tags: ['Boys', 'Party Wear', 'Formal', 'Premium'],
      ageGroup: '3-12 Years',
      availableColors: ['Black', 'Navy Blue', 'Maroon'],
      availableSizes: ['20', '22', '24', '26', '28', '30', '32'],
      isFeatured: true,
      isNewArrival: true,
    ),
    // ProductModel(
    //   id: '4',
    //   name: 'Fashion Forward Denim Set',
    //   description:
    //       'Cool denim jacket with matching outfit. Let your kid be the '
    //       'style icon! Durable, trendy and super comfortable for all-day wear.',
    //   category: 'Casual Wear',
    //   imageUrl: 'assets/images/products/fashion_sale.png',
    //   tags: ['Boys', 'Denim', 'Trendy', 'Fashion'],
    //   ageGroup: '3-10 Years',
    //   availableColors: ['Blue Denim', 'Black Denim', 'Light Wash'],
    //   availableSizes: ['22', '24', '26', '28', '30'],
    //   isFeatured: true,
    // ),
    // ProductModel(
    //   id: '5',
    //   name: 'Cozy Winter Hoodie',
    //   description:
    //       'Keep your little ones warm and stylish this winter! Soft fleece-lined '
    //       'hoodie with fun prints. Perfect for cold weather adventures.',
    //   category: 'Winter Collection',
    //   imageUrl: 'assets/images/products/winter_hoodie.png',
    //   tags: ['Unisex', 'Winter', 'Hoodie', 'Warm'],
    //   ageGroup: '2-10 Years',
    //   availableColors: ['Red', 'Blue', 'Grey', 'Pink'],
    //   availableSizes: ['20', '22', '24', '26', '28', '30'],
    //   isNewArrival: true,
    // ),
    // ProductModel(
    //   id: '6',
    //   name: 'Summer Cotton T-Shirt Set',
    //   description:
    //       'Breathable cotton t-shirt with shorts set. Colorful prints that kids love! '
    //       'Easy to wash, quick dry material for active children.',
    //   category: 'Summer Collection',
    //   imageUrl: 'assets/images/products/summer_tshirt.png',
    //   tags: ['Unisex', 'Summer', 'Cotton', 'Comfortable'],
    //   ageGroup: '2-8 Years',
    //   availableColors: ['Multi-color', 'Blue', 'Green', 'Orange'],
    //   availableSizes: ['18', '20', '22', '24', '26', '28'],
    // ),
    // ProductModel(
    //   id: '7',
    //   name: 'Gentleman Waistcoat Set',
    //   description:
    //       'Three-piece gentleman set with waistcoat, shirt and trousers. Perfect for '
    //       'weddings, birthdays and festive occasions. Premium stitching quality.',
    //   category: 'Party Wear',
    //   imageUrl: 'assets/images/products/waistcoat_set.png',
    //   tags: ['Boys', 'Formal', 'Waistcoat', 'Gentleman'],
    //   ageGroup: '3-12 Years',
    //   availableColors: ['Grey', 'Blue', 'Beige'],
    //   availableSizes: ['22', '24', '26', '28', '30', '32'],
    //   isFeatured: true,
    // ),
    // ProductModel(
    //   id: '8',
    //   name: 'Sporty Track Suit',
    //   description:
    //       'Active lifestyle track suit for energetic kids. Stretchable fabric '
    //       'with moisture-wicking properties. Great for sports and outdoor activities.',
    //   category: 'Casual Wear',
    //   imageUrl: 'assets/images/products/track_suit.png',
    //   tags: ['Unisex', 'Sports', 'Track Suit', 'Active'],
    //   ageGroup: '4-12 Years',
    //   availableColors: ['Black/Red', 'Navy/White', 'Grey/Blue'],
    //   availableSizes: ['24', '26', '28', '30', '32', '34'],
    // ),
    // ProductModel(
    //   id: '9',
    //   name: 'Traditional Kurta Pajama',
    //   description:
    //       'Beautiful traditional kurta pajama for Eid and festivals. Intricate '
    //       'embroidery work with comfortable fit. Make your child shine on special days.',
    //   category: 'Party Wear',
    //   imageUrl: 'assets/images/products/kurta_pajama.png',
    //   tags: ['Boys', 'Traditional', 'Eid', 'Festival'],
    //   ageGroup: '2-12 Years',
    //   availableColors: ['White', 'Sky Blue', 'Cream', 'Green'],
    //   availableSizes: ['20', '22', '24', '26', '28', '30', '32'],
    //   isNewArrival: true,
    // ),
    // ProductModel(
    //   id: '10',
    //   name: 'Canvas Sneakers',
    //   description:
    //       'Stylish canvas sneakers that go with everything! Lightweight, durable '
    //       'and available in fun colors. Non-slip sole for safe play.',
    //   category: 'Shoes',
    //   imageUrl: 'assets/images/products/canvas_sneakers.png',
    //   tags: ['Unisex', 'Shoes', 'Sneakers', 'Casual'],
    //   ageGroup: '3-10 Years',
    //   availableColors: ['White', 'Black', 'Red', 'Navy'],
    //   availableSizes: ['22', '24', '26', '28', '30', '32'],
    // ),
    // ProductModel(
    //   id: '11',
    //   name: 'Puffer Jacket',
    //   description:
    //       'Ultra-warm puffer jacket for extreme cold. Water-resistant outer shell '
    //       'with synthetic filling. Hooded design for extra protection.',
    //   category: 'Winter Collection',
    //   imageUrl: 'assets/images/products/puffer_jacket.png',
    //   tags: ['Unisex', 'Winter', 'Jacket', 'Warm'],
    //   ageGroup: '3-12 Years',
    //   availableColors: ['Red', 'Black', 'Navy', 'Olive'],
    //   availableSizes: ['24', '26', '28', '30', '32', '34'],
    // ),
    // ProductModel(
    //   id: '12',
    //   name: 'Printed Polo Shirt',
    //   description:
    //       'Classic polo shirt with modern prints. Smart casual look for school '
    //       'and outings. Premium cotton fabric that feels great on skin.',
    //   category: 'Boys Wear',
    //   imageUrl: 'assets/images/products/polo_shirt.png',
    //   tags: ['Boys', 'Polo', 'Smart Casual', 'School'],
    //   ageGroup: '4-12 Years',
    //   availableColors: ['White', 'Navy', 'Red', 'Green'],
    //   availableSizes: ['22', '24', '26', '28', '30', '32'],
    //   isFeatured: true,
    // ),
  ];

  static List<ProductModel> getFeaturedProducts() {
    return allProducts.where((p) => p.isFeatured).toList();
  }

  static List<ProductModel> getNewArrivals() {
    return allProducts.where((p) => p.isNewArrival).toList();
  }

  static List<ProductModel> getByCategory(String category) {
    if (category == 'All') return allProducts;
    return allProducts.where((p) => p.category == category).toList();
  }
}
