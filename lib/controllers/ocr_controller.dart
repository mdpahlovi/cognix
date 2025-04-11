import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OCRController extends GetxController {
  RxList<XFile> images = <XFile>[].obs;

  void setImage(XFile image) => images.add(image);

  void removeImage(int index) {
    if (index >= 0 && index < images.length) {
      images.removeAt(index);
    } else {
      if (kDebugMode) {
        print("Index out of range");
      }
    }
  }
}
