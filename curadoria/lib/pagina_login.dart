import 'dart:convert';
import 'package:curadoria/main_logado_pelo_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAuthDto {
  String email;
  String password;
  String? firstName;
  String? curso;

  LoginAuthDto({
    required this.email,
    required this.password,
    this.firstName,
    this.curso,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      if (firstName != null) 'firstName': firstName,
      if (curso != null) 'curso': curso,
    };
  }
}

class PaginaLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    var dto = LoginAuthDto(
      email: emailController.text,
      password: passwordController.text,
    );

    final response = await http.post(
      Uri.parse('http://pds-2023-1-03.edge.net.br:9003/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 200) {
      // lógica para lidar com a resposta do servidor
      // por exemplo, navegar para a próxima página
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainLogadoPeloLogin(
            nomeUsuario: dto.firstName ?? 'Estudante',
          ),
        ),
      );
    } else {
      // lidar com o caso de falha de login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Entrar',
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
          child: Column(
            children: [
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
              CampoEntrada("E-mail", TextInputType.emailAddress,
                  controller: emailController),
              CampoEntrada("Senha", TextInputType.text,
                  isPassword: true, controller: passwordController),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  login(context);
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
                  'Entrar',
                  style: TextStyle(
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

class CampoEntrada extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;

  CampoEntrada(this.labelText, this.keyboardType,
      {this.isPassword = false, required this.controller});

  @override
  Widget build(BuildContext context) {
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
