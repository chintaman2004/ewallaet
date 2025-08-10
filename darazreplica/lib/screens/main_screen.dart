import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DarazReplica Home')),
      body: const Center(
        child: Text('Main product categories and deals go here.'),
      ),
    );
  }
}
