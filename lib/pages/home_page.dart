import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/components/bottom_nav_bar.dart';
import 'package:ui_ux/pages/cart_page.dart';
import 'package:ui_ux/pages/category_pages/menpage.dart';
import 'package:ui_ux/pages/category_pages/womenpage.dart';
import 'package:ui_ux/pages/search_page.dart';
import 'package:ui_ux/pages/profile_page.dart';
import 'package:ui_ux/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
    const MenPage(),
    const WomenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(
            'assets/appbar_plain.png',
            height: 50,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  'assets/logo_plain.png',
                  height: 150,
                  width: 150,
                  color: Colors.black,
                )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.man,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Men',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 4;
                        });
                        Navigator.pop(context);
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.woman,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Women',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 5;
                        });
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 10.0,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigateBottombar(index),
      ),
      backgroundColor: Colors.grey[100],
      body: _pages[_selectedIndex],
    );
  }
}
