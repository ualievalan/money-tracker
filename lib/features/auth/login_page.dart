import 'package:flutter/material.dart';
import 'package:money_tracker/data/auth_service.dart';
import 'package:money_tracker/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final AuthService authService = AuthService();
  final TextEditingController _emailController =
      TextEditingController(text: "beks");
  final TextEditingController _passwordController =
      TextEditingController(text: "admin");
  String _message = "";
  
  
  
  void _login() async {
    String result = await authService.login(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _message = result;
    });
    if (result == "Успешный вход") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/fotka.png', 
              fit: BoxFit.cover,
            ),
          ),
          
          Center(
  child: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85), 
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email / Login",
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _login,
            child: const Text("Login"),
          ),
          const SizedBox(height: 20),
          Text(
            _message,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    ),
  ),
          )]
      ),
    );
  }}