import 'item.dart';

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
  Cart addItem(Item item) {
    var itemsCopy = items;

    itemsCopy.addAll({item.productId: item.quantity});

    return Cart(itemsCopy);
  }

  Cart setItem(Item item) {
    // TODO: how is this different than addItem?
    var itemsCopy = items;

    itemsCopy[item.productId] = item.quantity;

    return Cart(itemsCopy);
  }

  Cart removeItemById(ProductID productId) {
    var itemsCopy = items;

    itemsCopy.remove(productId);

    return Cart(itemsCopy);
  }
}
