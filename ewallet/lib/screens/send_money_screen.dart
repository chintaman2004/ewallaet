import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});
  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _to = TextEditingController();
  final _amount = TextEditingController();

  @override
  void dispose() {
    _to.dispose();
    _amount.dispose();
    super.dispose();
  }

  void _send() {
    if (!_formKey.currentState!.validate()) return;
    // For demo, just show confirmation
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm'),
        content: Text('Send \$${_amount.text} to ${_to.text}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sent successfully')),
              );
              Navigator.pop(context);
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _to,
                decoration: const InputDecoration(
                  labelText: 'To (email or phone)',
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Enter recipient' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _amount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Enter amount' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _send, child: const Text('Continue')),
            ],
          ),
        ),
      ),
    );
  }
}
