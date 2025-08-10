// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    super.dispose();
  }

  void _reset(AuthProvider auth) async {
    if (_emailC.text.trim().isEmpty) return;
    await auth.sendPasswordReset(email: _emailC.text.trim());
    if (auth.error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(auth.error!)));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Reset email sent')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Enter your email to receive a password reset link.'),
            const SizedBox(height: 12),
            TextField(
              controller: _emailC,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            auth.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => _reset(auth),
                    child: const Text('Send'),
                  ),
          ],
        ),
      ),
    );
  }
}
