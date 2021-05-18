import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  final List conteudo;

  // Recebe os dados da tela anterior
  Dados({Key key, @required this.conteudo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados do Usuário')),
      body: Center(
        child: Column(
          children: [
            Text(conteudo[0], style: TextStyle(fontSize: 20)),
            Text(conteudo[1], style: TextStyle(fontSize: 20)),
            MaterialButton(
              // cria um botão para retornar à tela anterior
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
