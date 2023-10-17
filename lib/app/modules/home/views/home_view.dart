import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:fake_store/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
            children: [
              Row(
                children: [
                  Container(
                    width: Get.width * 0.6,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          label: Text("Search Product"),
                          suffixIcon: Icon(Icons.search)),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: Get.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          label: Text("Filter"),
                          suffixIcon: Icon(Icons.filter_alt)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: controller.loadProducts(),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.purple,
                        ))
                      : Container(
                          height: Get.height * 0.8,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 6.5 / 9,
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                            ),
                            itemCount: controller.listProduct.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL,
                                    arguments: controller.listProduct[index]);
                              },
                              child: Card(
                                elevation: 3,
                                shadowColor: Colors.grey,
                                color: Colors.white,
                                shape: ShapeBorder.lerp(
                                    RoundedRectangleBorder(),
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    1.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 90,
                                          child: Image.network(
                                            controller
                                                    .listProduct[index].image ??
                                                '',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          controller.listProduct[index].title ??
                                              '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          controller.listProduct[index]
                                                  .description ??
                                              '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${controller.listProduct[index].price.toString()}"),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Text(controller
                                                        .listProduct[index]
                                                        .rating
                                                        ?.rate
                                                        .toString() ??
                                                    ''),
                                              ],
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ))
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.FORM);
        },
        child: Container(
          width: 170,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.purple),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add New Product",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add_circle,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
