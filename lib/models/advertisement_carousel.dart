import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:ui_ux/models/ads.dart';

class AdUpload extends StatefulWidget {
  const AdUpload({super.key});

  @override
  State<AdUpload> createState() => _AdUploadState();
}

class _AdUploadState extends State<AdUpload> {
  PlatformFile? pickedfile;

  getImagefromGallery() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      pickedfile = result!.files.first;
    });
    final path = 'advertisement/${pickedfile!.name}';
    final file = File(pickedfile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  uploadImageToFirebase(String imagePath) async {
    File file = File(imagePath);
    try {
      // Generate a unique name for the file
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload the file to a specific folder in Firebase Storage
      await FirebaseStorage.instance
          .ref('advertisements/$fileName')
          .putFile(file);
    } on FirebaseException catch (e) {
      // Handle any errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Carousel Page'),
        ),
        body: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: FileImage(File(imageList[index])),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  getImagefromGallery();
                },
                child: const Text('Add More Images'),
              ),
            ),
            if (pickedfile != null)
              Positioned(
                left: 20.0,
                right: 20.0,
                bottom: 60.0,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: FileImage(File(pickedfile!.path!)),
                          fit: BoxFit.cover)),
                ),
              ),
          ],
        ));
  }
}
