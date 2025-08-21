import 'package:flutter/material.dart';

class MoreMenuPage extends StatelessWidget {
  const MoreMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2C6D),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Main Menu'),
                      const SizedBox(height: 8),
                      _buildGrid([
                        {
                          "title": "Top-up",
                          "icon":
                              "https://img.icons8.com/color/96/money-transfer.png",
                        },
                        {
                          "title": "Loan",
                          "icon":
                              "https://img.icons8.com/color/96/request-money.png",
                        },
                        {
                          "title": "Withdraw",
                          "icon":
                              "https://img.icons8.com/color/96/cash-withdrawal.png",
                        },
                        {
                          "title": "Rewards",
                          "icon": "https://img.icons8.com/color/96/prize.png",
                        },
                      ]),
                      const SizedBox(height: 16),
                      _buildSectionTitle('Payment List'),
                      const SizedBox(height: 8),
                      _buildGrid([
                        {
                          "title": "Telco Loan",
                          "icon": "https://img.icons8.com/color/96/phone.png",
                        },
                        {
                          "title": "Cashout",
                          "icon": "https://img.icons8.com/color/96/wallet.png",
                        },
                        {
                          "title": "Bill & Top-up",
                          "icon": "https://img.icons8.com/color/96/bill.png",
                        },
                        {
                          "title": "Loaner",
                          "icon": "https://img.icons8.com/color/96/money.png",
                        },
                        {
                          "title": "Healthcare",
                          "icon":
                              "https://img.icons8.com/color/96/hospital.png",
                        },
                        {
                          "title": "Entertainment",
                          "icon": "https://img.icons8.com/color/96/popcorn.png",
                        },
                        {
                          "title": "Groceries & Shopping",
                          "icon":
                              "https://img.icons8.com/color/96/shopping-cart.png",
                        },
                        {
                          "title": "Game Voucher",
                          "icon":
                              "https://img.icons8.com/color/96/game-controller.png",
                        },
                        {
                          "title": "Burger",
                          "icon":
                              "https://img.icons8.com/color/96/hamburger.png",
                        },
                        {
                          "title": "Travel",
                          "icon":
                              "https://img.icons8.com/color/96/airplane.png",
                        },
                        {
                          "title": "E-Commerce",
                          "icon":
                              "https://img.icons8.com/color/96/online-store.png",
                        },
                        {
                          "title": "Rent",
                          "icon": "https://img.icons8.com/color/96/home.png",
                        },
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Credit Score',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Certify Now'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Rp 24,337,900',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildGrid(List<Map<String, String>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFF3E2C6D),
              child: ClipOval(
                child: Image.network(
                  items[index]["icon"]!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              items[index]["title"]!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}
