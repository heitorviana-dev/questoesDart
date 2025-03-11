import 'dart:io';

const Map<String, Map<String, double>> taxasDeCambio = {
  'BRL': {'USD': 0.20, 'EUR': 0.18},
  'USD': {'BRL': 5.0, 'EUR': 0.90},
  'EUR': {'BRL': 5.50, 'USD': 1.11},
};

void main() {
  while (true) {
    print('\nConversor de Moedas');
    print('1 - Real (BRL)');
    print('2 - Dólar (USD)');
    print('3 - Euro (EUR)');
    print('4 - Sair');

    stdout.write('Escolha a moeda de origem (1-3): ');
    int? origem = int.tryParse(stdin.readLineSync()!);
    if (origem == 4) break;

    stdout.write('Escolha a moeda de destino (1-3): ');
    int? destino = int.tryParse(stdin.readLineSync()!);

    if (origem == null  destino == null  origem < 1  origem > 3  destino < 1  destino > 3  origem == destino) {
      print('Escolha inválida. Tente novamente.');
      continue;
    }

    stdout.write('Digite o valor a ser convertido: ');
    double? valor = double.tryParse(stdin.readLineSync()!);

    if (valor == null || valor <= 0) {
      print('Valor inválido. Tente novamente.');
      continue;
    }

    Map<int, String> opcoes = {1: 'BRL', 2: 'USD', 3: 'EUR'};
    String moedaOrigem = opcoes[origem]!;
    String moedaDestino = opcoes[destino]!;

    double taxa = taxasDeCambio[moedaOrigem]![moedaDestino]!;
    double convertido = valor * taxa;

    print('$valor $moedaOrigem equivalem a ${convertido.toStringAsFixed(2)} $moedaDestino.');
  }

  print('Programa encerrado.');
}