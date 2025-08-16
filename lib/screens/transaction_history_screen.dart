import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example static data for transactions
    final List<Map<String, dynamic>> transactions = [
      {
        "type": "Sent",
        "name": "John Doe",
        "amount": -50.0,
        "date": "2025-08-01",
      },
      {
        "type": "Received",
        "name": "Alice Smith",
        "amount": 120.0,
        "date": "2025-08-03",
      },
      {
        "type": "Sent",
        "name": "Mike Johnson",
        "amount": -30.0,
        "date": "2025-08-05",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF6A1B9A),
      body: Column(
        children: [
          // Curved purple header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: const BoxDecoration(
              color: Color(0xFF6A1B9A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Transaction History",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your recent transactions",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // White rounded section for list
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView.separated(
                itemCount: transactions.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  final isReceived = tx["amount"] > 0;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isReceived ? Colors.green : Colors.red,
                      child: Icon(
                        isReceived ? Icons.arrow_downward : Icons.arrow_upward,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(tx["name"]),
                    subtitle: Text("${tx["type"]} • ${tx["date"]}"),
                    trailing: Text(
                      "${isReceived ? "+" : ""}${tx["amount"]} USD",
                      style: TextStyle(
                        color: isReceived ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
