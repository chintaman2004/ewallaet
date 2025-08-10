// ignore_for_file: deprecated_member_use

import 'package:ewallet/screens/report.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildHomePage(), // Your original home UI
      const SearchPage(),
      const NotificationsPage(),
      const ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Original Home UI moved into a widget
  Widget _buildHomePage() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 26, 125),
      appBar: AppBar(
        toolbarHeight: 200,
        title: Row(
          children: [
            const Icon(Icons.monetization_on, size: 30, color: Colors.white),
            const SizedBox(width: 15),
            const Text(
              'Cash Share!',
              style: TextStyle(
                color: Color.fromARGB(255, 244, 244, 244),
                fontSize: 15,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            const Text(
              '1,953,000 Points',
              style: TextStyle(
                color: Color.fromARGB(255, 244, 244, 244),
                fontSize: 15,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 97, 26, 125),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavigationBar(
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.people),
                    label: 'Transfer',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.wallet),
                    label: 'Top Up',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.money),
                    label: 'Withdraw',
                  ),
                  NavigationDestination(icon: Icon(Icons.more), label: 'More'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Send Again',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('See All .....', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/837358/pexels-photo-837358.jpeg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Latest Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              _transactionRow('Transfer', 'RS. 600,000/-'),
              _transactionRow('Top Up', 'RS. 600,000/-'),
              _transactionRow('Internet', 'RS. 600,000/-'),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _transactionRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.monetization_on, size: 30, color: Colors.purple),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF6200EE),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Transfer'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ReportPage());
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Notifications Page")));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Profile Page")));
  }
}
