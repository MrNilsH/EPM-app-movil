import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appmovil_epmpolitecnico/src/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF001528),
        iconTheme: IconThemeData(
          color: Colors.white, // Cambiar el color del icono a blanco
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF001528),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(20.0), // Ajustar el padding para cambiar el tamaño
                decoration: BoxDecoration(
                  color: Color(0xFF001528),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/logoApp.png', // Ruta de la imagen
                    height: 100.0, // Ajustar el tamaño de la imagen
                    fit: BoxFit.contain, // Ajustar la imagen dentro del espacio disponible
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: const Text(
                  'Inicio',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: const Text(
                  'Mi perfil',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Navegar a la pantalla de perfil
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.white),
                title: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Añadir la lógica para cerrar sesión
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),

          child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 30),

            const Text(
              '¡ Bienvenido a tu zona de salud !',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Busca temas de tu interes ...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),

            SizedBox(height: 20.0),

            CustomCard(
              imagePath: 'assets/images/dietas.png',
              title: 'Dietas Saludables',
              description: 'Esta sección incluye recomendaciones sobre el consumo de frutas, verduras y otros alimentos nutritivos, ayudándote a planificar tus comidas de manera efectiva.',
            ),
            CustomCard(
              imagePath: 'assets/images/ejercicio.png',
              title: 'Mantente en Forma',
              description: 'Aquí encontrarás recursos y consejos para diferentes tipos de actividades, desde entrenamiento con pesas hasta yoga.',
            ),
            CustomCard(
              imagePath: 'assets/images/salud.png',
              title: 'Consejos de Salud',
              description: 'Encuentra valiosos consejos de salud y bienestar en esta sección.',
            ),


          ],
        ),
          ),
        ),
      );
  }
}
