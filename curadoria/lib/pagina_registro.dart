// Importações necessárias
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pagina_main_logado.dart'; // Import da página principal logada

// Classe da Página de Registro
class PaginaRegistro extends StatefulWidget {
  @override
  _PaginaRegistroState createState() => _PaginaRegistroState();
}

// Estado da Página de Registro
class _PaginaRegistroState extends State<PaginaRegistro> {
  // Controladores e variáveis necessários
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cursoController = TextEditingController();
  String registroMensagem = ''; // Variável para armazenar mensagens de registro
  final _formKey =
      GlobalKey<FormState>(); // Chave global para identificar o formulário

  // Função para registrar o usuário
  Future<void> registrar(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Faz uma requisição de POST para a API de registro
      final response = await http.post(
        Uri.parse('http://pds-2023-1-03.edge.net.br:9003/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // Envia os dados do usuário em formato JSON
        body: jsonEncode({
          'email': emailController.text,
          'firstName': firstNameController.text,
          'password': passwordController.text,
          'curso': cursoController.text,
        }),
      );

      // Verifica se a resposta da API foi bem-sucedida
      if (response.statusCode == 201) {
        final parsed = jsonDecode(response.body);
        final accessToken =
            parsed['access-token']; // Recupere o token retornado pelo servidor
        print('Token de acesso: $accessToken'); // Use o token como desejado
        setState(() {
          registroMensagem =
              'Registro bem-sucedido!'; // Define a mensagem de registro como bem-sucedida
        });
        // Navega para a página principal logada e passa o nome de usuário e o token de acesso
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainLogado(
              nomeUsuario: firstNameController.text,
              accessToken: accessToken, // Passe o token para a próxima tela
            ),
          ),
        );
      } else {
        // Se houver um erro, define a mensagem de registro com base na resposta da API
        setState(() {
          registroMensagem = 'Erro de registro: ${response.body}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retorno da interface da Página de Registro
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Registre-se',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 24.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey, // Atribui a chave global ao formulário
            child: Column(
              children: [
                // Avatar e campos de entrada
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 80.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                // Campos de entrada personalizados
                CampoEntrada(
                  "E-mail",
                  TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite um e-mail válido.';
                    }
                    return null;
                  },
                ),
                CampoEntrada(
                  "Nome de Usuário",
                  TextInputType.text,
                  controller: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite um nome de usuário válido.';
                    }
                    return null;
                  },
                ),
                CampoEntrada(
                  "Senha",
                  TextInputType.text,
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite uma senha válida.';
                    }
                    return null;
                  },
                ),
                CampoEntrada(
                  "Curso",
                  TextInputType.text,
                  controller: cursoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite um curso válido.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                // Botão de registro
                ElevatedButton(
                  onPressed: () {
                    registrar(
                        context); // Chama a função de registro ao pressionar o botão
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Registrar',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                // Mensagem de registro
                Text(
                  registroMensagem,
                  style: TextStyle(
                    color: registroMensagem.startsWith('Registro bem-sucedido')
                        ? Colors.green
                        : Colors.red,
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Campo de entrada personalizado
class CampoEntrada extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  CampoEntrada(this.labelText, this.keyboardType,
      {this.isPassword = false, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    // Retorno do campo de entrada personalizado
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.0,
        ),
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
