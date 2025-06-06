import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterivershop/provider/cart_provider.dart';
import 'package:flutterivershop/widgets/title_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final cartItems = ref.watch(cartProvider);
        final cartNotifier = ref.read(cartProvider.notifier);
        return Scaffold(
          appBar: AppBar(title: Text("All products in cart")),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        key: Key(cartItem.product.productId),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          cartNotifier.removeProduct(cartItem.product);
                        },
                        child: ListTile(
                          title: Text(maxLines: 2, cartItem.product.title),
                          subtitle: Text("\$${cartItem.product.price}"),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              fit: BoxFit.cover,
                              width: 80,
                              cartItem.product.imgUrl,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cartNotifier.decraseQty(cartItem.product);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7.0,
                                ),
                                child: TitleText(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  text: cartItem.quantity.toString(),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cartNotifier.inceaseQunatity(
                                    cartItem.product,
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
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 150),
              ],
            ),
          ),

          bottomSheet: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleText(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  text: "Total products: ${cartNotifier.totalItemsInCart}",
                ),
                SizedBox(height: 10),
                TitleText(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  text: "Total price: \$${cartNotifier.totalPrice}",
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text("Order Now"),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
