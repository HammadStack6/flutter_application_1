
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'admin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//   void login() {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();

//     // USER LOGIN
//     if (email == "H@gmail.com" && password == "9") {
//       Navigator.push(
//         context,
//         // MaterialPageRoute(builder: (_) => const HomeScreen()),
//         MaterialPageRoute(
//   builder: (_) => const HomeScreen(isAdmin: false),
// ),
//       );
//     }
//     // ADMIN LOGIN
//     else if (email == "admin" && password == "1") {
//       Navigator.push(
//         context,
//         // MaterialPageRoute(builder: (_) => const AdminScreen()),
//         MaterialPageRoute(
//   builder: (_) => const HomeScreen(isAdmin: true),
// ),
//       );
//     }
//     // INVALID
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Invalid email or password")),
//       );
//     }
//   }

void login() {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  if (email == "H@gmail.com" && password == "9") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(isAdmin: false),
      ),
    );
  } 
  else if (email == "admin" && password == "1") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(isAdmin: true),
      ),
    );
  } 
  else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Invalid email or password")),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                );
              },
              child: const Text("Signup"),
            )
          ],
        ),
      ),
    );
  }
}