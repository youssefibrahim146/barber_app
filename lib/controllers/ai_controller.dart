import 'dart:convert';
import 'dart:io';

import 'package:barber/constants/app_imports.dart';
import 'package:http/http.dart' as http;

class AIController extends GetxController {
  RxString body = RxString(AppStrings.emptySign);
  Rx<File?> image = Rx<File?>(null);
  RxBool isLoading = RxBool(false);
  HomeController homeController = Get.find();
  Map cuts = {
    "Oval": "assets/images/oval.jpg",
    "Square": "assets/images/square.jpg",
    "Oblong": "assets/images/oblong.jpg",
    "Heart": "assets/images/heart.jpg",
    "Wavy": "assets/images/wavy.jpg",
  };

  void pickImage() async {
    if (image != Rx<File?>(null)) {
      AppDefaults.defaultToast(AppStrings.imageAlreadyUploadedToast);
    } else {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      }
    }
  }

  Future predict() async {
    isLoading.value = true;
    if (image == Rx<File?>(null)) {
      AppDefaults.defaultToast(AppStrings.noImageFoundToast);
      isLoading.value = false;
    } else {
      isLoading.value = true;
      String base64 = base64Encode(image.value!.readAsBytesSync());

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await http.put(
        Uri.parse("https://2ca1-154-176-127-237.ngrok-free.app/api"),
        body: base64,
        headers: requestHeaders,
      );
      print(response.body);
      body.value = response.body;
      isLoading.value = false;
    }
  }

  void resetOnClick() {
    body.value = AppStrings.emptySign;
    image.value = null;
    isLoading.value = false;
    AppDefaults.defaultToast(AppStrings.restedSuccessfullyToast);
  }
}
