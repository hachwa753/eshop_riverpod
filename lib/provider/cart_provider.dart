import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterivershop/models/cart_model.dart';
import 'package:flutterivershop/models/product.dart';

class CartNotifier extends StateNotifier<List<CartModel>> {
  CartNotifier() : super([]);

  void addProductToCart(Product product) {
    final index = state.any(
      (element) => product.productId == element.product.productId,
    );

    if (!index) {
      state = [...state, CartModel(product: product)];
    }
  }

  void removeProduct(Product product) {
    state =
        state
            .where((element) => element.product.productId != product.productId)
            .toList();
  }

  void inceaseQunatity(Product product) {
    final index = state.indexWhere(
      (element) => element.product.productId == product.productId,
    );

    state[index].quantity++;
    state = [...state];
  }

  void decraseQty(Product product) {
    final index = state.indexWhere(
      (element) => element.product.productId == product.productId,
    );

    if (index != -1) {
      if (state[index].quantity > 1) {
        state[index].quantity--;
        state = [...state];
      } else {
        return;
      }
    }
  }

  // delete specific producrt
  void deleteProduct(Product product) {
    removeProduct(product);
  }

  // remove all products
  void removeAllProducts() {
    state = [];
  }

  // get the total item in cart
  int get totalItemsInCart => state.fold(
    0,
    (previousValue, element) => previousValue + element.quantity,
  );

  // get the total price

  double get totalPrice => state.fold(
    0,
    (previousValue, element) =>
        previousValue + element.product.price * element.quantity,
  );
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartModel>>(
  (ref) => CartNotifier(),
);
