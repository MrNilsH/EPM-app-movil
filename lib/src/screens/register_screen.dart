import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appmovil_epmpolitecnico/src/screens/login_screen.dart';
import 'package:appmovil_epmpolitecnico/src/screens/welcome_screen.dart';
import 'package:appmovil_epmpolitecnico/src/screens/splash_screen.dart';
import 'package:appmovil_epmpolitecnico/src/models/user.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';

  Future<void> _register() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    User? user = await UserModel.registerUser(
      _usernameController.text,
      _emailController.text,
      _phoneController.text,
      _passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(user: user)),
      );
    } else {
      setState(() {
        errorMessage = 'Error en el registro. Por favor, inténtalo de nuevo.';
      });
    }

  }

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
            SizedBox(height: 30),
            Text(
              'CREAR CUENTA',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),

            Text(
              'Nombres y Apellidos',
              style: TextStyle(color: Colors.white),
            ),

            SizedBox(height: 5),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Nombres y Apellidos',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Correo Electrónico',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Correo Eletrónico',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Teléfono',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Teléfono',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Contraseña',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              ),
              obscureText: true,
            ),

            SizedBox(height: 40),

            Center(
              child: Column(
                children: [
                  if (isLoading)
                    CircularProgressIndicator()
                  else
                  ElevatedButton(

                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005c70),
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                    ),

                  ),

                  SizedBox(height: 20),

                  //BOTÓN VOLVER A INICIO DE SESIÓN

                  ElevatedButton(

                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005c70), // Cambiar el color del botón
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      'Volver',
                      style: TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
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