import 'package:flutter/material.dart';

class PaymentsHistoryScreen extends StatelessWidget {
  const PaymentsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A148C), // Purple background
      appBar: AppBar(
        title: const Text(
          "Payments History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4A148C),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildPaymentItem(
              "Netflix Subscription",
              "12 Aug 2025",
              "- \$15.00",
              true,
            ),
            _buildPaymentItem(
              "Spotify Premium",
              "10 Aug 2025",
              "- \$9.99",
              true,
            ),
            _buildPaymentItem(
              "Electricity Bill",
              "05 Aug 2025",
              "- \$120.50",
              false,
            ),
            _buildPaymentItem(
              "Internet Bill",
              "01 Aug 2025",
              "- \$45.00",
              true,
            ),
            _buildPaymentItem(
              "Amazon Purchase",
              "28 Jul 2025",
              "- \$250.00",
              true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentItem(
    String title,
    String date,
    String amount,
    bool success,
  ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(date, style: const TextStyle(color: Colors.grey)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              success ? "Successful" : "Failed",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: success ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
