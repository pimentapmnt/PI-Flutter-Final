import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// class pagina_cadastro extends StatefulWidget {
//   pagina_cadastro({super.key});
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<pagina_cadastro> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String message = '';

//   Future<void> _register(String email, String senha) async {
//     if (email.isEmpty || senha.isEmpty) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Erro'),
//             content: Text('Preencha todos os campos.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       try {
//         final response = await http.post(
//           Uri.parse(
//               'http://127.0.0.1:8000/api/registrar_usuario/'), // Substitua pela URL correta
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode({
//             'email': email, // Usar a variável 'email' em vez do controlador
//             'senha': senha, // Usar a variável 'senha' em vez do controlador
//           }),
//         );
//         if (response.statusCode == 200) {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('Registro bem-sucedido'),
//                 content: Text('Seu registro foi concluído com sucesso.'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                       ).then((value) {});
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               );
//             },
//           );
//         } else {
//           final jsonResponse = json.decode(response.body);
//           final message = jsonResponse["message"];
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('Erro de registro'),
//                 content: Text(message),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       } catch (e) {
//         print("Erro de rede: $e");
//       }
//     }
//   }

//   void _navigateToLoginPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     ).then((value) {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cadastro'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Senha'),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   _register(
//                     _usernameController.text,
//                     _passwordController.text,
//                   );
//                 },
//                 child: Text('Cadastro'),
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: _navigateToLoginPage,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:maua/constants.dart';

class pagina_cadastro extends StatefulWidget {
  pagina_cadastro({super.key});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<pagina_cadastro> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String message = '';

  Future<void> _register(String email, String senha) async {
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
      try {
        final response = await http.post(
          Uri.parse(
              'http://127.0.0.1:8000/api/registrar_usuario/'), // Substitua pela URL correta
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email': email, // Usar a variável 'email' em vez do controlador
            'senha': senha, // Usar a variável 'senha' em vez do controlador
          }),
        );
        if (response.statusCode == 200) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Registro bem-sucedido'),
                content: Text('Seu registro foi concluído com sucesso.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ).then((value) {});
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          final jsonResponse = json.decode(response.body);
          final message = jsonResponse["message"];
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Erro de registro'),
                content: Text(message),
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
      } catch (e) {
        print("Erro de rede: $e");
      }
    }
  }

  void _navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    ).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            height: 200,
            color: kPrimaryColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
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
                    'Faça Cadastro',
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
                      _register(
                        _usernameController.text,
                        _passwordController.text,
                      );
                    },
                    child: Text('Cadastro'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _navigateToLoginPage,
                    child: Text('Login'),
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
