/*
Nome: Alan Jhon
Data: 04-04-2024
Descrição da atividade: Programa em Dart que calcula a média das notas de uma lista de alunos
*/

import 'dart:io';

// Constante com o nome do autor
const String nomeAutor = 'Alan Jhon';

// Classe que representa um aluno
class Aluno {
  String nome;
  double nota;

  // Construtor
  Aluno(this.nome, this.nota);
}

// Função para ler os dados dos alunos
Aluno? lerAluno() {
  stdout.write('Digite o nome do aluno (ou "sair" para encerrar):\n');
  String? nome = stdin.readLineSync(); // Lê o nome do aluno
  if (nome!.toLowerCase() == 'sair')
    return null; // Se o usuário digitar "sair", retorna null

  stdout.write('Digite a nota do aluno:\n');
  double nota = double.parse(stdin.readLineSync()!); // Lê a nota do aluno
  return Aluno(nome, nota); // Retorna um objeto Aluno com o nome e a nota
}

// Função para calcular a média das notas
double calcularMedia(List<Aluno> alunos) {
  double somaNotas = alunos
      .map((aluno) => aluno.nota)
      .reduce((a, b) => a + b); // Soma todas as notas
  return somaNotas / alunos.length; // Calcula a média
}

// Função para imprimir os alunos aprovados
void imprimirAprovados(List<Aluno> alunos, double media) {
  print('\nMédia das notas: $media');
  print('Alunos aprovados:');
  alunos
      .where((aluno) => aluno.nota >= media)
      .forEach((aluno) => print('${aluno.nome} - ${aluno.nota}'));
}

void main() {
  List<Aluno> listaAlunos = []; // Lista para armazenar os alunos

  // Loop para ler os dados dos alunos
  while (true) {
    Aluno? novoAluno = lerAluno(); // Chama a função para ler os dados do aluno
    if (novoAluno == null) break; // Se for digitado "sair", encerra o loop
    listaAlunos.add(novoAluno); // Adiciona o aluno à lista
  }

  if (listaAlunos.isEmpty) {
    print(
        'Nenhum aluno inserido.'); // Se a lista estiver vazia, informa que nenhum aluno foi inserido
    return;
  }

  double media = calcularMedia(listaAlunos); // Calcula a média das notas
  imprimirAprovados(listaAlunos, media); // Imprime os alunos aprovados

  // Imprime o nome do autor
  print('Desenvolvido por: $nomeAutor');
}
