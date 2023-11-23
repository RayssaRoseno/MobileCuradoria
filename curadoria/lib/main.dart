import 'package:curadoria/CadastroCurador.dart';
import 'package:curadoria/logica_aplicada_computacao.dart';
import 'package:flutter/material.dart';
import 'pagina_login.dart';
import 'pagina_registro.dart';
import 'pagina_materias.dart';
import 'pagina_engenharia.dart';

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
            CadastroCurador(), 
        '/logica_aplicada': (context) =>
            PaginaLogicaAplicada(), 
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing:
            0.0, // Remove o espaçamento padrão entre o título e a esquerda
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
      body: Center(
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
