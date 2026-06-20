import 'package:first_app/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';

class FavouriteItem {
  final String id;
  final String name;
  final String subtitle;
  final String imagePath;
  final double price;

  FavouriteItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.imagePath,
    required this.price,
  });
}

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<FavouriteItem> _items = [
    FavouriteItem(
      id: '1',
      name: 'Sprite Can',
      subtitle: '325ml, Price',
      imagePath: 'assets/images/sprite.png',
      price: 1.50,
    ),
    FavouriteItem(
      id: '2',
      name: 'Diet Coke',
      subtitle: '355ml, Price',
      imagePath: 'assets/images/diet_coke.png',
      price: 1.99,
    ),
    FavouriteItem(
      id: '3',
      name: 'Apple & Grape Juice',
      subtitle: '2L, Price',
      imagePath: 'assets/images/apple_grape_juice.png',
      price: 15.50,
    ),
    FavouriteItem(
      id: '4',
      name: 'Coca Cola Can',
      subtitle: '325ml, Price',
      imagePath: 'assets/images/coca_cola.png',
      price: 4.99,
    ),
    FavouriteItem(
      id: '5',
      name: 'Pepsi Can',
      subtitle: '330ml, Price',
      imagePath: 'assets/images/pepsi.png',
      price: 4.99,
    ),
  ];

  void _removeFromFavourites(FavouriteItem item) {
    setState(() => _items.removeWhere((e) => e.id == item.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favourite',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _items.isEmpty
                  ? const Center(child: Text('لسه مفيش حاجة في المفضلة'))
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _items.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return FavouriteItemTile(
                          imagePath: item.imagePath,
                          name: item.name,
                          subtitle: item.subtitle,
                          price: item.price,
                          onTap: () {},
                        );
                      },
                    ),
            ),
            if (_items.isNotEmpty) _buildAddAllButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAllButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            for (final item in _items) {}
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CBB87),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Add All To Cart',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
