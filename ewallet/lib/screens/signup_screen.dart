// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final _confirmC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    _confirmC.dispose();
    super.dispose();
  }

  void _signup(AuthProvider auth) async {
    if (!_formKey.currentState!.validate()) return;
    if (_passC.text.trim() != _confirmC.text.trim()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords don't match")));
      return;
    }
    await auth.signUp(email: _emailC.text.trim(), password: _passC.text.trim());
    if (auth.error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(auth.error!)));
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (r) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _emailC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter email' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passC,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (v) => (v == null || v.length < 6)
                      ? 'Password min 6 chars'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _confirmC,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  validator: (v) =>
                      (v == null || v.length < 6) ? 'Confirm password' : null,
                ),
                const SizedBox(height: 24),
                auth.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () => _signup(auth),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text('Create Account'),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
