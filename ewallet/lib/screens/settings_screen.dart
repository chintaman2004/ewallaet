import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A1B9A),
      body: Column(
        children: [
          // Curved header
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Manage your app preferences",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // White content area
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
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.purple),
                    title: const Text("Change Password"),
                    onTap: () {
                      // Navigate to change password screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.palette, color: Colors.purple),
                    title: const Text("Theme"),
                    onTap: () {
                      // Theme selection logic
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.purple,
                    ),
                    title: const Text("Notifications"),
                    onTap: () {
                      // Notification settings
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.purple),
                    title: const Text("Language"),
                    onTap: () {
                      // Language selection
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.purple),
                    title: const Text("About"),
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: "Cash Share",
                        applicationVersion: "1.0.0",
                        children: const [
                          Text(
                            "Cash Share is a secure and easy way to send and receive money.",
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
