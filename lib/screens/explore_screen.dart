import 'package:first_app/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Fresh Fruits\n& Vegetable',
      'image': 'assets/images/fruits_veg.png',
      'color': const Color(0xFFE3F3E8),
    },
    {
      'title': 'Cooking Oil\n& Ghee',
      'image': 'assets/images/cooking_oil.png',
      'color': const Color(0xFFFBE9D5),
    },
    {
      'title': 'Meat & Fish',
      'image': 'assets/images/meat_fish.png',
      'color': const Color(0xFFFAE0E0),
    },
    {
      'title': 'Bakery & Snacks',
      'image': 'assets/images/bakery.png',
      'color': const Color(0xFFF0E6FA),
    },
    {
      'title': 'Dairy & Eggs',
      'image': 'assets/images/dairy.png',
      'color': const Color(0xFFFBF3D2),
    },
    {
      'title': 'Beverages',
      'image': 'assets/images/beverages.png',
      'color': const Color(0xFFD9EEF7),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find Products',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: _categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) {
                    final c = _categories[index];
                    return CategoryCard(
                      title: c['title'],
                      imagePath: c['image'],
                      backgroundColor: c['color'],
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade500),
          const SizedBox(width: 10),
          Text('Search Store', style: TextStyle(color: Colors.grey.shade500)),
        ],
      ),
    );
  }
}
