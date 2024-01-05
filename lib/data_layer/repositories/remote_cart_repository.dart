import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain_layer/cart.dart';

abstract class RemoteCartRepository {
  // get the cart value (read-once)
  Future<Cart> fetchCart(String uid);

  // get the cart value (realtime updates)
  Stream<Cart> watchCart(String uid);

  // set the cart value
  Future<void> setCart(String uid, Cart items);
}

final remoteCartRepositoryProvider = Provider<RemoteCartRepository>((ref) {
  // This should be overridden in main file
  // TODO: read this https://codewithandrea.com/articles/flutter-repository-pattern/#abstract-or-concrete-classes
  throw UnimplementedError();
});
