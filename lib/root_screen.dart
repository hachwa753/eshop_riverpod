import 'package:flutter/material.dart';
import 'package:flutterivershop/pages/cart_page.dart';
import 'package:flutterivershop/pages/home_page.dart';
import 'package:flutterivershop/pages/profile_page.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;
  List _pages = [HomePage(), CartPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedIndex,
        onTap: (newValue) {
          setState(() {
            selectedIndex = newValue;
          });
        },
        selectedItemColor: Colors.pink,
      ),
      body: _pages[selectedIndex],
    );
  }
}
