import 'package:flutter/material.dart';

class BotaoVoltar extends StatelessWidget {
  final String texto;
  final Function() funcao;
  const BotaoVoltar({key, required this.texto, required this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: funcao, child: Text(texto));
  }
}