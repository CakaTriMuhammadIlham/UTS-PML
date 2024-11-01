import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/login'); // Navigasi kembali ke login saat logout
            },
          ),
        ],
      ),
      body: Center(child: Text('Selamat datang di aplikasi Catatan!')),
    );
  }
}
