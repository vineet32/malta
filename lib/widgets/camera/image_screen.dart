import 'dart:io';

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({this.imagePath});

  final String imagePath;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}
