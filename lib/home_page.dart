import 'package:flutter/material.dart';
import 'package:latihan_kuis/auth/login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo $username', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 150, 109, 88),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                (router) => false,
              );
            },
            icon: Icon(Icons.logout_outlined, color: Colors.red),
          ),
        ],
      ),

      body: Center(
        child: Image.asset('assets/banner.jpg', width: 200, height: 200),
      ),
    );
  }
}
