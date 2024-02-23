import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  final void Function(int)? onTabChange;
  final int initialIndex;
  BottomNav({super.key, required this.onTabChange, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GNav(
      color: Colors.grey[900],
      mainAxisAlignment: MainAxisAlignment.center,
      activeColor: Colors.orange[900],
      onTabChange: (value) => onTabChange!(value),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: ' Home',
        ),
        GButton(
          icon: Icons.search,
          text: ' Search',
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: ' Cart',
        ),
        GButton(
          icon: Icons.person,
          text: ' Profile',
        ),
      ],
    ));
  }
}
