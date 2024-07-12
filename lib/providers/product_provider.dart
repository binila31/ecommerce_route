import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = true;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  ProductProvider() {
    fetchProducts();
  }
  Future<void> fetchProducts() async {
    final url = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as List<dynamic>;
    _isLoading = true;
    _products = extractedData.map((data) => Product.fromJson(data)).toList();
    notifyListeners();
  }

  List<Product> getCategoryProducts(String category) {
    if (category == 'all') {
      return _products;
    }
    return _products.where((prod) => prod.category == category).toList();
  }
}


