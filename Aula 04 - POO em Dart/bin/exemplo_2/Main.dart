import 'Operacoes.dart';

void main() {
  var op = Operacoes();
  var valor1 = 2;
  var valor2 = 3;

  print(op.somar(valor1, valor2));
  print(op.multiplicar(valor1, valor2));
  print(op.potencia(valor1, valor2));
  print(op.isPar(valor2));
}
