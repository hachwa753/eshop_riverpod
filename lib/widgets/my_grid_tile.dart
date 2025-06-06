import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterivershop/models/product.dart';
import 'package:flutterivershop/provider/cart_provider.dart';
import 'package:flutterivershop/widgets/title_text.dart';

class MyGridTile extends StatefulWidget {
  final Product product;
  const MyGridTile({super.key, required this.product});

  @override
  State<MyGridTile> createState() => _MyGridTileState();
}

class _MyGridTileState extends State<MyGridTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final cartNotifer = ref.read(cartProvider.notifier);
        final cart = ref.watch(cartProvider);
        final isInCart = cart.any(
          (element) => element.product.productId == widget.product.productId,
        );
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 110,
                  widget.product.imgUrl,
                ),
              ),
              SizedBox(height: 7),
              TitleText(
                color: Colors.grey.shade800,
                fontSize: 18,
                text: widget.product.title,
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    text: "\$${widget.product.price}",
                  ),
                  isInCart
                      ? SizedBox.shrink()
                      : GestureDetector(
                        onTap: () {
                          cartNotifer.addProductToCart(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Product added to the cart"),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
