import 'Aluno.dart'; // importação da classe aluno

void main() {
  Aluno aluno1 = new Aluno();
  Aluno aluno2 = new Aluno();

  aluno1.nome = 'Edson Melo';
  aluno1.email = 'Edson@melo.com';
  aluno1.idade = 50;

  print('O aluno ${aluno1.nome} tem ${aluno1.idade} anos.');
  aluno1.fazAniversario();
  print('O aluno ${aluno1.nome} agora tem ${aluno1.idade} anos.');

  // para um segundo objeto
  aluno2.nome = 'Tio Patinhas';
  aluno2.email = 'tio@melo.com';
  aluno2.idade = 25;

  print('O aluno ${aluno2.nome} tem ${aluno2.idade} anos.');
  aluno1.fazAniversario();
  print('O aluno ${aluno2.nome} agora tem ${aluno2.idade} anos.');
}

// Na pasta exemplo_2, criar uma classe com as seguintes operações
// Adição, Multiplicação, Potência e verifiar se um número é Par ou Ímpar
// Operacoes.dart (import 'dart:math')
// Main.dart
// Tempo 10 minutos (até 20:25)