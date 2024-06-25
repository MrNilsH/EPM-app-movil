import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String email;
  String nombreCompleto;
  String telefono;
  int? edad;
  String? genero;
  double? peso;
  double? altura;
  String? nivelActividadFisica;
  String? objetivoPrincipal;
  String? preferenciasDieteticas;
  String? restriccionesAlimenticias;
  String? tipoEjercicioPreferido;
  DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.nombreCompleto,
    required this.telefono,
    this.edad,
    this.genero,
    this.peso,
    this.altura,
    this.nivelActividadFisica,
    this.objetivoPrincipal,
    this.preferenciasDieteticas,
    this.restriccionesAlimenticias,
    this.tipoEjercicioPreferido,
    this.createdAt,
  });

  // Método para convertir un documento Firestore en una instancia de UserModel
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      email: data['correo_electronico'] ?? '',
      nombreCompleto: data['nombre_completo'] ?? '',
      telefono: data['telefono'] ?? '',
      edad: data['edad'] ?? 0,
      genero: data['genero'] ?? '',
      peso: (data['peso'] ?? 0.0).toDouble(),
      altura: (data['altura'] ?? 0.0).toDouble(),
      nivelActividadFisica: data['nivel_actividad_fisica'] ?? '',
      objetivoPrincipal: data['objetivos'] ?? '',
      preferenciasDieteticas: data['preferencias_dieteticas'] ?? '',
      restriccionesAlimenticias: data['restricciones_alimenticias'] ?? '',
      tipoEjercicioPreferido: data['tipo_ejercicio_preferido'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  // Método para convertir una instancia de UserModel a un mapa de datos Firestore
  Map<String, dynamic> toMap() {
    return {
      'correo_electronico': email,
      'nombre_completo': nombreCompleto,
      'telefono': telefono,
      'edad': edad,
      'genero': genero,
      'peso': peso,
      'altura': altura,
      'nivel_actividad_fisica': nivelActividadFisica,
      'objetivos': objetivoPrincipal,
      'preferencias_dieteticas': preferenciasDieteticas,
      'restricciones_alimenticias': restriccionesAlimenticias,
      'tipo_ejercicio_preferido': tipoEjercicioPreferido,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  //Usuario por ID
  static Future<UserModel?> getUserById(String uid) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromDocument(doc);
    }
    return null;
  }

  //Crear Usuario
  static Future<User?> registerUser(String nombreCompleto, String email, String telefono, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {

        await user.updateDisplayName(nombreCompleto);
        await user.reload();

        UserModel newUser = UserModel(
          uid: user.uid,
          email: email,
          nombreCompleto: nombreCompleto,
          telefono: telefono,
          createdAt: DateTime.now(),
        );

        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(newUser.toMap());
        return FirebaseAuth.instance.currentUser;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  //Actualizar Usuario
  static Future<void> updateUser(UserModel user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update(user.toMap());
  }
}
