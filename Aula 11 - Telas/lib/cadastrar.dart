import 'package:flutter/material.dart';
import 'package:telas/main.dart';

class Cadastrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar')),
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            },
            child: Text('Gravar Dados'),
          ),
        ),
      ),
    );
  }
}
