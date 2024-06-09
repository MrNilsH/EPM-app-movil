import 'package:flutter/material.dart';
import 'package:appmovil_epmpolitecnico/src/screens/home_screen.dart';
import 'package:appmovil_epmpolitecnico/src/screens/register_screen.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061829),

      appBar: AppBar(
        backgroundColor: Color(0xFF061829),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra horizontalmente
          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del Row al contenido

          children: [
            SizedBox(width: 10),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2), // Margen superior e inferior
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    'BIENESTAR',
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), // Cambia el tamaño del texto aquí
                  ),
                  Text(
                    'EN LINEA',
                    style: TextStyle(color: Colors.white, fontSize: 16), // Cambia el tamaño del texto aquí
                  ),
                ],

              ),
            ),
          ],
        ),
        centerTitle: true,

      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            const Text(
              'INICIAR SESIÓN',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),

            Text(
              'Correo Electrónico',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            SizedBox(height: 15),
            const Text(
              'Contraseña',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: '***********',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
              obscureText: true,
            ),

            SizedBox(height: 40),

            Center(
              child: Column(
                children: [

                  //BOTÓN INICIO SESIÓN
                  ElevatedButton(

                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005c70), // Cambiar el color del botón
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                        'Iniciar Sesión',
                        style: TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                    ),

                  ),

                  SizedBox(height: 20),

                  //BOTÓN CREAR CUENTA

                  ElevatedButton(

                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005c70), // Cambiar el color del botón
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      'Crear Cuenta',
                      style: TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                    ),

                  ),

                  SizedBox(height: 20),

                  // BOTÓN OLVIDASTE CONTRASEÑA

                  TextButton(

                    onPressed: () {
                      // Aquí puedes añadir la lógica de olvidar contraseña
                    },

                    child: const Text(
                      '¿Olvidaste tu Contraseña?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}