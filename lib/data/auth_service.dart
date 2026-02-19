import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String testEmail = "beks";
  final String testPassword = "admin";
  Future<String> login({required String email, required String password}) async {
    if (email == testEmail && password == testPassword) {
      return "Успешный вход";
    }
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Успешный вход";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Ошибка входа";
    }
  }
  Future<String> register({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Успешная регистрация";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Ошибка регистрации";
    }
  }
  Future<void> logout() async {
    await _auth.signOut();
  }
  User? get currentUser => _auth.currentUser;
}
