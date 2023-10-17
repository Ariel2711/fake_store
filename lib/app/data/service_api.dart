import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fake_store/app/data/product_model.dart';

class ServiceApi {
  String apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> getProducts() async {
    final res = await http.get(Uri.parse('$apiUrl'));

    print(res.statusCode);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> listProduct =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      print('length ${listProduct.length}');
      return listProduct;
    } else {
      throw "Failed to get products";
    }
  }

  Future<Product> getProductById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a product');
    }
  }

  Future<String> createProduct(Product product) async {
    var response = await http.post(
      Uri.parse('$apiUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return response.toString();
    } else {
      throw Exception('Failed to post product');
    }
  }

  Future<String> updateProduct(Product product) async {
    var response = await http.put(
      Uri.parse('$apiUrl/${product.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return response.toString();
    } else {
      throw Exception('Failed to update product');
    }
  }

  Future<Product> deleteProduct(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      print(response.body);
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to delete a product');
    }
  }
}
