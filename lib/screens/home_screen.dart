import 'package:first_app/screens/product_detailes.dart';
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
      'image': 'assets/images/pngfuel 1.png',
      'name': 'Organic Bananas',
      'subtitle': '7pcs, Price',
      'price': 4.99,
    },
    {
      'image': 'assets/images/pngfuel 6-1.png',
      'name': 'Red Apple',
      'subtitle': '1kg, Price',
      'price': 4.99,
    },
  ];

  final List<Map<String, dynamic>> _bestSelling = [
    {
      'image': 'assets/images/pngfuel 9.png',
      'name': 'Bell Pepper Red',
      'subtitle': '1kg, Price',
      'price': 4.99,
    },
    {
      'image': 'assets/images/pngfuel 6.png',
      'name': 'Ginger',
      'subtitle': '250g, Price',
      'price': 4.99,
    },
  ];

  final List<Map<String, dynamic>> _groceries = [
    {
      'image': 'assets/images/pngfuel 1.png',
      'name': 'Beef Bone',
      'subtitle': '1kg, Price',
      'price': 4.99,
    },
    {
      'image': 'assets/images/pngfuel 6-1.png',
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
        Image.asset('assets/images/logo.png', height: 50),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.location_on, color: Colors.black, size: 18),
            SizedBox(width: 4),
            Text(
              'Dhaka, Banasree',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Icon(Icons.keyboard_arrow_down),
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
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Mask Group.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Image.asset(
                      'assets/images/2771.png',
                      height: 110,
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Fresh Vegetables',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Get Up To 40% OFF',
                            style: TextStyle(
                              color: Color(0xFF4CBB87),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
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
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final p = products[index];
          return _buildProductCard(p);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> p) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              imagePath: p['image'],
              name: p['name'],
              subtitle: p['subtitle'],
              price: p['price'],
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(p['image'], height: 90, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(
              p['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              p['subtitle'],
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${p['price']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF53B175),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['Pulses', 'Rice', 'Spices', 'Oil'];
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: index.isEven
                  ? const Color(0xFFFBE9D5)
                  : const Color(0xFFE3F3E8),
              borderRadius: BorderRadius.circular(14),
            ),
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
        return _buildProductCard(p);
      },
    );
  }
}
