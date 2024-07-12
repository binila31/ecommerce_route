import 'package:ecommerce_route/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// Replace with actual import path

class ProductDetailScreen extends StatelessWidget {
  // final String productId;
  final int productId;

  ProductDetailScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    // Use try-catch block to handle any potential exceptions
    try {
      final product = productProvider.products.firstWhere(
        (prod) => prod.id == productId,
        orElse: () => throw Exception('Product not found'),
      );
      print('Received Product ID: $productId');
      return Scaffold(
        appBar: AppBar(title: Text(product.title)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                product.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(height: 10),
              Text(
                product.description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Product Not Found'),
        ),
        body: Center(
          child: Text('Product not found.'),
        ),
      );
    }
  }
}
