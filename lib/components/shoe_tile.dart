import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_ux/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final void Function()? onTap;
  final ShoeList shoe;
  final double nameScaleFactor;
  final Widget? trailing;

  const ShoeTile({
    super.key,
    required this.shoe,
    required this.onTap,
    required this.nameScaleFactor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 3 / 3,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                // Shoe image
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    shoe.imageUrl,
                    height: constraints.maxHeight * 0.5,
                    width: constraints.maxWidth,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                // Shoe name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    shoe.name,
                    style: GoogleFonts.bebasNeue(
                      fontSize: constraints.maxHeight * 0.08 * nameScaleFactor,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Price and trailing widget
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '₹ ${shoe.price}',
                      style: GoogleFonts.bebasNeue(
                        fontSize:
                            constraints.maxHeight * 0.10 * nameScaleFactor,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        shoe.category,
                        style: GoogleFonts.bebasNeue(
                          fontSize:
                              constraints.maxHeight * 0.05 * nameScaleFactor,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                if (trailing != null)
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: constraints.maxHeight * 0.03,
                      ),
                      child: trailing!,
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
