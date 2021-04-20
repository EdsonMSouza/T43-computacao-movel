import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _resultado = '';
  Color _corTexto = Colors.lightGreen[900];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _reset() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _resultado = '';
      _corTexto = Colors.lightGreen[900];
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculaIMC() {
    setState(() {
      double vAltura = double.parse(pesoController.text.replaceAll(',', '.'));
      double vPeso = double.parse(alturaController.text.replaceAll(',', '.'));
      double vImc = vPeso / (vAltura * vAltura);
      _resultado = 'Você está ';
      if (vImc < 18.5) {
        _resultado += 'abaixo do peso.';
        _corTexto = Colors.lightBlue[500];
      } else if (vImc < 25) {
        _resultado += 'bem! Seu peso está normal.';
        _corTexto = Colors.lightGreen[700];
      } else if (vImc < 30) {
        _resultado += 'com sobrepeso.';
        _corTexto = Colors.yellow;
      } else if (vImc < 35) {
        _resultado += 'com obesidade grau I';
        _corTexto = Colors.orange;
      } else if (vImc < 40) {
        _resultado += 'com obesidade grau II';
        _corTexto = Colors.red;
      } else {
        _resultado += 'com obesidade grau III (mórbida). Cuidado!';
        _corTexto = Colors.purple;
      }
      _resultado += ' \nIMC: ' +
          vImc
              .toStringAsFixed(vImc.truncateToDouble() == vImc ? 0 : 2)
              .replaceAll('.', ',');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calcule seu IMC', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.lightGreen[900],
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _reset();
                })
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.accessibility_new_outlined,
                    size: 100.0, color: _corTexto),
                TextFormField(
                    controller: pesoController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty
                        ? 'Informe sua altura em centímetros.'
                        : null,
                    decoration: InputDecoration(
                        labelText: 'Altura em centímetros',
                        labelStyle: TextStyle(color: Colors.lightGreen[900])),
                    style: TextStyle(
                        color: Colors.lightGreen[900], fontSize: 20.0)),
                TextFormField(
                    controller: alturaController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value.isEmpty ? 'Informe seu peso em KG.' : null,
                    decoration: InputDecoration(
                        labelText: 'Peso em KG',
                        labelStyle: TextStyle(color: Colors.lightGreen[900])),
                    style: TextStyle(
                        color: Colors.lightGreen[900], fontSize: 20.0)),
                Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                  child: Container(
                    height: 50.0,
                    child: RawMaterialButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) _calculaIMC();
                        },
                        child: Text('Verificar',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0)),
                        //color: Colors.lightGreen[900]),
                        fillColor: Colors.lightGreen[900]),
                  ),
                ),
                Text(_resultado,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: _corTexto, fontSize: 25.0))
              ],
            ),
          ),
        ));
  }
}
