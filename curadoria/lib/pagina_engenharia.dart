import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routes: {
        '/materias_engenharia': (context) => PaginaMateriasEngenharia(),
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Esta é a tela inicial',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/materias_engenharia'); // Adicione esta linha
              },
              child: Text('Ir para Matérias de Engenharia'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaMateriasEngenharia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Engenharia da Computação', // Alterei o título para Engenharia da Computação
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          PeriodoTile(
            periodo: '1º Período',
            disciplinas: [
              'Inglês Instrumental',
              'Programação 1',
              'Matemática Discreta',
              'Cálculo 1',
              'Geometria Analítica',
              'Introdução à Eng. da Computação',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
          PeriodoTile(
            periodo: '2º Período',
            disciplinas: [
              'Lógica Aplicada à Computação',
              'Estrutura de Dados',
              'Física 1',
              'Cálculo 2',
              'Álgebra Linear',
              'Circuitos Digitais',
              'Desenho',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
          PeriodoTile(
            periodo: '3º Período',
            disciplinas: [
              'Linguagens Formais, Autômatos e Computibilidade',
              'Projeto de Software',
              'Física 2',
              'Cálculo 3',
              'Metodologia da Pesquisa e do Trabalho Científico',
              'Sistemas Digitais',
              'Química Tecnológica',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
          PeriodoTile(
            periodo: '4º Período',
            disciplinas: [
              'Probabilidade e Estatística',
              'Engenharia de Software',
              'Física 3',
              'Cálculo 4',
              'Variáveis Complexas',
              'Organização e Arquitetura de Computadores',
              'Física Experimental 3',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
          PeriodoTile(
            periodo: '5º Período',
            disciplinas: [
              'Projeto e Análise de Algoritmos',
              'Circuitos Elétricos',
              'Redes de Computadores',
              'Sinais e Sistemas',
              'Inteligência Artificial',
              'Sistemas Operacionais',
              'Teoria dos Grafos',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
          PeriodoTile(
            periodo: '6º Período',
            disciplinas: [
              'Princípios de Comunicação',
              'Eletrônica',
              'Métodos Numéricos',
              'Sistemas de Controle 1',
              'Computador Sociedade e Ética',
              'Empreendedorismo',
              'Fenômenos de Transporte',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
          PeriodoTile(
            periodo: '7º Período',
            disciplinas: [
              'Bancos de Dados',
              'Noções de Direito',
              'Sistemas de Controle 2',
              'Microcontroladores e Aplicações',
              'Instrumentação Eletrônica',
              'Processamento Digital de Sinais',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
          PeriodoTile(
            periodo: '8º Período',
            disciplinas: [
              'Computação Gráfica e Processamento de Imagens',
              'Sistemas Embarcados',
              'Sistemas Distribuídos',
              'Automação Industrial',
              'Robótica',
              'Mecânica dos Sólidos',
            ],
            corInicio: Colors.green[300]!,
            corFim: Colors.green[900]!,
          ),
        ],
      ),
    );
  }
}

class PeriodoTile extends StatelessWidget {
  final String periodo;
  final List<String> disciplinas;
  final Color corInicio;
  final Color corFim;

  PeriodoTile(
      {required this.periodo,
      required this.disciplinas,
      required this.corInicio,
      required this.corFim});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [corInicio, corFim],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ExpansionTile(
          title: Text(
            periodo,
            style: TextStyle(color: Colors.white),
          ),
          children: disciplinas.map((disciplina) {
            return ListTile(
              title: Text(
                disciplina,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
