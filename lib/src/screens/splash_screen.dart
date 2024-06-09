import 'package:flutter/material.dart';
import 'package:appmovil_epmpolitecnico/src/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
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