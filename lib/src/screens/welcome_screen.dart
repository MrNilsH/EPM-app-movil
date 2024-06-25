import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appmovil_epmpolitecnico/src/models/user.dart';
import 'package:appmovil_epmpolitecnico/src/screens/home_screen.dart';
import 'package:appmovil_epmpolitecnico/src/screens/profile_setup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final User user;

  WelcomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    print("User object received: ${user.uid}, ${user.email}, ${user.displayName}");

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome' ,
            style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white),
        ),
         centerTitle: true,
        backgroundColor: Color(0xFF001528),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 15),

            Text(
              'Bienvenido ${user.displayName} a Bienestar en Línea, tu plataforma integral para mejorar tu salud y bienestar. Aquí encontrarás recursos personalizados para guiarte en tu camino hacia una vida más saludable, ya sea a través de consejos útiles o un seguimiento detallado de tus progresos.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 15),

            const Text(
              'A continuación, elige una de las siguientes opciones para configurar tu perfil:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 20),

            Card(
              color: Color(0xFFd2f0c9),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Consultar Consejos y Guía',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Accede a una variedad de consejos útiles y guías para mejorar tu bienestar general.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
                        },
                        child: Text(
                            'Consultar Consejos y Guías',
                            style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Card(
              color: Color(0xFFd8f2d0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Seguimiento Personalizado',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    const Text(
                      'Proporciona algunos datos sobre ti para recibir recomendaciones personalizadas en cuanto a dieta o entrenamientos.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileSetupScreen(user: user)));
                        },
                        child: Text(
                            'Seguimiento Personalizado',
                            style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
