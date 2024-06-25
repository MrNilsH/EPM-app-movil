import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appmovil_epmpolitecnico/src/screens/login_screen.dart';
import 'package:appmovil_epmpolitecnico/src/screens/home_screen.dart'; // Asegúrate de que la ruta sea correcta

class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;

  SplashScreen({this.nextScreen}); // Valor opcional

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  _navigateToNext() async {
    await Future.delayed(Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(user: user),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001528), // Cambia el color de fondo aquí
      body: Center(
        child: Image.asset('assets/gifs/loadingApp.gif'), // Ruta al GIF
      ),
    );
  }
}
