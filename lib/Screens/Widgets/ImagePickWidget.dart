import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class ImagePickWidget extends StatefulWidget {
  @override
  _ImagePickWidgetState createState() => _ImagePickWidgetState();
}

class _ImagePickWidgetState extends State<ImagePickWidget> {
  List<File> selectedImages = [];

  Future<void> pickImages() async {
    final List<XFile> pickedImages = await ImagePicker().pickMultiImage(
      
    );

    if (pickedImages != null && pickedImages.isNotEmpty) {
      setState(() {
        selectedImages.addAll(pickedImages.map((XFile file) => File(file.path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: pickImages,
            child: Text('Pick Images'),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: selectedImages.map((File image) {
                return Image.file(image);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}