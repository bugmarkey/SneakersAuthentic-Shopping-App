import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/components/shoe_tile.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:ui_ux/pages/shoe_description_page.dart';
// Import your Cart model

class MenPage extends StatefulWidget {
  const MenPage({super.key});

  @override
  State<MenPage> createState() => _MenPageState();
}

class _MenPageState extends State<MenPage> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var menShoes = cart.getShoesByCategory('men');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: menShoes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 0.9,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ShoeTile(
              shoe: menShoes[index],
              nameScaleFactor: 1.2,
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
