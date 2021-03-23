import 'Aluno.dart';

void main() {
  // Construtor com opções
  var aluno = Aluno(nome: 'Edson Melo', email: 'edson@melo.com');

  // setter para a idade
  aluno.idade = 22;

  // getters
  print(aluno.nome);
  print(aluno.email);
  print(aluno.idade);
}
