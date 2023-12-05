import 'package:flutter/material.dart';
import 'package:maua/botaovoltar.dart';
import 'package:maua/constants.dart';
import 'package:maua/model.dart/product_model.dart';
import 'package:maua/screens/home/home_screen2.dart';

class SecondPage extends StatelessWidget {
  Product? product;
  SecondPage ({Key? key}) : super(key: key);
  SecondPage.builder ({Key? key, required Product this.product}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      toolbarHeight: 120,
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      title: Image.asset(
        'assets/images/logo.png', 
        height: 80,
        width: 300, // Ajuste a altura conforme necessário
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop(); // Este é o comando para voltar para a página anterior
        },
      ),
    ),
    body: HomeScreen2(),
  );
}



}