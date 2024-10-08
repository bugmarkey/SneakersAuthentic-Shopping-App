import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class ProductUploadPage extends StatefulWidget {
  const ProductUploadPage({super.key});

  @override
  _ProductUploadPageState createState() => _ProductUploadPageState();
}

class _ProductUploadPageState extends State<ProductUploadPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final _formKey = GlobalKey<FormState>();
  String _productName = '';
  String _productCategory = '';
  String _productDescription = '';
  String _productPrice = '';

  Future pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future uploadProduct() async {
    if (_image != null) {
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('products/${Path.basename(_image!.path)}');
      final UploadTask uploadTask =
          storageReference.putFile(File(_image!.path));

      final TaskSnapshot downloadUrl =
          (await uploadTask.whenComplete(() => null));
      final String url = (await downloadUrl.ref.getDownloadURL());

      FirebaseFirestore.instance.collection('products').add({
        'name': _productName,
        'category': _productCategory,
        'description': _productDescription,
        'price': _productPrice,
        'imageUrl': url,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Uploaded Successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Product'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            // Image
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 200,
                color: Colors.grey[200],
                child: _image != null
                    ? Image.file(File(_image!.path))
                    : const Icon(Icons.add_a_photo),
              ),
            ),
            const SizedBox(height: 16),
            // Name
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) => _productName = value,
            ),
            const SizedBox(height: 16),
            // Category
            TextFormField(
              decoration: const InputDecoration(labelText: 'Category'),
              onChanged: (value) => _productCategory = value,
            ),
            const SizedBox(height: 16),
            // Description
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              onChanged: (value) => _productDescription = value,
            ),
            const SizedBox(height: 16),
            // Price
            TextFormField(
              decoration: const InputDecoration(labelText: 'Price'),
              onChanged: (value) => _productPrice = value,
            ),
            const SizedBox(height: 16),
            // Upload Button
            ElevatedButton(
              onPressed: uploadProduct,
              child: const Text('Upload Product'),
            ),
          ],
        ),
      ),
    );
  }
}
