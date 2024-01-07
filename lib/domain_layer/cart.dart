import 'package:flutter_app_architecture/domain_layer/product.dart';

import 'order_item.dart';

class Cart {
  const Cart([this.items = const {}]);

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  final Map<ProductID, int> items;

  /// Note: ProductID is just a String
}

/// Helper extension used to mutate the items in the shopping cart.
extension MutableCart on Cart {
  // implementations omitted for brevity
  Cart addItem(OrderItem item) {
    final copy = Map<ProductID, int>.from(items);

    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/
    copy[item.productId] = item.quantity + (copy[item.productId] ?? 0);

    return Cart(copy);
  }

  Cart setItem(OrderItem item) {
    // TODO: how is this different than addItem?
    final copy = Map<ProductID, int>.from(items);

    copy[item.productId] = item.quantity;

    return Cart(copy);
  }

  Cart removeItemById(ProductID productId) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(productId);
    return Cart(copy);
  }
}
