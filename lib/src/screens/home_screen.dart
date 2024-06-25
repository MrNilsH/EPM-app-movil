import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appmovil_epmpolitecnico/src/widgets/custom_card.dart';
import 'package:appmovil_epmpolitecnico/src/models/card_item.dart';
import 'package:appmovil_epmpolitecnico/src/utils/authentication.dart';
import 'package:appmovil_epmpolitecnico/src/screens/login_screen.dart';
import 'package:appmovil_epmpolitecnico/src/screens/perfil_usuario.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<CardItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = cardItems; // Inicialmente muestra todas las tarjetas
    _searchController.addListener(() {
      filterCards();
    });
  }

  void filterCards() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = cardItems.where((item) {
        return item.title.toLowerCase().contains(query) || item.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _logout() async {
    AuthenticationService auth = AuthenticationService();
    await auth.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF001528),
        iconTheme: const IconThemeData(
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
                decoration: const BoxDecoration(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MiPerfilScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.white),
                title: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _logout();
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          const Text(
            '¡ Bienvenido a tu zona de salud !',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Busca temas de tu interés ...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return CardWidget(cardItem: _filteredItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
