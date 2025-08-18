<<<<<<< HEAD
import 'package:ewallet/screens/more_menu.dart';
import 'package:flutter/material.dart';
import 'transaction_history_screen.dart';
import 'profile_screen.dart';
import 'payments_history_screen.dart';
=======
// lib/screens/home_screen.dart
// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../services/firestore_service.dart';
import 'send_money_screen.dart';
import 'transaction_history_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'bank_selection_screen.dart';
import 'select_friend_screen.dart';
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

<<<<<<< HEAD
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
=======
  get NumberFormat => null;

  void _onBottomTap(int idx) {
    setState(() => _selectedIndex = idx);
    switch (idx) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SendMoneyScreen(initialRecipient: {}),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TransactionHistoryScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  Widget _actionItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Icon(icon, color: const Color(0xFF6A1B9A), size: 28),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
          _centerNavIcon(Icons.qr_code, "Scan", 0, size: 30), // Barcode icon
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
        _buildQuickActions(),
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
              fontSize: 36, // Increased font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
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
              MoreMenuPage();
            },
          ),
        ],
      ),
    );
  }

  Widget _quickAction(
    IconData icon,
    String label, {
    required Null Function() ontap,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Color(0xFF6A1B9A)),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
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
                      radius: 40, // Final avatar size
                      backgroundImage: NetworkImage(contact["image"]!),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      contact["name"]!,
                      style: const TextStyle(
                        fontSize: 20,
                      ), // Increased text size
=======
    final auth = Provider.of<AuthProvider>(context);
    final uid = auth.user?.uid ?? 'demo_user';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // HEADER
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirestoreService.userDocStream(uid),
            builder: (context, snap) {
              final data = snap.data?.data() ?? {};
              (data['displayName'] ?? auth.user?.displayName ?? 'User')
                  .toString();
              final balanceVal = (data['balance'] != null)
                  ? (data['balance'] as num).toDouble()
                  : 0.0;

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 48,
                  left: 16,
                  right: 16,
                  bottom: 40,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Top row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "CashShare",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6A1B9A),
                            shape: StadiumBorder(),
                          ),
                          child: const Text("+ Add"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Your Balance",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatCurrency(balanceVal),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
                    ),
                  ],
                ),
              );
            },
          ),
<<<<<<< HEAD
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
            _transactionItem(
              "Transfer",
              "Top Up - Rp 1,000,000",
              Colors.red,
              size: 30,
              style: TextStyle(
                fontSize: 40,
                // Increased font size
              ),
            ),
            _transactionItem(
              "Top Up",
              "Top Up - Rp 500,000",
              Colors.green,
              size: 30,
              style: TextStyle(
                fontSize: 40,
                // Increased font size
              ),
            ),
            _transactionItem(
              "Internet",
              "Internet Bill - Rp 150,000",
              Colors.red,
              size: 30,
              style: TextStyle(
                fontSize: 40,
                // Increased font size
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionItem(
    String title,
    String subtitle,
    Color amountColor, {
    required int size,
    required TextStyle style,
  }) {
    return ListTile(
      leading: const Icon(Icons.swap_horiz, color: Color(0xFF6A1B9A)),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        subtitle.split('-').last.trim(),
        style: TextStyle(color: amountColor, fontWeight: FontWeight.bold),
=======

          // ACTION CARD
          Transform.translate(
            offset: const Offset(0, -30),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionItem(
                    icon: Icons.send,
                    label: "Transfer",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SelectFriendScreen(),
                        ),
                      );
                    },
                  ),
                  _actionItem(
                    icon: Icons.account_balance_wallet,
                    label: "Top Up",
                    onTap: () {},
                  ),
                  _actionItem(
                    icon: Icons.account_balance,
                    label: "Withdraw",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BankSelectionScreen(),
                        ),
                      );
                    },
                  ),
                  _actionItem(
                    icon: Icons.more_horiz,
                    label: "More",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // FAVORITES
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Favorites",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SelectFriendScreen(),
                      ),
                    );
                  },
                  child: const Text("See All"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirestoreService.friendsStream(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snap.data?.docs ?? [];
                if (docs.isEmpty) {
                  return const Center(child: Text('No favorites yet'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: docs.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final d = docs[i].data();
                    final name = d['name'] ?? 'Friend';
                    final photo = (d['photoUrl'] ?? '').toString();
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    SendMoneyScreen(initialRecipient: d),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: photo.isNotEmpty
                                ? NetworkImage(photo)
                                : null,
                            backgroundColor: Colors.grey[200],
                            child: photo.isEmpty
                                ? Text(name[0].toUpperCase())
                                : null,
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: 70,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          // RECENT TRANSACTIONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest Transactions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirestoreService.transactionsForUserStream(uid),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snap.data?.docs ?? [];
                if (docs.isEmpty) {
                  return const Center(child: Text('No transactions yet'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final d = docs[i].data();
                    final direction = (d['direction'] ?? 'out').toString();
                    final isIn = direction == 'in' || d['type'] == 'received';
                    final amount = ((d['amount'] ?? 0) as num).toDouble();
                    final cp = d['counterparty'] ?? (d['note'] ?? 'Unknown');

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isIn
                            ? Colors.green[50]
                            : Colors.red[50],
                        child: Icon(
                          isIn ? Icons.arrow_downward : Icons.arrow_upward,
                          color: isIn ? Colors.green : Colors.red,
                        ),
                      ),
                      title: Text(cp.toString()),
                      trailing: Text(
                        '${isIn ? '+' : '-'}${_formatCurrency(amount)}',
                        style: TextStyle(
                          color: isIn ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomTap,
        selectedItemColor: const Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Send'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
      ),
    );
  }
}
