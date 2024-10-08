import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var cartItems = cart.getCart();
    double totalAmount = cartItems.entries
        .map((entry) => double.parse(entry.key.price) * entry.value)
        .reduce((value, element) => value + element);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items in your cart:',
              style: GoogleFonts.bebasNeue(fontSize: 24),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var shoe = cartItems.keys.elementAt(index);
                  var count = cartItems[shoe]!;
                  return ListTile(
                    leading: Image.network(shoe.imageUrl),
                    title: Text(shoe.name),
                    subtitle: Text('Quantity: $count'),
                    trailing: Text('₹${double.parse(shoe.price) * count}'),
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              'Total Amount: ₹${totalAmount.toStringAsFixed(2)}',
              style: GoogleFonts.bebasNeue(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Select Payment Method:',
              style: GoogleFonts.bebasNeue(fontSize: 24),
            ),
            _buildPaymentMethodTile('Credit Card', Icons.credit_card),
            _buildPaymentMethodTile('Debit Card', Icons.account_balance_wallet),
            _buildPaymentMethodTile('PayPal', Icons.paypal),
            _buildPaymentMethodTile('Cash on Delivery', Icons.money),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout process
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout successful!')),
                  );
                },
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(String method, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(method),
      tileColor: selectedPaymentMethod == method ? Colors.grey[300] : null,
      onTap: () {
        setState(() {
          selectedPaymentMethod = method;
        });
      },
    );
  }
}
