import 'package:ecommerce_route/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/product_provider.dart';

class ProductItem extends StatelessWidget {
  final String category;

  ProductItem({required this.category});

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductProvider>(context).getCategoryProducts(category);

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        final product = products[index];
        return ListTile(
          leading: Image.network(product.image, width: 50, height: 50),
          title: Text(product.title),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            //   context.go('/product/${product.id}');
            context.go('/product/${product.id}');
            //   context.go('/product-detail/${product.id}');
          },
        );
      },
    );
  }
}
