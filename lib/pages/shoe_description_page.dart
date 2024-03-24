import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_ux/models/shoe.dart';
import 'package:ui_ux/pages/cart_page.dart';

class ShoeDescription extends StatefulWidget {
  final ShoeList shoe;
  const ShoeDescription({super.key, required this.shoe});

  @override
  State<ShoeDescription> createState() => _ShoeDescriptionState();
}

class _ShoeDescriptionState extends State<ShoeDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Image.asset(
              'assets/nike_logo_red.png',
              height: 30,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Image.network(widget.shoe.imageUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.shoe.name,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          '₹${widget.shoe.price}',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildSizeOption('7'),
                    _buildSizeOption('7.5'),
                    _buildSizeOption('8'),
                    _buildSizeOption('8.5'),
                    _buildSizeOption('9'),
                    _buildSizeOption('9.5'),
                    _buildSizeOption('10'),
                    _buildSizeOption('10.5'),
                    _buildSizeOption('11'),
                    _buildSizeOption('11.5'),
                    _buildSizeOption('12'),
                    _buildSizeOption('12.5'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 10.0,
                  ),
                  child: Text(
                    widget.shoe.descripiton,
                    style: GoogleFonts.teko(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
