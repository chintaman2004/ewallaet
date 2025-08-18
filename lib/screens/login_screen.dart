<<<<<<< HEAD
// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:ewallet/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loading = false;

  Future<void> _loginUser() async {
    setState(() => _loading = true);

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Login failed")));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
=======
import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Curved purple header
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: 200,
<<<<<<< HEAD
              color: const Color(0xFF6A1B9A),
              child: const Center(
                child: Text(
                  "CashEase",
                  style: TextStyle(
=======
              color: const Color(0xFF6A1B9A), // Purple shade
              child: Center(
                child: Text(
                  "CashEase",
                  style: const TextStyle(
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

<<<<<<< HEAD
=======
          // Login Form
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email"),
                TextField(
<<<<<<< HEAD
                  controller: _emailController,
=======
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                const Text("Password"),
                TextField(
<<<<<<< HEAD
                  controller: _passwordController,
=======
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),

<<<<<<< HEAD
=======
                // Login Button
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A1B9A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
<<<<<<< HEAD
                    onPressed: _loading ? null : _loginUser,
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
=======
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
                  ),
                ),

                const SizedBox(height: 15),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Don’t have an account? Sign up",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

<<<<<<< HEAD
=======
// Custom curve clipper
>>>>>>> 1d5627f01ba6a4f288c44da132574c621fe1480b
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
