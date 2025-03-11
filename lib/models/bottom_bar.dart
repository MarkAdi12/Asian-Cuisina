import 'package:flutter/material.dart';

import '../pages/cart_page.dart';
import '../pages/home_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    int currentindex = 0;
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentindex,
      onTap: (value) {
        currentindex = value;
        if (currentindex == 0) {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const MyHome()),
          );
        } else if (currentindex == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_grocery_store_outlined),
          label: 'Cart',
        ),
      ],
    );
  }
}
