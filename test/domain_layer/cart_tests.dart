import 'package:flutter_app_architecture/domain_layer/cart.dart';
import 'package:flutter_app_architecture/domain_layer/order_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('add item', () {
    test('empty cart - add item', () {
      final cart =
          const Cart().addItem(const OrderItem(productId: '1', quantity: 1));
      expect(cart.items, {'1': 1});
    });

    test('empty cart - add two items', () {
      final cart = const Cart()
          .addItem(const OrderItem(productId: '1', quantity: 1))
          .addItem(const OrderItem(productId: '2', quantity: 1));
      expect(cart.items, {
        '1': 1,
        '2': 1,
      });
    });

    test('empty cart - add same item twice', () {
      final cart = const Cart()
          .addItem(const OrderItem(productId: '1', quantity: 1))
          .addItem(const OrderItem(productId: '1', quantity: 1));
      expect(cart.items, {'1': 2});
    });
  });
}
