import 'package:flutter/material.dart';
import 'package:ui_ux/models/shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes
  List<ShoeList> shoes = [
    ShoeList(
        name: 'Air Force 1\'07',
        imageUrl: 'assets/air-force.png',
        price: '10000',
        rating: '4.7',
        descripiton:
            'The radiance lives on in the Nike Air Force 1 \'07, the b-ball OG that puts a fresh spin on what you know best: crisp leather, bold colors and the perfect amount of flash to make you shine.'),
    ShoeList(
        name: 'Air Max',
        imageUrl: 'assets/air-max.png',
        price: '5000',
        rating: '4.5',
        descripiton:
            'The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle outsole, stitched overlays and classic, color-accented TPU plates. Fresh colors give a modern look while Max Air cushioning adds comfort to your journey.'),
    ShoeList(
        name: 'Dunk Low Retro',
        imageUrl: 'assets/dunk-low.png',
        price: '8000',
        rating: '4.8',
        descripiton:
            'The Nike Dunk Low Retro SE brings a new look to the classic design. The premium leather upper features a unique pattern and a mix of textures, while the padded, low-cut collar creates a comfortable feel.'),
    ShoeList(
        name: 'Nike Air Max Plus',
        imageUrl: 'assets/air-max-plus-shoes.png',
        price: '9000',
        rating: '4.6',
        descripiton:
            'The Nike Air Max Plus brings you legendary "Tuned" Air cushioning for extra comfort. It keeps the original inspiration: wavy lines that look like palm leaves and a whale-tail shaped design.'),
  ];
  //user cart
  List<ShoeList> userCart = [];

  //list of shoes for sale
  List<ShoeList> getShoes() {
    return shoes;
  }

  //get cart
  List<ShoeList> getCart() {
    return userCart;
  }

  //add to cart
  void addToCart(ShoeList shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(ShoeList shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
