/* 3 - Implemente um gerador de senhas que solicite ao usuário o tamanho desejado.
O programa deve criar uma senha aleatória que inclua letras, números e, se o
usuário preferir, caracteres especiais. Teste diferentes combinações para
garantir a diversidade e a segurança da senha gerada. */

// Vamos criar uma função que selecione um índice aleatório de uma string contendo todos os caracteres.

import 'dart:math';
import 'dart:io';

void main(){

  String gerarSenha(int tamanho) {
    const String charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+';

    Random random = Random();
    String senha = '';

    for(int i = 0; i < tamanho; i++){
      int indiceAleatorio = random.nextInt(charset.length);
      senha += charset[indiceAleatorio];
    }

    return senha;
  }
  
  stdout.write('Digite o tamanho da senha: ');
  String? tamanho = stdin.readLineSync();
  if(tamanho != null){
    var password = gerarSenha(int.parse(tamanho));
    print(password);
  } else{
    print('Não foi possível criar a senha. ');
  }
}


