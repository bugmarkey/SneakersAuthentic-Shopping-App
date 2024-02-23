import 'package:flutter/material.dart';
import 'package:ui_ux/components/bottom_nav_bar.dart';
import 'package:ui_ux/pages/cart_page.dart';
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
        title: Image.asset(
          'assets/nike_logo_red.png',
          height: 50,
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
                  'assets/nike_logo_red.png',
                  height: 150,
                  width: 150,
                )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.clear_all_rounded,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.man,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Men',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.woman,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Women',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 20.0,
                  left: 10.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
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
