
import 'package:http/http.dart' as http;
import 'dart:developer';
import '../models/product_model.dart';
import 'dart:convert';

class ProductService {
  static final String url = "http://10.0.2.2:8000/api/products";

  static Future<List<Product>> getAllProduct() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> dataList = responseData['data'] ?? [];
        return dataList.map((item) => Product.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      log("Error in ProductService: ${e.toString()}");
      return [];
    }
  }
}