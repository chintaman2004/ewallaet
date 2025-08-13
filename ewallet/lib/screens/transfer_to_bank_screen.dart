// lib/screens/transfer_to_bank_screen.dart

import 'package:flutter/material.dart';
import 'transfer_to_bank_success_screen.dart';

class TransferToBankScreen extends StatefulWidget {
  final String bankName;

  const TransferToBankScreen({super.key, required this.bankName});

  @override
  State<TransferToBankScreen> createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer to ${widget.bankName}"),
        backgroundColor: Colors.green[700],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bank name display
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.bankName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Account number
              TextFormField(
                controller: _accountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Account Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.account_balance),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter account number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Amount
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Amount (Rs.)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.currency_rupee),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter amount";
                  }
                  if (double.tryParse(value) == null) {
                    return "Enter a valid amount";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Note
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: "Note (optional)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.note),
                ),
              ),
              const SizedBox(height: 30),

              // Confirm Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TransferToBankSuccessScreen(
                            bankName: widget.bankName,
                            amount: _amountController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Confirm Transfer",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
