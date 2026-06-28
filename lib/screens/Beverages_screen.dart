import 'package:flutter/material.dart';

class BeveragesScreen extends StatefulWidget {
  final String categoryTitle;
  final Color categoryColor;

  const BeveragesScreen({
    super.key,
    this.categoryTitle = 'Beverages',
    this.categoryColor = const Color(0xFFD9EEF7),
  });

  @override
  State<BeveragesScreen> createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  final List<Map<String, dynamic>> _products = [
    {
      'image': 'assets/images/diet_coke.png',
      'name': 'Diet Coke',
      'subtitle': '355ml, Price',
      'price': 1.99,
      'qty': 0,
    },
    {
      'image': 'assets/images/sprite.png',
      'name': 'Sprite Can',
      'subtitle': '325ml, Price',
      'price': 1.50,
      'qty': 0,
    },
    {
      'image': 'assets/images/apple_grape_juice.png',
      'name': 'Apple & Grape Juice',
      'subtitle': '2L, Price',
      'price': 15.99,
      'qty': 0,
    },
    {
      'image': 'assets/images/orange_juice.png',
      'name': 'Orange Juice',
      'subtitle': '2L, Price',
      'price': 15.99,
      'qty': 0,
    },
    {
      'image': 'assets/images/coca_cola.png',
      'name': 'Coca Cola Can',
      'subtitle': '325ml, Price',
      'price': 4.99,
      'qty': 0,
    },
    {
      'image': 'assets/images/pepsi.png',
      'name': 'Pepsi Can',
      'subtitle': '330ml, Price',
      'price': 4.99,
      'qty': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          widget.categoryTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded, size: 20, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final p = _products[index];
          return _ProductCard(
            imagePath: p['image'],
            name: p['name'],
            subtitle: p['subtitle'],
            price: p['price'],
            qty: p['qty'],
            onAdd: () => setState(() => _products[index]['qty']++),
            onRemove: () {
              if (_products[index]['qty'] > 0) {
                setState(() => _products[index]['qty']--);
              }
            },
          );
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;
  final double price;
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const _ProductCard({
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.qty,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                  size: 48,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              qty == 0
                  ? GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CBB87),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: onRemove,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.remove, size: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            '$qty',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        GestureDetector(
                          onTap: onAdd,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4CBB87),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
