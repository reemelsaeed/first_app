import 'package:first_app/screens/checkout_screen.dart';
import 'package:first_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String subtitle;
  final String imagePath;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _items = [
    CartItem(
      id: '1',
      name: 'Bell Pepper Red',
      subtitle: '1kg, Price',
      imagePath: 'assets/images/bell_pepper.png',
      price: 4.99,
    ),
    CartItem(
      id: '2',
      name: 'Egg Chicken Red',
      subtitle: '4pcs, Price',
      imagePath: 'assets/images/eggs.png',
      price: 1.99,
    ),
    CartItem(
      id: '3',
      name: 'Organic Bananas',
      subtitle: '12kg, Price',
      imagePath: 'assets/images/bananas.png',
      price: 3.00,
    ),
    CartItem(
      id: '4',
      name: 'Ginger',
      subtitle: '250gm, Price',
      imagePath: 'assets/images/ginger.png',
      price: 2.99,
    ),
  ];

  double get _totalPrice => _items.fold(0, (sum, item) => sum + item.total);

  void _increment(CartItem item) => setState(() => item.quantity++);

  void _decrement(CartItem item) {
    setState(() {
      if (item.quantity > 1) item.quantity--;
    });
  }

  void _remove(CartItem item) {
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
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _items.isEmpty
                  ? const Center(child: Text('السلة فاضية دلوقتي'))
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: _items.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return CartItemTile(
                          imagePath: item.imagePath,
                          name: item.name,
                          subtitle: item.subtitle,
                          price: item.total,
                          quantity: item.quantity,
                          onIncrement: () => _increment(item),
                          onDecrement: () => _decrement(item),
                          onRemove: () => _remove(item),
                        );
                      },
                    ),
            ),
            if (_items.isNotEmpty) _buildCheckoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutScreen(totalPrice: _totalPrice),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CBB87),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Go to Checkout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '\$${_totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
