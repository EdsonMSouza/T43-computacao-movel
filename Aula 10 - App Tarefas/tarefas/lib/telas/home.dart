import 'dart:convert'; // json
import 'dart:io'; // File
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // criar uma lista para receber as tarefas
  List _toDoList = [];

  // controller para a lista
  final _toDoController = TextEditingController();

  // índice para controlar o último elemento da lista removido
  int _indiceUltimoRemovido;

  // guarda o elemento removido (temporário)
  Map<String, dynamic> _ultimoRemovido;

  // toda vez que carregar o App, vamos ler o estado inicial
  @override
  void _iniState() {
    super.initState();
    _lerDados().then((value) {
      setState(() {
        _toDoList = json.decode(value);
      });
    });
  }

  // "async" - determina que um método será assíncrono, não retorna
  // nada imediatamente

  // "await" - determina que o aplicativo espere uma resposta de
  // uma determinada função para poder continuar a execução

  // "Future" - determina que uma função vai retornar algo no "futuro",
  // ou seja, levará um tempo para ser finalizada.

  Future<String> _lerDados() async {
    try {
      final arquivo = await _abreArquivo();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _abreArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/todolist.json");
  }

  Future<File> _salvarDados() async {
    String dados = json.encode(_toDoList); // passa a lista de tarefas
    final arquivo = await _abreArquivo();
    return arquivo.writeAsString(dados);
  }

  Future<Null> _recarregaLista() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _toDoList.sort((a, b) {
        if (a['realizado'] && !b['realizado']) return 1;
        if (!a['realizado'] && b['realizado']) return -1;
        return 0;
      });
      _salvarDados();
    });
    return null;
  }

  void _adicionarTarefa() {
    setState(() {
      Map<String, dynamic> novaTarefa = Map();
      novaTarefa['titulo'] = _toDoController.text;
      novaTarefa['realizado'] = false; // -1
      _toDoController.text = '';
      _toDoList.add(novaTarefa);
      _salvarDados();
    });
  }

  // vamos criar primeiramente a recuperação de uma tarefa apagada (registro)
  Widget widgetTarefa(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red, // ficará vermelho quando arrastar para a esquerda
        child: Align(
          alignment: Alignment(0.85, 0.0),
          child: Icon(
            Icons.delete_sweep_outlined,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      child: CheckboxListTile(
        title: Text(_toDoList[index]['titulo']),
        value: _toDoList[index]['realizado'],
        secondary: CircleAvatar(
          child: Icon(
            _toDoList[index]['realizado'] ? Icons.check : Icons.error,
            color: Theme.of(context).iconTheme.color,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onChanged: (value) {
          setState(() {
            _toDoList[index]['realizado'] = value;
            _salvarDados();
          });
        },
        checkColor: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).secondaryHeaderColor,
      ),
      onDismissed: (direction) {
        setState(() {
          // coloca o registro no temporário
          _ultimoRemovido = Map.from(_toDoList[index]);
          _indiceUltimoRemovido = index;
          _toDoList.removeAt(index);
          _salvarDados();
        });

        final snack = SnackBar(
          content: Text("Tarefa \"${_ultimoRemovido["titulo"]}\" apagada!"),
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () {
              setState(() {
                _toDoList.insert(_indiceUltimoRemovido, _ultimoRemovido);
                _salvarDados();
              });
            },
          ),
          // tempo para desfazer a operação de apagar
          duration: Duration(seconds: 4),
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snack);
      }, // desfazer
    );
  }

  // construção da interface do usuário
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
