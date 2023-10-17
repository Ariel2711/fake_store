// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:fake_store/app/data/product_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  FormView({Key? key}) : super(key: key);
  Product product = Get.arguments ?? Product();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Fake Store',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 3,
                  shadowColor: Colors.grey,
                  color: Colors.white,
                  shape: ShapeBorder.lerp(
                      RoundedRectangleBorder(),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      1.5),
                  child: Container(
                      padding: EdgeInsets.all(8),
                      width: Get.width,
                      height: Get.height * 0.3,
                      color: Colors.white,
                      child: (controller.image != null)
                          ? Image.file(
                              File((controller.image?.path ?? '')),
                              fit: BoxFit.contain,
                            )
                          : (product.image ?? '').isNotEmpty
                              ? Image.network(
                                  product.image ?? '',
                                  fit: BoxFit.cover,
                                )
                              : Icon(
                                  Icons.image,
                                  color: Colors.purple,
                                  size: 150,
                                )),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      controller.selectImage();
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: Colors.purple),
                          color: Colors.white),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload Image",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.image,
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 3,
                  shadowColor: Colors.grey,
                  color: Colors.white,
                  shape: ShapeBorder.lerp(
                      RoundedRectangleBorder(),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      1.5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Product Information",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.nameC,
                          decoration: InputDecoration(
                            label: Text("Product Name"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          value: controller.selectedCat.value,
                          onChanged: (newValue) {
                            controller.selectedCat.value = newValue!;
                          },
                          items: <String>[
                            "electronics",
                            "jewelery",
                            "men's clothing",
                            "women's clothing"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value.toString().capitalizeFirst ?? '',
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.nameC,
                          decoration: InputDecoration(
                            label: Text("Price"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.nameC,
                          decoration: InputDecoration(
                            label: Text("Description"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 1)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.purple),
                                      shape: MaterialStateProperty.resolveWith(
                                          (states) => RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)))),
                                  onPressed: () async {},
                                  icon: Icon(Icons.check_circle),
                                  label: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
