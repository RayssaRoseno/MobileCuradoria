import 'package:curadoria/CadastroCurador.dart';
import 'package:curadoria/pagina_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definição das rotas aqui
      routes: {
        '/': (context) => PaginaLogin(),
        '/cadastro_curador': (context) => CadastroCurador(),
      },
      // ... outras configurações
    );
  }
}

class MainLogadoPeloLogin extends StatelessWidget {
  final String nomeUsuario;

  MainLogadoPeloLogin({required this.nomeUsuario});

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
                Navigator.pushReplacementNamed(context, '/');
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
                  Navigator.pushNamed(
                      context, '/cadastro_curador'); // Adicione esta linha
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
