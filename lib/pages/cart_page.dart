import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:ui_ux/pages/category_pages/checkout_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var cartItems = cart.getCart();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CART 🛒',
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var shoe = cartItems.keys.elementAt(index);
                      var count = cartItems[shoe]!;
                      return ListTile(
                        leading: Image.network(shoe.imageUrl),
                        title: Text(shoe.name),
                        subtitle: Text('₹${shoe.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                cart.removeFromCart(shoe);
                              },
                            ),
                            Text('$count'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cart.addToCart(shoe);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutPage(),
                        ),
                      );
                    },
                    child: const Text('Proceed to Checkout'),
                  ),
                ),
              ],
            ),
    );
  }
}
