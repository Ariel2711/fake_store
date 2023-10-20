import 'package:fake_store/app/data/product_model.dart';
import 'package:fake_store/app/data/service_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();

  TextEditingController nameC = TextEditingController();
  TextEditingController descC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  RxString selectedCat = "electronics".obs;

  final ImagePicker picker = ImagePicker();
  XFile? image;
  var path = ''.obs;

  Future<void> selectImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) path.value = image!.path;
  }

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    nameC.text = product.title ?? '';
    priceC.text = (product.price ?? '').toString();
    descC.text = product.description ?? '';
    selectedCat.value = product.category ?? "electronics";
  }

  controllerToModel(Product product) {
    product.title = nameC.text;
    product.price = double.tryParse(priceC.text);
    product.description = descC.text;
    product.category = selectedCat.value;
    product.image = "https://i.pravatar.cc/";
    return product;
  }

  Future<void> storeProduct(
      Product product, bool isUpdate, BuildContext context) async {
    try {
      product = controllerToModel(product);
      !isUpdate
          ? await serviceApi.createProduct(product)
          : await serviceApi.updateProduct(product);

      Get.back();
      Get.snackbar('Success', 'Produk berhasil disimpan');
    } catch (e) {
      print(e.toString());
    }
  }
}
