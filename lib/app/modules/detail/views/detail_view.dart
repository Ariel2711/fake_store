// ignore_for_file: must_be_immutable

import 'package:fake_store/app/data/product_model.dart';
import 'package:fake_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
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
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                product.title ?? '',
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: Get.width * 0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: index == 0 &&
                                    (product.rating?.rate ?? 0) >= 1.0
                                ? Colors.yellow
                                : index == 1 &&
                                        (product.rating?.rate ?? 0) >= 2.0
                                    ? Colors.yellow
                                    : index == 2 &&
                                            (product.rating?.rate ?? 0) >= 3.0
                                        ? Colors.yellow
                                        : index == 3 &&
                                                (product.rating?.rate ?? 0) >=
                                                    4.0
                                            ? Colors.yellow
                                            : index == 4 &&
                                                    (product.rating?.rate ??
                                                            0) >=
                                                        5.0
                                                ? Colors.yellow
                                                : Colors.grey,
                          ),
                          SizedBox(
                            width: 3,
                          )
                        ],
                      ),
                      itemCount: 5,
                    ),
                  ),
                  Text(
                    "${product.rating?.rate ?? 0}/${product.rating?.count ?? 0}",
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text("${product.price.toString()}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              SizedBox(
                height: 10,
              ),
              Text(
                "Product Details",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                product.description ?? '',
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.purple),
                    color: Colors.white),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_offer_rounded,
                      color: Colors.purple,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      product.category ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.FORM, arguments: product);
          },
          child: Icon(Icons.edit),
          backgroundColor: Colors.yellow,
          heroTag: "fabEdit",
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    height: Get.height * 0.37,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          width: Get.width,
                          height: Get.height * 0.15,
                          color: Color.fromARGB(255, 229, 150, 243),
                          child: Icon(
                            Icons.question_mark_rounded,
                            color: Colors.purple,
                            size: 100,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: Get.width,
                            height: Get.height * 0.22,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Are you sure?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.purple,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Do you really want to delete this product? You will not be able to undo this action!",
                                  maxLines: 4,
                                  style: TextStyle(color: Colors.purple),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      style: ButtonStyle(
                                          side:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => BorderSide(
                                                      width: 1,
                                                      color: Colors.purple)),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Colors.white),
                                          shape: MaterialStateProperty.resolveWith(
                                              (states) =>
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)))),
                                      child: Text(
                                        "No",
                                        style: TextStyle(color: Colors.purple),
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) =>
                                                        Colors.purple),
                                            shape: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    25)))),
                                        onPressed: () async {
                                          await controller.deleteProduct(
                                              product, context);
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  )),
            );
          },
          child: Icon(Icons.delete),
          backgroundColor: Colors.red,
          heroTag: "fabDelete",
        )
      ]),
    );
  }
}
