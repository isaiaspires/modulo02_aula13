import 'package:flutter/material.dart';

class Idade extends StatefulWidget {
  const Idade({Key? key}) : super(key: key);

  @override
  State<Idade> createState() => _IdadeState();
}

class _IdadeState extends State<Idade> {
  //Declaração dos Atributos
  TextEditingController campoIdade = TextEditingController(text: "");
  num idade = 0;
  Color corBase = const Color(0xFF2974BB);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: corBase,
          title: const Text(
            "Podes Votar",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              //Campo de Texto (Input Idade)
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Informe sua idade"),
                controller: campoIdade,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              MaterialButton(
                color: corBase,
                onPressed: verificarIdade,
                child: const Text(
                  "Verificar Idade",
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

  void verificarIdade() {
    if (campoIdade.text == "") {
      setState(() {
        idade = 0;
        mostrarMensagem("Informe sua idade");
      });
      return;
    }

    //Converte o campo de texto em valo numérico
    idade = int.parse(campoIdade.text);

    //Verifica a faixa etária
    if (idade < 16) {
      mostrarMensagem("Não podes votar");
    } else if (idade >= 18 && idade <= 65) {
      mostrarMensagem("Voto obrigatório");
    } else {
      mostrarMensagem("Voto facultativo");
    }
  }

  void mostrarMensagem(String mensagem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
