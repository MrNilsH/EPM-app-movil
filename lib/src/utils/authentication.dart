import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

       if (userCredential.user != null) {
         final prefs = await SharedPreferences.getInstance();
         await prefs.setBool('isLoggedIn', true);
         return userCredential.user;
       } else {
         return null;
       }

    } catch (e) {
      print("Error in login: $e");
      return null;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
