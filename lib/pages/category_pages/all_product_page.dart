import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/components/shoe_tile.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:ui_ux/pages/shoe_description_page.dart';
// Import your Cart model

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var Shoes = cart.getShoes();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: Shoes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 0.7,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ShoeTile(
              shoe: Shoes[index],
              nameScaleFactor: 0.1,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShoeDescription(
                    shoe: Shoes[index],
                  );
                }));
              });
        },
      ),
    );
  }
}
