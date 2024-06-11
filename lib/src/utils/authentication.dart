import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  Future<bool> login(String email, String password) async {
    try {
      // Simulación de llamada a una API
      await Future.delayed(Duration(seconds: 1)); // Simula un retraso de red

      if (email == 'user@gmail.com' && password == '123456') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error in login: $e");
      return false;
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
    } catch (e) {
      print("Error in logout: $e");
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isLoggedIn') ?? false;
    } catch (e) {
      print("Error in isLoggedIn: $e");
      return false;
    }
  }
}
