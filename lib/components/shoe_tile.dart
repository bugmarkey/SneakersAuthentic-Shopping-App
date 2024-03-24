import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_ux/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final void Function()? onTap;
  final ShoeList shoe;
  final double nameScaleFactor;

  ShoeTile(
      {super.key,
      required this.shoe,
      required this.onTap,
      required this.nameScaleFactor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 3 / 3,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
          ),
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                //shoe img
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Image.network(
                    shoe.imageUrl,
                    height: constraints.maxHeight * 0.5,
                    width: constraints.maxWidth,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                //price
                Text(
                  shoe.name,
                  style: GoogleFonts.bebasNeue(
                      fontSize: constraints.maxHeight * 0.12 * nameScaleFactor,
                      color: Colors.black),
                ),
                //price and cart
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.1),
                            child: Text(
                              '\₹ ${shoe.price}',
                              style: GoogleFonts.bebasNeue(
                                fontSize: constraints.maxHeight *
                                    0.1 *
                                    nameScaleFactor,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.1),
                            child: Text(
                              shoe.category,
                              style: GoogleFonts.bebasNeue(
                                fontSize: constraints.maxHeight *
                                    0.05 *
                                    nameScaleFactor,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: constraints.maxHeight * 0.03),
                        child: Container(
                          padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
