import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (_, i) => Card(
        child: ListTile(
          leading: CircleAvatar(child: Text('T${i + 1}')),
          title: Text(i % 2 == 0 ? 'Received' : 'Payment'),
          subtitle: const Text('1 Aug 2025'),
          trailing: Text(
            i % 2 == 0 ? '+\$${(i + 1) * 10}' : '-\$${(i + 1) * 5}',
          ),
        ),
      ),
    );
  }
}
