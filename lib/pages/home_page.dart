import 'package:flutter/material.dart';
import 'package:flutterivershop/models/product.dart';
import 'package:flutterivershop/widgets/my_grid_tile.dart';
import 'package:flutterivershop/widgets/title_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List productItems = [
    Product(
      productId: "1",
      title:
          "HP 14 Laptop, Intel Celeron N4020, 4 GB RAM, 64 GB Storage, 14-inch Micro-edge HD Display, Windows 11 Home",
      productDesc: "productDesc",
      imgUrl:
          "https://m.media-amazon.com/images/I/815uX7wkOZS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
      price: 400,
    ),
    Product(
      productId: "2",
      title:
          "Apple 2025 MacBook Air 13-inch Laptop with M4 chip: Built for Apple Intelligence, 13.6-inch Liquid Retina Display, 16GB Unified Memory, 256GB SSD Storage, 12MP Center Stage",
      productDesc: "productDesc",
      imgUrl: "https://m.media-amazon.com/images/I/712dp0yAydL._AC_SX522_.jpg",
      price: 700,
    ),

    Product(
      productId: "3",
      title:
          "Canon PIXMA TR4720 All-in-One Wireless Printer, Home Use with Auto Document Feeder, Mobile Printing and Built-in Fax, Black",
      productDesc: "productDesc",
      imgUrl:
          "https://m.media-amazon.com/images/I/71vYeYqdvUL.__AC_SX300_SY300_QL70_FMwebp_.jpg",
      price: 890,
    ),

    Product(
      productId: "4",
      title: "Keyboard",
      productDesc: "productDesc",
      imgUrl:
          "https://m.media-amazon.com/images/I/61jhVTLFAEL.__AC_SY300_SX300_QL70_FMwebp_.jpg",
      price: 300,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop App",
          style: TextStyle(color: Colors.pink, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                label: Text("8"),
                child: Icon(Icons.notifications_outlined),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                    text: "Latest products",
                  ),
                  TitleText(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    text: "See all",
                  ),
                ],
              ),
              SizedBox(height: 15),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productItems.length,
                itemBuilder: (context, index) {
                  final product = productItems[index];
                  return MyGridTile(product: product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
