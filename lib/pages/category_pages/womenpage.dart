import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/components/shoe_tile.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:ui_ux/pages/shoe_description_page.dart';
// Import your Cart model

class WomenPage extends StatefulWidget {
  const WomenPage({super.key});

  @override
  State<WomenPage> createState() => _MenPageState();
}

class _MenPageState extends State<WomenPage> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var womenShoes = cart.getShoesByCategory('women');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: womenShoes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 0.7,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ShoeTile(
              shoe: womenShoes[index],
              nameScaleFactor: 0.1,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShoeDescription(
                    shoe: womenShoes[index],
                  );
                }));
              });
        },
      ),
    );
  }
}
