import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/components/shoe_tile.dart';
import 'package:ui_ux/models/ads.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:ui_ux/models/shoe.dart';
import 'package:ui_ux/pages/category_pages/all_product_page.dart';
import 'package:ui_ux/pages/category_pages/menpage.dart';
import 'package:ui_ux/pages/shoe_description_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
//navigate to the show descripiton page
  void navigateToShoeDescription(List<ShoeList> shoes, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ShoeDescription(
        shoe: shoes[index],
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //automated scrollable
            //important offer deals
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'New Arrivals 🔥',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'View All',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllProductPage()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //Shoe List
            Container(
                height: 330,
                child: ListView.builder(
                    itemCount: value.getShoes().length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ShoeList shoe = value.getShoes()[index];
                      return ShoeTile(
                        shoe: shoe,
                        onTap: () =>
                            navigateToShoeDescription(value.getShoes(), index),
                        nameScaleFactor: 1.0,
                      );
                    })),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                aspectRatio: 2.0,
                viewportFraction: 1.0,
              ),
              items: imageList
                  .map((item) => Container(
                        child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 3000, height: 170)),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Men\'s Collection 👟',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'View All',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenPage()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
                height: 330,
                child: ListView.builder(
                    itemCount: value.men().length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ShoeList shoe = value.men()[index];
                      return ShoeTile(
                        shoe: shoe,
                        onTap: () =>
                            navigateToShoeDescription(value.men(), index),
                        nameScaleFactor: 1.0,
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
