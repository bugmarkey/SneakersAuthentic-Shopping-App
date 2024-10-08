import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/components/shoe_tile.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:ui_ux/pages/shoe_description_page.dart';
// Import your Cart model

class WomenPage extends StatefulWidget {
  const WomenPage({super.key});

  @override
  State<WomenPage> createState() => _WomenPageState();
}

class _WomenPageState extends State<WomenPage> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var menShoes = cart.getShoesByCategory('women');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: menShoes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 0.9,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ShoeTile(
              shoe: menShoes[index],
              nameScaleFactor: 1.1,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShoeDescription(
                    shoe: menShoes[index],
                  );
                }));
              });
        },
      ),
    );
  }
}
