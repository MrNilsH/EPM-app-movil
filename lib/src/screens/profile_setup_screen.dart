import 'package:appmovil_epmpolitecnico/src/screens/perfil_usuario.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart'; // Asegúrate de que la ruta sea correcta

class ProfileSetupScreen extends StatefulWidget {
  final User user;

  ProfileSetupScreen({required this.user});

  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _activityLevelController = TextEditingController();
  final TextEditingController _goalsController = TextEditingController();
  final TextEditingController _dietPreferencesController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();

  bool isLoading = false;
  String errorMessage = '';
  String? _selectedActivityLevel;
  String? _selectedobjetivosLevels;
  String? _selectedpreferencesLevels;

  final List<String> _activityLevels = [
    'Sedentario (Ningún ejercicio)',
    'Ligero (1-3 días/semana)',
    'Moderado (3-5 días/semana)',
    'Activo (6-7 días/semana)',
    'Muy activo (Ejercicio intenso)'
  ];

  final List<String> _objetivosLevels = [
    'Pérdida de peso',
    'Ganancia muscular',
    'Mantenimiento',
    'Mejorar resistencia',
    'Mejorar flexibilidad'
  ];

  final List<String> _preferencesLevels = [
    'Sin restricciones',
    'Vegetariano',
    'Vegano',
    'Paleo',
    'Keto'
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
          setState(() {
            _ageController.text = (data['edad'] ?? '').toString();
            _heightController.text = (data['altura'] ?? '').toString();
            _weightController.text = (data['peso'] ?? '').toString();
            _selectedActivityLevel = data['nivelActividadFisica'] != null && _activityLevels.contains(data['nivelActividadFisica'])
                ? data['nivelActividadFisica']
                : null;
            _selectedobjetivosLevels = data['objetivoPrincipal'] != null && _objetivosLevels.contains(data['objetivoPrincipal'])
                ? data['objetivoPrincipal']
                : null;
            _selectedpreferencesLevels = data['preferenciasDieteticas'] != null && _preferencesLevels.contains(data['preferenciasDieteticas'])
                ? data['preferenciasDieteticas']
                : null;
            _allergiesController.text = data['restriccionesAlimenticias'] ?? '';
          });
          print('Datos del usuario cargados correctamente');
        } else {
          print('No se encontraron datos del usuario');
        }
      } catch (e) {
        print('Error al cargar los datos del usuario: $e');
      }
    } else {
      print('Usuario no autenticado');
    }
  }

  Future<void> _updateProfile() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    if (_formKey.currentState?.validate() ?? false) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          // Imprimir para depuración
          print('Iniciando actualización del perfil');
          print('Edad: ${_ageController.text}');
          print('Altura: ${_heightController.text}');
          print('Peso: ${_weightController.text}');
          print('Nivel de Actividad Física: $_selectedActivityLevel');
          print('Objetivo Principal: $_selectedobjetivosLevels');
          print('Preferencias Dietéticas: $_selectedpreferencesLevels');
          print('Restricciones Alimenticias: ${_allergiesController.text}');

          // Actualizar Firestore
          await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
            'edad': int.tryParse(_ageController.text) ?? 0,
            'altura': double.tryParse(_heightController.text) ?? 0.0,
            'peso': double.tryParse(_weightController.text) ?? 0.0,
            'nivelActividadFisica': _selectedActivityLevel ?? '',
            'objetivoPrincipal': _selectedobjetivosLevels ?? '',
            'preferenciasDieteticas': _selectedpreferencesLevels ?? '',
            'restriccionesAlimenticias': _allergiesController.text,
          });

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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MiPerfilScreen()),
                      );
                    },
                  ),
                ],
              );
            },
          );



        } catch (e) {
          print('Error al actualizar el perfil: $e');
          setState(() {
            errorMessage = 'Ocurrió un error al guardar el perfil. Por favor, inténtalo de nuevo.';
          });
        } finally {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          errorMessage = 'Usuario no autenticado';
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configuración de Perfil',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF061829),
        iconTheme: const IconThemeData(
          color: Colors.white, // Cambiar el color del icono a blanco
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Text(
                  widget.user.displayName ?? 'Usuario',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu edad';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu altura';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu peso';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedActivityLevel,
                decoration: InputDecoration(
                  labelText: 'Nivel de Actividad Física',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: _activityLevels.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedActivityLevel = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona tu nivel de actividad física';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedobjetivosLevels,
                decoration: InputDecoration(
                  labelText: 'Objetivos',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: _objetivosLevels.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedobjetivosLevels = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona tu objetivo principal';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedpreferencesLevels,
                decoration: InputDecoration(
                  labelText: 'Preferencias Dietéticas',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: _preferencesLevels.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedpreferencesLevels = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona tu preferencia dietética';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _allergiesController,
                decoration: InputDecoration(
                  labelText: 'Restricciones Alimenticias',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400), // Color tenue para el borde
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400), // Color tenue para el borde
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Color tenue para el borde
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tus restricciones alimenticias';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              if (isLoading)
                Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: _updateProfile,
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
