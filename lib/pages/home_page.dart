import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/nike_logo.png',
          height: 50,
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          //automated scrollable
          //important offer deals
          Container(
            height: 50,
            width: double.infinity,
            color: Color.fromARGB(255, 206, 8, 8),
            child: Text(
              'Offer Deals',
              style: GoogleFonts.bebasNeue(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
          //choose topic like : <men,women,sports,casuals>
          //shoes
        ],
      ),
    );
  }
}
