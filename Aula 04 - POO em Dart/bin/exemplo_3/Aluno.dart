class Aluno {
  String _nome;
  String _email;
  int _idade;

  // Construtor
  Aluno({String nome, String email, int idade}) {
    _nome = nome;
    _email = email;
    _idade = idade;
  }

  String get nome => _nome;
  set nome(String value) => _nome = value;

  get email => _email;
  set email(value) => _email = value;

  get idade => _idade;
  set idade(value) => _idade = value;
}
