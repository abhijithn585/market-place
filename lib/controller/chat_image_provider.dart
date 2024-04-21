import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatImageProviders extends ChangeNotifier {
  File? selectedImage;
  void selectImage({required source}) async {
    final returnedImage = await ImagePicker().pickImage(source: source);
    if (returnedImage != null) {
      selectedImage = File(returnedImage.path);
      notifyListeners();
    }
  }
}
