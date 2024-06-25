import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appmovil_epmpolitecnico/src/screens/profile_setup_screen.dart';
import 'package:appmovil_epmpolitecnico/src/models/user.dart';

class MiPerfilScreen extends StatefulWidget {
  @override
  _MiPerfilScreenState createState() => _MiPerfilScreenState();
}

class _MiPerfilScreenState extends State<MiPerfilScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nombreController;
  late TextEditingController _emailController;
  late TextEditingController _telefonoController;
  late TextEditingController _contrasenaActualController;
  late TextEditingController _nuevaContrasenaController;
  late TextEditingController _confirmarContrasenaController;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController();
    _emailController = TextEditingController();
    _telefonoController = TextEditingController();
    _contrasenaActualController = TextEditingController();
    _nuevaContrasenaController = TextEditingController();
    _confirmarContrasenaController = TextEditingController();
    _loadUserData();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _contrasenaActualController.dispose();
    _nuevaContrasenaController.dispose();
    _confirmarContrasenaController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UserModel? userModel = await UserModel.getUserById(user.uid);
      if (userModel != null) {
        setState(() {
          _nombreController.text = userModel.nombreCompleto;
          _emailController.text = userModel.email;
          _telefonoController.text = userModel.telefono;
        });
      }
    }
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState?.validate() ?? false) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          // Update password
          if (_nuevaContrasenaController.text.isNotEmpty) {
            if (_nuevaContrasenaController.text == _confirmarContrasenaController.text) {
              await user.updatePassword(_nuevaContrasenaController.text);

            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Las contraseñas no coinciden')),
              );
              return;
            }
          }

          // Update Firestore
          UserModel updatedUser = UserModel(
            uid: user.uid,
            email: _emailController.text,
            nombreCompleto: _nombreController.text,
            telefono: _telefonoController.text
          );

          await UserModel.updateUser(updatedUser);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Éxito'),
                content: Text('Perfil actualizado exitosamente'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );

        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error actualizando perfil: $e')),
          );
        }
      }
    }
  }

  void _navigateToAdvancedSettings() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileSetupScreen(user: user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF001528),
        iconTheme: const IconThemeData(
          color: Colors.white, // Cambiar el color del icono a blanco
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Información',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _nombreController,
                labelText: 'Nombre de Usuario',
                validator: (value) => value == null || value.isEmpty ? 'Por favor, introduce tu nombre' : null,
              ),
              _buildTextField(
                controller: _emailController,
                labelText: 'Dirección de Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, introduce un email válido';
                  }
                  return null;
                },
                enabled: false,
              ),
              _buildTextField(
                controller: _telefonoController,
                labelText: 'Número de Teléfono',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu teléfono';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Por favor, introduce un teléfono válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Cambiar Contraseña',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildPasswordField(
                controller: _contrasenaActualController,
                labelText: 'Contraseña Actual',
                validator: (value) {
                  if ((_nuevaContrasenaController.text.isNotEmpty || _confirmarContrasenaController.text.isNotEmpty) && value!.isEmpty) {
                    return 'Por favor, introduce tu contraseña actual';
                  }
                  return null;
                },
              ),
              _buildPasswordField(
                controller: _nuevaContrasenaController,
                labelText: 'Nueva Contraseña',
                validator: (value) {
                  if (_contrasenaActualController.text.isNotEmpty && value!.isEmpty) {
                    return 'Por favor, introduce tu nueva contraseña';
                  }
                  if (value != null && value.isNotEmpty && value.length < 6) {
                    return 'La nueva contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              _buildPasswordField(
                controller: _confirmarContrasenaController,
                labelText: 'Confirmar Nueva Contraseña',
                validator: (value) {
                  if (_nuevaContrasenaController.text.isNotEmpty && value != _nuevaContrasenaController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _updateProfile,
                child: Text(
                  'Guardar Información',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _navigateToAdvancedSettings,
                child: Text(
                  'Configuración avanzada',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF001528),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400), // Color tenue para el borde
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400), // Color tenue para el borde
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue), // Color azul para el borde cuando está enfocado
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: validator,
        enabled: enabled,
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400), // Color tenue para el borde
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400), // Color tenue para el borde
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue), // Color azul para el borde cuando está enfocado
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        obscureText: true,
        validator: validator,
      ),
    );
  }
}
