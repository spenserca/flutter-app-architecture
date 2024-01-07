import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application_layer/services/cart_service.dart';
import '../../domain_layer/order_item.dart';

class ShoppingCartItemController extends StateNotifier<AsyncValue<void>> {
  ShoppingCartItemController({required this.cartService})
      : super(const AsyncData(null));
  final CartService cartService;

  Future<void> updateQuantity(OrderItem item, int quantity) async {
    // set loading state
    state = const AsyncLoading();
    // create an updated Item with the new quantity
    final updated = OrderItem(productId: item.productId, quantity: quantity);
    // use the cartService to update the cart
    // and set the state again (data or error)
    state = await AsyncValue.guard(
      () => cartService.updateItemIfExists(updated),
    );
  }

  Future<void> deleteItem(OrderItem item) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => cartService.removeItemById(item.productId),
    );
  }
}

final shoppingCartItemControllerProvider =
    StateNotifierProvider<ShoppingCartItemController, AsyncValue<void>>((ref) {
  return ShoppingCartItemController(
    cartService: ref.watch(cartServiceProvider),
  );
});
