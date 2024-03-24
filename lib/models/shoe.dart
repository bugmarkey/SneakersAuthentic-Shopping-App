import 'package:cloud_firestore/cloud_firestore.dart';

class ShoeList {
  final String name;
  final String imageUrl;
  final String price;
  final String category;
  final String descripiton;

  ShoeList({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.descripiton,
  });

  factory ShoeList.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ShoeList(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: data['price'] ?? '',
      category: data['category'] ?? '',
      descripiton: data['description'] ?? '',
    );
  }
}
