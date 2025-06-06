import 'package:flutterivershop/models/product.dart';

class CartModel {
  final Product product;
  int quantity;

  CartModel({required this.product, this.quantity = 1});
}
