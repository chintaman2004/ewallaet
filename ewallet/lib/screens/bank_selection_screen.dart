// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:ewallet/screens/transfer_to_bank_screen.dart';

class BankSelectionScreen extends StatefulWidget {
  const BankSelectionScreen({super.key});

  @override
  State<BankSelectionScreen> createState() => _BankSelectionScreenState();
}

class _BankSelectionScreenState extends State<BankSelectionScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> banks = [
    {"name": "Habib Bank Limited", "logo": "assets/images/hbl.png"},
    {"name": "United Bank Limited", "logo": "assets/images/ubl.png"},
    {"name": "Allied Bank Limited", "logo": "assets/images/abl.png"},
    {"name": "Meezan Bank", "logo": "assets/images/meezan.png"},
    {"name": "Bank Alfalah", "logo": "assets/images/alfalah.png"},
  ];

  List<Map<String, String>> filteredBanks = [];

  @override
  void initState() {
    super.initState();
    filteredBanks = banks;
  }

  void _filterBanks(String query) {
    setState(() {
      filteredBanks = banks
          .where(
            (bank) => bank["name"]!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Bank"),
        backgroundColor: Colors.green[700],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          // Search box
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterBanks,
              decoration: InputDecoration(
                hintText: "Search bank",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Bank list
          Expanded(
            child: ListView.builder(
              itemCount: filteredBanks.length,
              itemBuilder: (context, index) {
                final bank = filteredBanks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(bank["logo"]!),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      bank["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              TransferToBankScreen(bankName: bank["name"]!),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
