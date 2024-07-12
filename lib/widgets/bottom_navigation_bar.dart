import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function(String) onSelectCategory;

  BottomNavBar({required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inclusive),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.electrical_services),
          label: 'Electronics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.diamond),
          label: 'Jewellery',
        ),
      ],
      onTap: (index) {
        String category;
        switch (index) {
          case 0:
            category = 'all';
            break;
          case 1:
            category = 'electronics';
            break;
          case 2:
            category = 'jewelery';
            break;
          default:
            category = 'all';
        }
        onSelectCategory(category);
      },
    );
  }
}
