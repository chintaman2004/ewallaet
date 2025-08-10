import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 26, 125),
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Login'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 97, 26, 125),
        elevation: 0,
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Cash Share!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 97, 26, 125),
                ),
              ),
              const SizedBox(height: 150),

              const SizedBox(height: 10),
              Text(
                'Login',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 97, 26, 125),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: Color.fromARGB(255, 244, 244, 244),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: Color.fromARGB(255, 244, 244, 244),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  backgroundColor: const Color.fromARGB(255, 89, 28, 114),
                  textStyle: TextStyle(color: Color(0xFFFFFFFF)),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 125),
            ],
          ),
        ),
      ),
    );
  }
}
