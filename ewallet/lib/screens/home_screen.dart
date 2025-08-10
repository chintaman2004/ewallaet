// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:ewallet/screens/send_money_screen.dart';
import 'transactions_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _pages = const [HomeDashboard(), TransactionsScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CashEase', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SendMoneyScreen()),
        ),
        child: const Icon(Icons.send),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF5B2BFF),
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    // Sample static balance & quick actions to match uploaded screenshots
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: const Color(0xFF5B2BFF),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wallet Balance',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$ 3,450.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Top Up'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF5B2BFF),
                        ),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                        label: const Text(
                          'Statement',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Quick Actions',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ActionCard(
                icon: Icons.send,
                label: 'Send',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SendMoneyScreen()),
                ),
              ),
              _ActionCard(icon: Icons.qr_code, label: 'Scan', onTap: () {}),
              _ActionCard(
                icon: Icons.request_page,
                label: 'Request',
                onTap: () {},
              ),
              _ActionCard(icon: Icons.more_horiz, label: 'More', onTap: () {}),
            ],
          ),
          const SizedBox(height: 18),
          const Text('Recent', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (_, i) => ListTile(
                leading: CircleAvatar(child: Text('U${i + 1}')),
                title: Text(
                  i % 2 == 0 ? 'Received from John' : 'Paid to Grocery',
                ),
                subtitle: const Text('2 Aug, 12:30'),
                trailing: Text(i % 2 == 0 ? '+\$120' : '-\$45'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF5B2BFF)),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
