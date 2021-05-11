import 'package:flutter/material.dart';
import 'package:tarefas/tema/tema.dart';
import 'package:tarefas/telas/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Tarefas',
      themeMode: ThemeMode.system, // define o tema automaticamente
      theme: lightTheme(), // tema principal
      darkTheme: darkTheme(), // tema escuro
      home: Home(),
    ),
  );
}
