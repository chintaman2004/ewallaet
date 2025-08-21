// ignore_for_file: duplicate_import

import 'package:ewallet/screens/more_menu.dart';
import 'package:flutter/material.dart';
import 'transaction_history_screen.dart';
import 'profile_screen.dart';
import 'payments_history_screen.dart';
import 'more_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    TransactionHistoryScreen(),
    PaymentsHistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildCustomNavBar(),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        color: Color(0xFF6A1B9A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(Icons.home, "Home", 0, size: 30),
          _navIcon(Icons.swap_horiz, "Transactions", 1, size: 30),
          _centerNavIcon(Icons.qr_code, "Scan", 0, size: 30),
          _navIcon(Icons.payment, "Payments", 2, size: 30),
          _navIcon(Icons.person, "Profile", 3, size: 30),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, String label, int index, {required int size}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _centerNavIcon(
    IconData icon,
    String label,
    int index, {
    required int size,
  }) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(icon, color: Color(0xFF6A1B9A), size: 30),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        _buildQuickActions(context),
        _buildSendAgain(),
        _buildLatestTransactions(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF6A1B9A),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/logo.png", height: 28, width: 28),
                  const SizedBox(width: 8),
                  const Text(
                    "CashEase",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.notifications, color: Colors.white),
                  SizedBox(width: 16),
                  Icon(Icons.account_circle, color: Colors.white),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Total Balance", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          const Text(
            "Rp 24,321,900",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _quickAction(Icons.send, "Transfer", ontap: () {}),
          _quickAction(Icons.receipt, "Pay Bill", ontap: () {}),
          _quickAction(Icons.money_off, "Withdraw", ontap: () {}),
          _quickAction(
            Icons.more_horiz,
            "More",
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MoreMenuPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _quickAction(
    IconData icon,
    String label, {
    required VoidCallback ontap,
  }) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon, color: Color(0xFF6A1B9A)),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSendAgain() {
    final List<Map<String, String>> contacts = [
      {
        "name": "You",
        "image":
            "https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg",
      },
      {
        "name": "Maria",
        "image":
            "https://images.pexels.com/photos/445109/pexels-photo-445109.jpeg",
      },
      {
        "name": "Alex",
        "image":
            "https://images.pexels.com/photos/819530/pexels-photo-819530.jpeg",
      },
      {
        "name": "John",
        "image":
            "https://images.pexels.com/photos/713520/pexels-photo-713520.jpeg",
      },
      {
        "name": "Lina",
        "image":
            "https://images.pexels.com/photos/354951/pexels-photo-354951.jpeg",
      },
      {
        "name": "Boom",
        "image":
            "https://images.pexels.com/photos/2156/sky-earth-space-working.jpg",
      },
      {
        "name": "Sara",
        "image":
            "https://images.pexels.com/photos/415263/pexels-photo-415263.jpeg",
      },
      {
        "name": "Gaga",
        "image":
            "https://images.pexels.com/photos/1035682/pexels-photo-1035682.jpeg",
      },
      {
        "name": "Rabica",
        "image":
            "https://images.pexels.com/photos/1250643/pexels-photo-1250643.jpeg",
      },
      {
        "name": "Sam",
        "image":
            "https://images.pexels.com/photos/988914/pexels-photo-988914.jpeg",
      },
      {
        "name": "Magic",
        "image":
            "https://images.pexels.com/photos/270859/pexels-photo-270859.jpeg",
      },
      {
        "name": "Sally",
        "image":
            "https://images.pexels.com/photos/774866/pexels-photo-774866.jpeg",
      },
      {
        "name": "You",
        "image":
            "https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg",
      },
      {
        "name": "Maria",
        "image":
            "https://images.pexels.com/photos/445109/pexels-photo-445109.jpeg",
      },
      {
        "name": "Alex",
        "image":
            "https://images.pexels.com/photos/819530/pexels-photo-819530.jpeg",
      },
      {
        "name": "John",
        "image":
            "https://images.pexels.com/photos/713520/pexels-photo-713520.jpeg",
      },
      {
        "name": "Lina",
        "image":
            "https://images.pexels.com/photos/354951/pexels-photo-354951.jpeg",
      },
      {
        "name": "Boom",
        "image":
            "https://images.pexels.com/photos/2156/sky-earth-space-working.jpg",
      },
      {
        "name": "Sara",
        "image":
            "https://images.pexels.com/photos/415263/pexels-photo-415263.jpeg",
      },
      {
        "name": "Gaga",
        "image":
            "https://images.pexels.com/photos/1035682/pexels-photo-1035682.jpeg",
      },
      {
        "name": "Rabica",
        "image":
            "https://images.pexels.com/photos/1250643/pexels-photo-1250643.jpeg",
      },
      {
        "name": "Sam",
        "image":
            "https://images.pexels.com/photos/988914/pexels-photo-988914.jpeg",
      },
      {
        "name": "Magic",
        "image":
            "https://images.pexels.com/photos/270859/pexels-photo-270859.jpeg",
      },
      {
        "name": "Sally",
        "image":
            "https://images.pexels.com/photos/774866/pexels-photo-774866.jpeg",
      },
      {
        "name": "You",
        "image":
            "https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg",
      },
      {
        "name": "Maria",
        "image":
            "https://images.pexels.com/photos/445109/pexels-photo-445109.jpeg",
      },
      {
        "name": "Alex",
        "image":
            "https://images.pexels.com/photos/819530/pexels-photo-819530.jpeg",
      },
      {
        "name": "John",
        "image":
            "https://images.pexels.com/photos/713520/pexels-photo-713520.jpeg",
      },
      {
        "name": "Lina",
        "image":
            "https://images.pexels.com/photos/354951/pexels-photo-354951.jpeg",
      },
      {
        "name": "Boom",
        "image":
            "https://images.pexels.com/photos/2156/sky-earth-space-working.jpg",
      },
      {
        "name": "Sara",
        "image":
            "https://images.pexels.com/photos/415263/pexels-photo-415263.jpeg",
      },
      {
        "name": "Gaga",
        "image":
            "https://images.pexels.com/photos/1035682/pexels-photo-1035682.jpeg",
      },
      {
        "name": "Rabica",
        "image":
            "https://images.pexels.com/photos/1250643/pexels-photo-1250643.jpeg",
      },
      {
        "name": "Sam",
        "image":
            "https://images.pexels.com/photos/988914/pexels-photo-988914.jpeg",
      },
      {
        "name": "Magic",
        "image":
            "https://images.pexels.com/photos/270859/pexels-photo-270859.jpeg",
      },
      {
        "name": "Sally",
        "image":
            "https://images.pexels.com/photos/774866/pexels-photo-774866.jpeg",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Send Again",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(contact["image"]!),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      contact["name"]!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLatestTransactions() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Latest Transactions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _transactionItem("Transfer", "Top Up - Rp 1,000,000", Colors.red),
            _transactionItem("Top Up", "Top Up - Rp 500,000", Colors.green),
            _transactionItem(
              "Internet",
              "Internet Bill - Rp 150,000",
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionItem(String title, String subtitle, Color amountColor) {
    return ListTile(
      leading: const Icon(Icons.swap_horiz, color: Color(0xFF6A1B9A)),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        subtitle.split('-').last.trim(),
        style: TextStyle(color: amountColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
