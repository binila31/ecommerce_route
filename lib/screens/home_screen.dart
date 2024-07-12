import 'package:ecommerce_route/providers/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/product_item.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'all';

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Commerce App')),
      body: ProductItem(category: _selectedCategory),
      bottomNavigationBar: BottomNavBar(
        onSelectCategory: (category) {
          setState(() {
            _selectedCategory = category;
          });
        },
      ),
    );
  }

}


