import 'package:flutter_app_architecture/domain_layer/product.dart';

/// A product along with a quantity that can be added to an order/cart
class OrderItem {
  const OrderItem({
    required this.productId,
    required this.quantity,
  });

  final ProductID productId;
  final int quantity;
}
