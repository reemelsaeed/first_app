import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<Map<String, dynamic>> _items = [
    {'icon': Icons.storefront_outlined, 'label': 'Shop'},
    {'icon': Icons.explore_outlined, 'label': 'Explore'},
    {'icon': Icons.shopping_cart_outlined, 'label': 'Cart'},
    {'icon': Icons.favorite_border, 'label': 'Favourite'},
    {'icon': Icons.person_outline, 'label': 'Account'},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final isActive = index == currentIndex;
            final item = _items[index];
            final activeColor = const Color(0xFF4CBB87);

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item['icon'] as IconData,
                    color: isActive ? activeColor : Colors.grey,
                    size: 22,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item['label'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      color: isActive ? activeColor : Colors.grey,
                      fontWeight: isActive
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
