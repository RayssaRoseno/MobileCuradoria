import 'package:flutter/material.dart';

class PaginaLogicaAplicada extends StatelessWidget {
  final List<String> assuntos = [
    "Sintaxe Básica",
    "Estruturas de Controle",
    "Funções",
    "Tipos de Dados",
    "Arrays",
    "Ponteiros",
    "Estruturas e Uniões",
    "Entrada e Saída",
    "Alocação Dinâmica de Memória",
    "Manipulação de Strings",
    "Arquivos",
    "Bibliotecas Padrão",
    "Práticas de Codificação",
    "Depuração",
    "Projetos Práticos",
    "Outros"
  ];

  final List<String> listas = ["AB1", "AB2", "Reavaliação", "Final"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Lógica para Computação',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0 Publicações',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        Text(
                          'Professor:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text('Fabio Paraguacu'),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        Text(
                          'Curadores:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Text('@ray'),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar assunto',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: assuntos.map((item) {
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            // Implement your logic here
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar listas',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: listas.map((item) {
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            // Implement your logic here
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    size: 100,
                  ),
                  Text('Sem conteúdos no momento!'),
                  SizedBox(height: 50),
                  Icon(
                    Icons.link,
                    size: 100,
                  ),
                  Text('Sem conteúdos no momento!'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
