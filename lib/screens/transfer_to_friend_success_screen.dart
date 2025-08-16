// lib/screens/transfer_to_friend_success_screen.dart

import 'package:flutter/material.dart';

class TransferToFriendSuccessScreen extends StatelessWidget {
  final String name;
  final String amount;

  const TransferToFriendSuccessScreen({
    super.key,
    required this.name,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Column(
        children: [
          // Top curved container
          Container(
            height: height * 0.5,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success icon
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green[100],
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green[700],
                    size: 70,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Transfer Successful",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "You have sent Rs. $amount",
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 5),
                Text(
                  "to $name",
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
          ),

          // Bottom buttons
          Expanded(
            child: Center(
              child: SizedBox(
                width: width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green[700],
                    side: BorderSide(color: Colors.green[700]!, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
