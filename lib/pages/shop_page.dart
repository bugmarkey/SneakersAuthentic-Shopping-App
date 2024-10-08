import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/components/shoe_tile.dart';
import 'package:ui_ux/models/ads.dart';
import 'package:ui_ux/models/cart.dart';
import 'package:ui_ux/models/shoe.dart';
import 'package:ui_ux/pages/category_pages/all_product_page.dart';
import 'package:ui_ux/pages/category_pages/menpage.dart';
import 'package:ui_ux/pages/category_pages/womenpage.dart';
import 'package:ui_ux/pages/shoe_description_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //navigate to the show description page
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
      builder: (context, value, child) {
        // Use the shuffled lists of shoes
        var allShoes = value.getShoes();
        var menShoes = value.men();
        var womenShoes = value.women();

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //automated scrollable
              //important offer deals
              const SizedBox(
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
              SizedBox(
                height: 330,
                child: ListView.builder(
                  itemCount: allShoes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ShoeList shoe = allShoes[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => navigateToShoeDescription(allShoes, index),
                      nameScaleFactor: 1.0,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
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
              const SizedBox(
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
              SizedBox(
                height: 330,
                child: ListView.builder(
                  itemCount: menShoes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ShoeList shoe = menShoes[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => navigateToShoeDescription(menShoes, index),
                      nameScaleFactor: 1.0,
                    );
                  },
                ),
              ),
              const SizedBox(
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
                      'Women\'s Collection 👠',
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
                                builder: (context) => const WomenPage()));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 330,
                child: ListView.builder(
                  itemCount: womenShoes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ShoeList shoe = womenShoes[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => navigateToShoeDescription(womenShoes, index),
                      nameScaleFactor: 1.0,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
