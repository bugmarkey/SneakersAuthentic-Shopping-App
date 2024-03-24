import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/models/shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes
  List<ShoeList> shoes = [];
  //user cart
  List<ShoeList> userCart = [];
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

    menShoes = getShoesByCategory('men');
    womenShoes = getShoesByCategory('women');

    notifyListeners();
  }

//To Seperate the shoe category
  List<ShoeList> getShoesByCategory(String category) {
    return shoes.where((shoe) => shoe.category == category).toList();
  }

//men shoes
  List<ShoeList> men() {
    return menShoes;
  }

  List<ShoeList> women() {
    return womenShoes;
  }

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
