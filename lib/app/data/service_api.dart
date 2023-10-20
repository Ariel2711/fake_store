import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fake_store/app/data/product_model.dart';

class ServiceApi {
  String apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> getProducts() async {
    var res = await http.get(Uri.parse('$apiUrl'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> listProduct =
          body.map((dynamic item) => Product().fromJson(item)).toList();
      return listProduct;
    } else {
      print(res.body.toString());
      throw "Failed to get products";
    }
  }

  Future<Product> getProductById(String id) async {
    var res = await http.get(Uri.parse('$apiUrl/$id'));
    if (res.statusCode == 200) {
      return Product().fromJson(json.decode(res.body));
    } else {
      print(res.body.toString());
      throw Exception('Failed to load a product');
    }
  }

  Future<void> createProduct(Product product) async {
    var res = await http.post(
      Uri.parse('$apiUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to post product');
    }
  }

  Future<void> updateProduct(Product product) async {
    var res = await http.put(
      Uri.parse('$apiUrl/${product.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(String id) async {
    var res = await http.get(Uri.parse('$apiUrl/$id'));
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to delete a product');
    }
  }
}
