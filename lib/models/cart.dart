import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/models/shoe.dart';

class Cart extends ChangeNotifier {
  // List of shoes
  List<ShoeList> shoes = [];
  // User cart
  Map<ShoeList, int> userCart = {};
  List<ShoeList> menShoes = [];
  List<ShoeList> womenShoes = [];

  Cart() {
    fetchShoes();
  }

  fetchShoes() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    List<ShoeList> shoes =
        snapshot.docs.map((doc) => ShoeList.fromFirestore(doc)).toList();
    this.shoes = shoes;
    shuffleShoes();
    menShoes = getShoesByCategory('men');
    womenShoes = getShoesByCategory('women');
    notifyListeners();
  }

  // Shuffle the list of shoes
  void shuffleShoes() {
    shoes.shuffle(Random());
  }

  // To separate the shoe category
  List<ShoeList> getShoesByCategory(String category) {
    return shoes.where((shoe) => shoe.category == category).toList();
  }

  // Men shoes
  List<ShoeList> men() {
    return menShoes;
  }

  List<ShoeList> women() {
    return womenShoes;
  }

  // List of shoes for sale
  List<ShoeList> getShoes() {
    return shoes;
  }

  // Get cart
  Map<ShoeList, int> getCart() {
    return userCart;
  }

  // Add to cart
  void addToCart(ShoeList shoe) {
    if (userCart.containsKey(shoe)) {
      userCart[shoe] = userCart[shoe]! + 1;
    } else {
      userCart[shoe] = 1;
    }
    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(ShoeList shoe) {
    if (userCart.containsKey(shoe) && userCart[shoe]! > 1) {
      userCart[shoe] = userCart[shoe]! - 1;
    } else {
      userCart.remove(shoe);
    }
    notifyListeners();
  }
}
