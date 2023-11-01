import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroCurador extends StatefulWidget {
  @override
  _CadastroCuradorState createState() => _CadastroCuradorState();
}

class _CadastroCuradorState extends State<CadastroCurador> {
  String? curso;
  String? periodo;
  String? disciplina;
  String serverResponse = '';

  // Estrutura de dados com todas as disciplinas
  Map<String, Map<String, List<String>>> disciplinasPorCurso = {
    'Ciência da Computação': {
      '1° Período': [
        'COMP359 - Programação 1',
        'COMP360 - Lógica para Computação',
        'COMP361 - Computação, Sociedade e Ética',
        'COMP362 - Matemática Discreta',
        'COMP363 - Cálculo Diferencial e Integral',
      ],
      '2° Período': [
        'COMP364 - Estrutura de Dados',
        'COMP365 - Banco de Dados',
        'COMP366 - Organização e Arquitetura de Computadores',
        'COMP367 - Geometria Analítica',
        'Eletiva',
      ],
      '3° Período': [
        'COMP368 - Redes de Computadores',
        'COMP369 - Teoria dos Grafos',
        'COMP370 - Probabilidade e Estatística',
        'COMP371 - Álgebra Linear',
        'Eletiva',
      ],
      '4° Período': [
        'COMP372 - Programação 2',
        'COMP373 - Programação 3',
        'COMP374 - Projeto e Análise de Algoritmos',
        'COMP376 - Teoria da Computação',
        'Eletiva',
        'COMP377 - PRÁTICA DE EXTENSÃO EM CIÊNCIA DA COMPUTAÇÃO 1',
      ],
      '5° Período': [
        'COMP378 - Sistemas Operacionais',
        'COMP379 - Compiladores',
        'COMP380 - Inteligência Artificial',
        'COMP381 - Computação Gráfica',
        'Eletiva',
        'COMP383 - PRÁTICA DE EXTENSÃO EM CIÊNCIA DA COMPUTAÇÃO 2',
      ],
      '6° Período': [
        'COMP382 - Projeto e Desenvolvimento de Sistemas',
        'Eletiva',
        'COMP384 - PRÁTICA DE EXTENSÃO EM CIÊNCIA DA COMPUTAÇÃO 3',
      ],
      '7° Período': [
        'COMP386 - Metodologia de Pesquisa e Trabalho Individual',
        'COMP387 - Noções de Direito',
        'Eletiva',
        'Eletiva',
        'Eletiva',
        'Eletiva',
        'COMP388 - PRÁTICA DE EXTENSÃO EM CIÊNCIA DA COMPUTAÇÃO 4',
      ],
    },
    'Engenharia da Computação': {
      '1° Período': [
        'ECOM001 - Inglês Instrumental',
        'ECOM002 - Programação 1',
        'ECOM003 - Matemática Discreta',
        'ECOM004 - Cálculo 1',
        'ECOM005 - Geometria Analítica',
        'ECOM006 - Introdução à Eng. da Computação',
      ],
      '2° Período': [
        'ECOM007 - Lógica Aplicada à Computação',
        'ECOM008 - Estrutura de Dados',
        'ECOM009 - Física 1',
        'ECOM010 - Cálculo 2',
        'ECOM011 - Álgebra Linear',
        'ECOM012 - Circuitos Digitais',
        'ECOM013 - Desenho',
      ],
      '3° Período': [
        'ECOM014 - Linguagens Formais, Autômatos e Computibilidade',
        'ECOM015 - Projeto de Software',
        'ECOM016 - Física 2',
        'ECOM017 - Cálculo 3',
        'ECOM018 - Metodologia da Pesquisa e do Trabalho Científico',
        'ECOM019 - Sistemas Digitais',
        'ECOM057 - Química Tecnológica',
      ],
      '4° Período': [
        'ECOM020 - Probabilidade e Estatística',
        'ECOM021 - Engenharia de Software',
        'ECOM022 - Física 3',
        'ECOM023 - Cálculo 4',
        'ECOM024 - Variáveis Complexas',
        'ECOM025 - Organização e Arquitetura de Computadores',
        'ECOM026 - Física Experimental 3',
      ],
      '5° Período': [
        'ECOM027 - Projeto e Análise de Algoritmos',
        'ECOM028 - Circuitos Elétricos',
        'ECOM029 - Redes de Computadores',
        'ECOM030 - Sinais e Sistemas',
        'ECOM031 - Inteligência Artificial',
        'ECOM032 - Sistemas Operacionais',
        'ECOM033 - Teoria dos Grafos',
      ],
      '6° Período': [
        'ECOM034 - Princípios de Comunicação',
        'ECOM035 - Eletrônica',
        'ECOM036 - Métodos Numéricos',
        'ECOM037 - Sistemas de Controle 1',
        'ECOM048 - Computador Sociedade e Ética',
        'ECOM040 - Empreendedorismo',
        'ECOM118 - Fenômenos de Transporte',
      ],
      '7° Período': [
        'ECOM041 - Bancos de Dados',
        'ECOM046 - Noções de Direito',
        'ECOM058 - Sistemas de Controle 2',
        'ECOM059 - Microcontroladores e Aplicações',
        'ECOM060 - Instrumentação Eletrônica',
        'ECOM063 - Processamento Digital de Sinais',
      ],
      '8° Período': [
        'ECOM039 - Computação Gráfica e Processamento de Imagens',
        'ECOM042 - Sistemas Embarcados',
        'ECOM044 - Sistemas Distribuídos',
        'ECOM061 - Automação Industrial',
        'ECOM062 - Robótica',
        'ECOM119 - Mecânica dos Sólidos',
      ],
    },
  };

  void cadastrarComoCurador() async {
    if (curso != null && periodo != null && disciplina != null) {
      var url = Uri.parse(
          'http://pds-2023-1-03.edge.net.br:9003/'); // Insira o URL do seu endpoint de API aqui

      var response = await http.post(url, body: {
        'curso': curso!,
        'periodo': periodo!,
        'disciplina': disciplina!,
      });

      if (response.statusCode == 200) {
        // A solicitação foi enviada com sucesso
        setState(() {
          serverResponse = 'em ANÁLISE';
        });
      } else {
        // Algo deu errado ao enviar a solicitação
        setState(() {
          serverResponse = 'Erro ao enviar a solicitação.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Seja um Curador',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Escolha o curso:',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: curso,
              onChanged: (String? newValue) {
                setState(() {
                  curso = newValue;
                  periodo =
                      null; // Limpa a seleção de período ao alterar o curso
                  disciplina =
                      null; // Limpa a seleção de disciplina ao alterar o curso
                });
              },
              items: disciplinasPorCurso.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (curso != null) Text('Escolha o período:'),
            if (curso != null)
              DropdownButton<String>(
                value: periodo,
                onChanged: (String? newValue) {
                  setState(() {
                    periodo = newValue;
                    disciplina =
                        null; // Limpa a seleção de disciplina ao alterar o período
                  });
                },
                items: disciplinasPorCurso[curso!]!
                    .keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            SizedBox(height: 20),
            if (periodo != null) Text('Escolha a disciplina:'),
            if (periodo != null)
              DropdownButton<String>(
                value: disciplina,
                onChanged: (String? newValue) {
                  setState(() {
                    disciplina = newValue;
                  });
                },
                items: disciplinasPorCurso[curso!]![periodo!]!
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cadastrarComoCurador();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF78D6CF)), // Define a cor desejada
              ),
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 20),
            if (serverResponse.isNotEmpty)
              Text(serverResponse,
                  style: TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
