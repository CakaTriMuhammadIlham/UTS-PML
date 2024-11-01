import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            ElevatedButton(
              onPressed: () {
                final box = Hive.box('userBox');
                final email = _emailController.text;
                final password = _passwordController.text;

                box.put(
                    email, password); // Menyimpan email dan password di Hive
                Navigator.pushReplacementNamed(
                    context, '/home'); // Navigasi ke beranda setelah registrasi
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
