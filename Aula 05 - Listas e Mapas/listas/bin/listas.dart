// Uma lista é uma estrutura de dados que
// armazena dados na memória de forma
// sequencial, ou seja, um valor depois
// do outro.
// Também podemos associar uma lista a um
// vetor (estrutura de dados básica)
void main(List<String> arguments) {
  // var compras = <String>[
  //   'Cenoura', // 0
  //   'Banana', // 1
  //   'Brócolis', // 2
  //   'Refrigerante', // 3
  //   'Farinha de Rosca' //4
  // ];

  // manipulando a lista
  // imprimir (mostrar) um item pelo índice
  // print(compras[0]);
  // print(compras[3]);

  // imprimir a lista toda
  // print(compras);

  // adicionando itens na lista
  // compras.add('Suco de Caixinha');
  // print(compras);

  // qual o tamanho da minha lista
  // print('Tam. da lista: ${compras.length}');

  // pesquisando na lista
  // print(compras.contains('Farinha'));

  // fatiando uma sequência de caracteres por
  // espaço - split(pattern)
  // print('Edson Melo de Souza'.split(' '));

  // Treinando
  // 1 - Adicionar na lista de compras
  //  a - Arroz
  //  b - Abacaxi
  //  c - Cebola
  //  d - Doritos
  // 2 - Mostrar o tamanho da lista e verificar
  // Saída: Tem Mostarda ou Não tem Mostarda

  // print('Antes de adicionar: ${compras.length}');
  // compras.add('Arroz');
  // compras.add('Abacaxi');
  // compras.add('Cebola');
  // compras.add('Doritos');
  // print(compras);
  // print('Depois de adicionar: ${compras.length}');

  // if (compras.contains('Mostarda')) {
  //   print('Tem Mostarda');
  // } else {
  //   print('Não Mostarda');
  // }

  // ordenação de listas: crescente ou decrescente
  // var ordenada = compras..sort();
  // print(ordenada);

  // ordem decrescente
  // var decrescente = ordenada.reversed;
  // print(decrescente);

  // iterar na lista ordenada (foreach)
  // for (var produto in ordenada) {
  //   print(produto);
  // }

  // for (var produto in decrescente) {
  //   print(produto);
  // }

  // Treinando
  // Percorrer a lista ordenada usando:
  // - for e while
  // Tempo: 7 minutos (20:37)
  // for (var i = 0; i < ordenada.length; i++) {
  //   print('item ${i + 1} ${compras[i]}');
  // }

  // var x = 0;
  // while (x < compras.length) {
  //   print(compras[x]);
  //   x++;
  // }

  // criar uma lista com objetos
  var alunos = List.filled(0, Aluno(), growable: true);
  print(alunos.length);
  alunos.add(Aluno(ra: 123, nome: 'Edson'));
  alunos.add(Aluno(ra: 321, nome: 'Tio Patinhas'));
  alunos.add(Aluno(ra: 987, nome: 'Zé Carioca'));
  print(alunos.length);
  // showAll(alunos);

  // remover objetos da lista
  alunos.removeWhere((Aluno a) => a.nome == 'Edson');
  showAll(alunos);

  // atualizando os dados de um objeto
  alunos[alunos.indexWhere((Aluno a) => a.nome == 'Tio Patinhas')].nome =
      'Tio da Coxinha';
  showAll(alunos);
}

void showAll(var alunos) {
  for (var aluno in alunos) {
    print('${aluno.ra}, ${aluno.nome}');
  }
}

class Aluno {
  int ra;
  String nome;

  // construtor
  Aluno({this.ra, this.nome});
}
