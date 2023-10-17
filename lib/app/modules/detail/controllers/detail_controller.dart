import 'package:fake_store/app/data/product_model.dart';
import 'package:fake_store/app/data/service_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  ServiceApi serviceApi = ServiceApi();
  Future<void> deleteProduct(Product product, BuildContext context) async {
    try {
      await serviceApi.deleteProduct(product.id.toString());
      Get.back();
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Product deleted"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "Close",
          onPressed: () {},
        ),
      ));
    } catch (e) {
      print(e);
    }
  }
}
