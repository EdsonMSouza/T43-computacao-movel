// Mapas são listas especiais, que associam um dado sempre à
// uma chave (relação chave-valor, key-value).

import 'dart:convert';

void main(List<String> args) {
  // Mapa literal
  var data = {'name': 'Maria', 'curso': 'TADS'};
  print(data);

  // Também podemos adionar desta forma
  data['idade'] = '51';
  print(data);

  // Mapa tipado
  var cursos = <int, String>{1: 'TADS', 2: 'TGTI', 3: 'TSIN'};
  print(cursos);

  // Mostrando a quantidade de elementos no mapa
  print('Tamanho do mapa: ${cursos.length} elementos');

  // Adicionando elementos no mapa em uma posição específica
  // Se existir o índice, será trocado
  cursos[4] = 'TRC';
  print(cursos);

  // Adicionando ao final do mapa
  cursos.putIfAbsent(cursos.length + 1, () => 'SI');
  print(cursos);

  // Criando um mapa com objetos
  var carros = <String, Veiculo>{};
  carros['ABC-1234'] = Veiculo('Ferrari', 'F-250', 2021);
  carros['ABC-4321'] = Veiculo('Bugatti', 'Veyron', 2022);

  // Mostrando os objetos
  carros.forEach(
      (k, v) => print('Placa: $k: ${v.fabricante}, ${v.modelo} (${v.ano})'));
}

class Veiculo {
  String fabricante;
  String modelo;
  int ano;

  Veiculo(this.fabricante, this.modelo, this.ano);
}
