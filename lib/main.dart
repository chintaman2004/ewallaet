// ignore_for_file: unused_import

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'providers/auth_provider.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Web initialization
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBEPXweDV3lOqS2PPIjD1ltyPZ-pKE6joM",
        authDomain: "cashshare-75637.firebaseapp.com",
        projectId: "cashshare-75637",
        storageBucket: "cashshare-75637.appspot.com",
        messagingSenderId: "964805488289",
        appId: "1:964805488289:web:17f976b6d607e1f3270ae0",
        measurementId: "G-R3CLB4M399",
      ),
    );
  } else {
    // Mobile initialization
    await Firebase.initializeApp();
  }

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cash Share",
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6A1B9A),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF6A1B9A),
          secondary: const Color(0xFFF48FB1),
        ),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A1B9A),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
