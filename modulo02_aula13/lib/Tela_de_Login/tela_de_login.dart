import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController campoUsuario = TextEditingController(text: "");
  TextEditingController campoSenha = TextEditingController(text: "");
  Color corBase = const Color(0xFF244C61);
  bool mostrar = true;
  final String usuarioDB = "Marnei";
  final String senhaDB = "12345";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.amber.shade50,
          margin: const EdgeInsets.only(top: 45),
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: corBase,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: campoUsuario,
                autofocus: true,
                keyboardType: TextInputType.text,
                textCapitalization:
                    TextCapitalization.sentences, //Primeira letra maiúscula
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Usuário",
                ),
              ),
              TextField(
                controller: campoSenha,
                obscureText: mostrar,
                autofocus: true,
                keyboardType: TextInputType.text,
                textCapitalization:
                    TextCapitalization.sentences, //Primeira letra maiúscula
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Senha",
                ).copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      mostrar
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: corBase,
                    ),
                    onPressed: () {
                      setState(() {
                        mostrar = !mostrar;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: corBase,
                onPressed: efetuarLogin,
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void efetuarLogin() {
    if (campoUsuario.text.isEmpty) {
      mostrarMensagem("Informe o Usuário");
      return;
    }

    if (campoSenha.text.isEmpty) {
      mostrarMensagem("Informe a Senha");
      return;
    }

    if (campoUsuario.text == usuarioDB && campoSenha.text == senhaDB) {
      mostrarMensagem("${campoUsuario.text} logado(a) no sistema!");
    } else {
      mostrarMensagem("Usuário ou Senha inválidos");
    }
  }

  void mostrarMensagem(String mensagem) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(mensagem),
          );
        });
  }
}
