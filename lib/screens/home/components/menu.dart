import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maua/constants.dart';
import 'package:maua/screens/home/login_page.dart';

class HeaderWebMenu extends StatelessWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: InkWell(
            onTap: () {
              launch('https://maua.br/graduacao/atividades-estudantis/maua-sports');
            },
            child: HeaderMenu(
              title: "Sobre Nós",
              press: () {
                launch('https://maua.br/graduacao/atividades-estudantis/maua-sports');
              },
            ),
          ),
        ),
        SizedBox(width: 40), // Espaçamento entre "Sobre Nós" e o botão
        ElevatedButton(
          onPressed:
           () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ).then((value) {});
                    }
            // Lógica para sair
            // Adicione a lógica de sair aqui
          ,
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 8, 29, 61),
          ),
          child: Text("Sair"),
        ),
      ],
    );
  }
  
}



class MobFooterMenu extends StatelessWidget {
  const MobFooterMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: kPadding,
        ),
        Center(
          child: HeaderMenu(
            press: () {
              launch('https://maua.br/graduacao/atividades-estudantis/maua-sports');
            },
            title: "Sobre nós",
          ),
        ),
        SizedBox(
          width: kPadding,
        ),
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            color: title == "Sociais" || title == "Sobre" ? Colors.black : Colors.white, // Condição para definir a cor do texto
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class MobMenu extends StatefulWidget {
  const MobMenu({Key? key}) : super(key: key);

  @override
  _MobMenuState createState() => _MobMenuState();
}

class _MobMenuState extends State<MobMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderMenu(
            press: () {
              launch('https://linktr.ee/mauaesports');
            },
            title: "Sociais",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {
              launch('https://maua.br/graduacao/atividades-estudantis/maua-sports');
            },
            title: "Sobre",
          ),
          SizedBox(
            height: kPadding,
          ),
        ],
      ),
    );
  }
}
