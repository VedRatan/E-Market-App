import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text)),
  );
}

Future <List<File>> pickImages() async {
  List<File> images = [];
  try {
    await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    ).then((value) {
      if (value != null) {
        value.files.forEach((element) {
          images.add(File(element.path!));
        });
      }
    });
  } catch (e) {
    print(e);
  }
  return images;
}
