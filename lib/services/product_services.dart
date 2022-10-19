
import 'dart:convert';

import 'package:graduation_project/add_product.dart';
import 'package:graduation_project/model/product_models.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:http/http.dart' as http;


class ProductServices {

  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }

  static Future<List<AddProduct>> getFireProduct() async {
    var response = await http.get(Uri.parse('https://graduation-project-11d5e-default-rtdb.firebaseio.com/product'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return json.decode(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}



