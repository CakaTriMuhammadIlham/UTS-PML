import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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

                if (box.get(email) == password) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  print('Login gagal. Periksa email atau password Anda.');
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/register'); // Navigasi ke halaman registrasi
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
