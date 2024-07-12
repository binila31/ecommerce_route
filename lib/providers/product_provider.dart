import 'package:flutter/material.dart';
import 'package:ecommerce_route/models/product.dart';
import 'package:ecommerce_route/services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = true;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _apiService.fetchProducts();
    } catch (error) {
      // Handle errors appropriately here
      print('Failed to fetch products: $error');
    }

    _isLoading = false;
    notifyListeners();
  }

  List<Product> getCategoryProducts(String category) {
    if (category == 'all') {
      return _products;
    }
    return _products.where((prod) => prod.category == category).toList();
  }
}
