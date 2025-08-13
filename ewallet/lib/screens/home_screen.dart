// lib/screens/home_screen.dart
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
import 'package:ewallet/screens/select_friend_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onBottomTap(int idx) {
    setState(() => _selectedIndex = idx);
    switch (idx) {
      case 0:
        // stay on home
        break;
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
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xFFEEF3FF),
            child: Icon(icon, color: const Color(0xFF6A1B9A), size: 26),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final uid = auth.user?.uid ?? 'demo_user';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Purple curved header
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirestoreService.userDocStream(uid),
            builder: (context, snap) {
              final data = snap.data?.data() ?? {};
              final displayName =
                  (data['displayName'] ?? auth.user?.displayName ?? 'User')
                      .toString();
              final balanceVal = (data['balance'] != null)
                  ? (data['balance'] as num).toDouble()
                  : 0.0;

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 44,
                  left: 16,
                  right: 16,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF6A1B9A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    // top row: logo + add
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/cash_share_logo.png',
                              height: 32,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Cash Share',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6A1B9A),
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                          ),
                          child: const Text('+ Add'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // balance + greeting
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Welcome, $displayName',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Rs ${balanceVal.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Your Cash Share balance',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          // Floating white card with 4 actions
          Transform.translate(
            offset: const Offset(0, -28),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _actionItem(
                      icon: Icons.account_balance_wallet,
                      label: 'Top Up',
                      onTap: () {
                        // top up
                      },
                    ),
                    _actionItem(
                      icon: Icons.send,
                      label: 'Pay',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SelectFriendScreen(),
                        ),
                      ),
                    ),
                    _actionItem(
                      icon: Icons.account_balance,
                      label: 'Bank',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BankSelectionScreen(),
                        ),
                      ),
                    ),
                    _actionItem(
                      icon: Icons.more_horiz,
                      label: 'More',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Favorites (friends) header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Favorit Kamu',
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
                  child: const Text('See all'),
                ),
              ],
            ),
          ),

          // Friends carousel
          SizedBox(
            height: 98,
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
                            // start transfer to this friend
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    SendMoneyScreen(initialRecipient: d),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 30,
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
                          width: 72,
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

          const SizedBox(height: 12),

          // Recent transactions header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Latest Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Transactions list (expand)
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

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: docs.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, i) {
                    final d = docs[i].data();
                    final direction = (d['direction'] ?? 'out').toString();
                    final isIn = direction == 'in' || d['type'] == 'received';
                    final amount = ((d['amount'] ?? 0) as num).toDouble();
                    final cp = d['counterparty'] ?? (d['note'] ?? 'Unknown');
                    final dateTs = d['date'] as Timestamp?;
                    final dateStr = dateTs != null
                        ? (dateTs.toDate()).toLocal().toString().split(' ')[0]
                        : '';

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
                      subtitle: Text('${d['note'] ?? ''} • $dateStr'),
                      trailing: Text(
                        '${isIn ? '+' : '-'}Rs ${amount.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: isIn ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // optionally show transaction details
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomTap,
        selectedItemColor: const Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Send'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
