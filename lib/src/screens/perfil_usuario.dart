import 'package:flutter/material.dart';

class MiPerfilScreen extends StatefulWidget {
  @override
  _MiPerfilScreenState createState() => _MiPerfilScreenState();
}

class _MiPerfilScreenState extends State<MiPerfilScreen> {
  final _formKey = GlobalKey<FormState>();

  String nombreUsuario = '';
  String email = '';
  String telefono = '';
  String direccion = '';
  String contrasenaActual = '';
  String nuevaContrasena = '';
  String confirmarContrasena = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF001528),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Acción al presionar el botón de ajustes
            },
            color: Colors.white, // Cambia el color del icono
          ),
          // Agregar más botones de acción si es necesario
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre de Usuario'),
                initialValue: nombreUsuario,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre de usuario';
                  }
                  return null;
                },
                onSaved: (value) {
                  nombreUsuario = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dirección de Email'),
                initialValue: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, introduce un email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de Teléfono'),
                initialValue: telefono,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu teléfono';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Por favor, introduce un teléfono válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  telefono = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dirección'),
                initialValue: direccion,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu dirección';
                  }
                  return null;
                },
                onSaved: (value) {
                  direccion = value ?? '';
                },
              ),
              SizedBox(height: 20),
              Text(
                'Cambiar Contraseña',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña Actual'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu contraseña actual';
                  }
                  return null;
                },
                onSaved: (value) {
                  contrasenaActual = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nueva Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nueva contraseña';
                  }
                  if (value.length < 6) {
                    return 'La nueva contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
                onSaved: (value) {
                  nuevaContrasena = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirmar Nueva Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirma tu nueva contraseña';
                  }
                  if (value != nuevaContrasena) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
                onSaved: (value) {
                  confirmarContrasena = value ?? '';
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // En este espacio iria la parte del proceso de actualización del perfil (conexxion a la bbdd , verificación, etc)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Perfil actualizado')),
                    );
                  }
                },
                child: Text('Guardar Cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
