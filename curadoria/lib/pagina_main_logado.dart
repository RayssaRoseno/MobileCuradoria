import 'dart:convert';
import 'package:curadoria/CadastroCurador.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pagina_login.dart';
import 'pagina_registro.dart';
import 'pagina_materias.dart';
import 'pagina_engenharia.dart';
import 'package:curadoria/logica_aplicada_computacao.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaInicial(),
        '/registro': (context) => PaginaRegistro(),
        '/login': (context) => PaginaLogin(),
        '/materias': (context) => PaginaMaterias(),
        '/materias_engenharia': (context) => PaginaMateriasEngenharia(),
        '/cadastro_curador': (context) =>
            CadastroCurador(), // Adicione esta rota
        '/logica_aplicada': (context) =>
            PaginaLogicaAplicada(), // Adicione esta rota para a lógica aplicada
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0.0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF78D6CF),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: const Center(
                  child: Text(
                    'Registrar-se',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF2E2E2E),
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/cadastro_curador');
                },
                tileColor: const Color(0xFF161F23),
                title: const Text(
                  'Seja um Curador',
                  style: TextStyle(
                    color: Color(0xFF9CE7C8),
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaInicialContent extends StatelessWidget {
  const TelaInicialContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/materias');
            },
            child: Container(
              width: 384.265,
              height: 320,
              decoration: BoxDecoration(
                color: const Color(0xFF161F23),
                borderRadius: BorderRadius.circular(29.24),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Ciência da Computação',
                style: TextStyle(
                  color: Color(0xFF9CE7C8),
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/materias_engenharia');
            },
            child: Container(
              width: 384.265,
              height: 320,
              decoration: BoxDecoration(
                color: const Color(0xFF161F23),
                borderRadius: BorderRadius.circular(29.24),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Engenharia da Computação',
                style: TextStyle(
                  color: Color(0xFF9CE7C8),
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainLogado extends StatelessWidget {
  final String nomeUsuario;

  MainLogado({required this.nomeUsuario, required accessToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0.0,
        title: Row(
          children: [
            Text(
              'Bem-Vindo(a) $nomeUsuario',
              style: TextStyle(
                color: const Color(0xFF9CE7C8),
                fontFamily: 'Poppins',
                fontSize: 24.0,
              ),
            ),
            const SizedBox(width: 8.0),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaInicial(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF78D6CF),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: const Center(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TelaInicialContent(),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF2E2E2E),
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              ListTile(
                onTap: () {
                  // Adicione a lógica para a página do curador
                },
                tileColor: const Color(0xFF161F23),
                title: const Text(
                  'Seja um Curador',
                  style: TextStyle(
                    color: Color(0xFF9CE7C8),
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
