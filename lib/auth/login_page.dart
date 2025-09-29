import 'package:flutter/material.dart';
import 'package:latihan_kuis/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool jikaLoginSukses = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/logo_burger.png', width: 200, height: 200),
                const SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _usernameField(),
                        const SizedBox(height: 10),
                        _passwordField(),
                        const SizedBox(height: 20),
                        _loginButton(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          hintText: 'Username',
          hintStyle: TextStyle(color: const Color.fromARGB(255, 150, 109, 88)),
          labelText: 'Username',
          labelStyle: TextStyle(color: const Color.fromARGB(255, 150, 109, 88)),
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 150, 109, 88),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 150, 109, 88),
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          hintText: 'Password',
          hintStyle: TextStyle(color: const Color.fromARGB(255, 150, 109, 88)),
          labelText: 'Password',
          labelStyle: TextStyle(color: const Color.fromARGB(255, 150, 109, 88)),
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 150, 109, 88),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 150, 109, 88),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 150, 109, 88),
        ),
        onPressed: () {
          String text = " ";
          if (username == "fulan" && password == "fulan") {
            setState(() {
              text = "Login sukses";
              jikaLoginSukses = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage(username: username);
                },
              ),
            );
          } else {
            setState(() {
              text = "Login gagal";
              jikaLoginSukses = false;
            });
          }

          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('login'),
      ),
    );
  }
}
