import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController descC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  RxString selectedCat = "electronics".obs;

  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> selectImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
  }
}
