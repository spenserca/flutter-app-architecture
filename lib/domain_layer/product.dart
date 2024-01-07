/// The ProductID is an important concept in our domain
/// so it deserves a type of its own
typedef ProductID = String;

class Product {
  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.availableQuantity,
  });

  final ProductID id;
  final String imageUrl;
  final String title;
  final double price;
  final int availableQuantity;

  // serialization code
  // factory Product.fromMap(Map<String, dynamic> map, ProductID id) {
  //   ...
  // }
  //
  // Map<String, dynamic> toMap() {
  //   ...
  // }
}