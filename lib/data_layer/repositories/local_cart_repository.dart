import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain_layer/cart.dart';

abstract class LocalCartRepository {
  // get the cart value (read-once)
  Future<Cart> fetchCart();

  // get the cart value (realtime updates)
  Stream<Cart> watchCart();

  // set the cart value
  Future<void> setCart(Cart cart);
}

final localCartRepositoryProvider = Provider<LocalCartRepository>((ref) {
  // This should be overridden in main file
  // TODO: read this https://codewithandrea.com/articles/flutter-repository-pattern/#abstract-or-concrete-classes
  throw UnimplementedError();
});
