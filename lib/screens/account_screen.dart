import 'package:first_app/widgets/account_widget.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final String _userName = 'Reem elsaeed';
  final String _userEmail = 'reemelsaeed@gmail.com';

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': Icons.shopping_bag_outlined, 'label': 'Orders'},
    {'icon': Icons.badge_outlined, 'label': 'My Details'},
    {'icon': Icons.location_on_outlined, 'label': 'Delivery Address'},
    {'icon': Icons.credit_card_outlined, 'label': 'Payment Methods'},
    {'icon': Icons.local_offer_outlined, 'label': 'Promo Code'},
    {'icon': Icons.notifications_outlined, 'label': 'Notifications'},
    {'icon': Icons.help_outline, 'label': 'Help'},
    {'icon': Icons.error_outline, 'label': 'About'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 8),
            const Divider(height: 1),
            ...List.generate(_menuItems.length, (index) {
              final item = _menuItems[index];
              return Column(
                children: [
                  AccountMenuItem(
                    icon: item['icon'],
                    label: item['label'],
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                ],
              );
            }),
            const SizedBox(height: 16),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF7CD9F0), Color(0xFFEE8CC8)],
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile_placeholder.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.person, color: Colors.white, size: 32),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.edit, size: 16, color: Color(0xFF4CBB87)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(_userEmail, style: TextStyle(color: Colors.grey.shade500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.logout, color: Color(0xFF4CBB87), size: 20),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Log Out',
              style: TextStyle(
                color: Color(0xFF4CBB87),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
