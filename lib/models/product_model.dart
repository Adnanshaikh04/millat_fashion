class ProductModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final List<String> tags;
  final String ageGroup;
  final List<String> availableColors;
  final List<String> availableSizes;
  final bool isFeatured;
  final bool isNewArrival;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    this.tags = const [],
    this.ageGroup = '2-12 Years',
    this.availableColors = const [],
    this.availableSizes = const [],
    this.isFeatured = false,
    this.isNewArrival = false,
  });
}
