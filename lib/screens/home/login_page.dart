import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maua/constants.dart';
import 'register_page.dart';
import 'dart:convert';
import 'package:maua/screens/home/home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String message = '';

  Future<void> _login(String email, String senha) async {
    if (email.isEmpty || senha.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Preencha todos os campos.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/fazer_login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'senha': senha,
        }),
      );

      if (response.statusCode == 200) {
              showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Bem-Vindo'),
            content: Text('Login Bem-Sucedido.'),
            actions: <Widget>[
              TextButton(
                onPressed:_navigateToHomePage,
                //() {
                //   Navigator.of(context).pop();
                // },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
        // Lógica para lidar com o login bem-sucedido
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Usuário ou senha incorreta.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pagina_cadastro()),
    ).then((value) {
    });
  }

  void _navigateToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    ).then((value) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            height: 250,
            color: kPrimaryColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
              ),
            ),
          ),
          title: null,
        ),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 600,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Faça Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _login(
                        _usernameController.text,
                        _passwordController.text,
                      );
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _navigateToRegisterPage,
                    child: Text('Cadastro'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

