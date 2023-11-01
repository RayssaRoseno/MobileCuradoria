import 'package:flutter/material.dart';
import 'package:curadoria/logica_aplicada_computacao.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(),
      theme: ThemeData(
        fontFamily: 'Poppins', // Define 'Poppins' como a fonte padrão
      ),
      routes: {
        '/materias': (context) => PaginaMaterias(),
        '/logica_aplicada': (context) => PaginaLogicaAplicada(),
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Esta é a tela inicial',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/materias');
              },
              child: const Text('Ir para Matérias'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaMaterias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Ciência da Computação',
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
              'PROGRAMAÇÃO 1',
              'LÓGICA PARA COMPUTAÇÃO',
              'COMPUTAÇÃO, SOCIEDADE E ÉTICA',
              'MATEMÁTICA DISCRETA',
              'CÁLCULO DIFERENCIAL E INTEGRAL',
            ],
            corInicio: Colors.blue[300]!, // Cor de início do degradê
            corFim: Colors.blue[900]!, // Cor de fim do degradê
          ),
          PeriodoTile(
            periodo: '2º Período',
            disciplinas: [
              'ESTRUTURA DE DADOS',
              'BANCO DE DADOS',
              'ORGANIZAÇÃO E ARQUITETURA DE COMPUTADORES',
              'GEOMETRIA ANALÍTICA',
            ],
            corInicio: Colors.blue[300]!,
            corFim: Colors.blue[900]!,
          ),
          PeriodoTile(
            periodo: '3º Período',
            disciplinas: [
              'REDES DE COMPUTADORES',
              'TEORIA DOS GRAFOS',
              'PROBABILIDADE E ESTATÍSTICA',
              'ÁLGEBRA LINEAR',
            ],
            corInicio: Colors.blue[300]!,
            corFim: Colors.blue[900]!,
          ),
          PeriodoTile(
            periodo: '4º Período',
            disciplinas: [
              'PROGRAMAÇÃO 2',
              'PROGRAMAÇÃO 3',
              'PROJETO E ANÁLISE DE ALGORITMOS',
              'TEORIA DA COMPUTAÇÃO',
            ],
            corInicio: Colors.blue[300]!,
            corFim: Colors.blue[900]!,
          ),
          PeriodoTile(
            periodo: '5º Período',
            disciplinas: [
              'SISTEMAS OPERACIONAIS',
              'COMPILADORES',
              'INTELIGÊNCIA ARTIFICIAL',
              'COMPUTAÇÃO GRÁFICA',
              'ACE 2: CONTINUIDADE DO PROJETO I - (Atividade de extensão)',
            ],
            corInicio: Colors.blue[300]!,
            corFim: Colors.blue[900]!,
          ),
          PeriodoTile(
            periodo: '6º Período',
            disciplinas: [
              'PROJETO E DESENVOLVIMENTO DE SISTEMAS',
              'ACE 3: PROJETO 2 - (Atividade de extensão)',
            ],
            corInicio: Colors.blue[300]!,
            corFim: Colors.blue[900]!,
          ),
          PeriodoTile(
            periodo: '7º Período',
            disciplinas: [
              'METODOLOGIA DE PESQUISA E TRABALHO INDIVIDUAL',
              'NOÇÕES DE DIREITO',
              'ACE 4: CONTINUAÇÃO DO PROJETO 2 - (Atividade de extensão)',
            ],
            corInicio: Colors.blue[300]!,
            corFim: Colors.blue[900]!,
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

  PeriodoTile({
    required this.periodo,
    required this.disciplinas,
    required this.corInicio,
    required this.corFim,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (disciplinas.contains('LÓGICA PARA COMPUTAÇÃO')) {
          Navigator.pushNamed(context, '/logica_aplicada');
        }
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
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
              style: const TextStyle(color: Colors.white),
            ),
            children: disciplinas.map((disciplina) {
              return ListTile(
                title: GestureDetector(
                  onTap: () {
                    if (disciplina == 'LÓGICA PARA COMPUTAÇÃO') {
                      Navigator.pushNamed(context, '/logica_aplicada');
                    }
                  },
                  child: Text(
                    disciplina,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
