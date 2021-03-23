import 'dart:math';

class Operacoes {
  dynamic somar(var valor1, var valor2) {
    return valor1 + valor2;
  }

  dynamic multiplicar(var valor1, var valor2) {
    return valor1 * valor2;
  }

  dynamic potencia(var base, int expoente) {
    // por isso usamos a importação do dart:math
    return pow(base, expoente);
  }

  /// Somente números inteiros podem ser classificados como par ou ímpar
  ///
  /// parâmetro: valor inteiro -> Ex. isPar(43)
  ///
  /// retorno: boolean (true or false)
  bool isPar(int valor) {
    return (valor % 2) == 0;
  }
}
