import 'package:ecommerce_route/services/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ApiService {
  //final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('${Constants.baseUrl}${Constants.products}'));
    if (response.statusCode == 200) {
      final List<dynamic> productData = json.decode(response.body);
      return productData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
