import 'package:first_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bannerIndex = 0;
  final PageController _bannerController = PageController();

  final List<Map<String, dynamic>> _exclusiveOffers = [
    {
      'image': 'assets/images/bananas.png',
      'name': 'Organic Bananas',
      'subtitle': '7pcs, Price',
      'price': 4.99,
    },
    {
      'image': 'assets/images/red_apple.png',
      'name': 'Red Apple',
      'subtitle': '1kg, Price',
      'price': 4.99,
    },
  ];

  final List<Map<String, dynamic>> _bestSelling = [
    {
      'image': 'assets/images/bell_pepper.png',
      'name': 'Bell Pepper Red',
      'subtitle': '1kg, Price',
      'price': 4.99,
    },
    {
      'image': 'assets/images/ginger.png',
      'name': 'Ginger',
      'subtitle': '250g, Price',
      'price': 4.99,
    },
  ];

  final List<Map<String, dynamic>> _groceries = [
    {
      'image': 'assets/images/beef_bone.png',
      'name': 'Beef Bone',
      'subtitle': '1kg, Price',
      'price': 4.99,
    },
    {
      'image': 'assets/images/broiler_chicken.png',
      'name': 'Broiler Chicken',
      'subtitle': '1kg, Price',
      'price': 4.99,
    },
  ];

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildLocationHeader(),
            const SizedBox(height: 16),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildBanner(),
            const SizedBox(height: 24),
            _buildSectionHeader('Exclusive Offer'),
            const SizedBox(height: 12),
            _buildHorizontalProducts(_exclusiveOffers),
            const SizedBox(height: 24),
            _buildSectionHeader('Best Selling'),
            const SizedBox(height: 12),
            _buildHorizontalProducts(_bestSelling),
            const SizedBox(height: 24),
            _buildSectionHeader('Groceries'),
            const SizedBox(height: 12),
            _buildCategoryChips(),
            const SizedBox(height: 16),
            _buildGroceriesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationHeader() {
    return Column(
      children: [
        const Icon(Icons.eco, color: Colors.orange, size: 28),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.location_on, color: Colors.black, size: 18),
            SizedBox(width: 4),
            Text(
              'Dhaka, Banassre',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
      ],
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

  Widget _buildBanner() {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _bannerController,
            itemCount: 3,
            onPageChanged: (i) => setState(() => _bannerIndex = i),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBF6EF),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fresh Vegetables',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Get Up To 40% OFF',
                      style: TextStyle(
                        color: Color(0xFF4CBB87),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final isActive = index == _bannerIndex;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF4CBB87)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          'See all',
          style: TextStyle(
            color: Color(0xFF4CBB87),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalProducts(List<Map<String, dynamic>> products) {
    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final p = products[index];
          return ProductCard(
            imagePath: p['image'],
            name: p['name'],
            subtitle: p['subtitle'],
            price: p['price'],
            onAdd: () {},
          );
        },
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['Pulses', 'Rice', 'Spices', 'Oil'];
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: index.isEven
                  ? const Color(0xFFFBE9D5)
                  : const Color(0xFFE3F3E8),
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              categories[index],
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGroceriesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _groceries.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final p = _groceries[index];
        return ProductCard(
          imagePath: p['image'],
          name: p['name'],
          subtitle: p['subtitle'],
          price: p['price'],
          onAdd: () {},
        );
      },
    );
  }
}
