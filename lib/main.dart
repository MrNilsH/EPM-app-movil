import 'package:flutter/material.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/profile_setup_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuSalud App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(nextScreen: LoginScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}
