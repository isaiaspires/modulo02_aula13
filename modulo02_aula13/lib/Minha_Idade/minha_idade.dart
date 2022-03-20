import 'dart:ui';

import 'package:flutter/material.dart';

class MinhaIdade extends StatefulWidget {
  const MinhaIdade({Key? key}) : super(key: key);

  @override
  State<MinhaIdade> createState() => _MinhaIdadeState();
}

class _MinhaIdadeState extends State<MinhaIdade> {
  Color corBase = const Color(0xFF95103C);
  TextEditingController campoData =
      TextEditingController(text: "Busque sua data de nascimento");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: corBase,
          title: const Text(
            "Minha Idade",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                campoData.text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: corBase,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: corBase,
                child: const Text(
                  "Calendário",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  final agora = DateTime.now();
                  showDatePicker(
                    context: context,
                    initialDate: agora,
                    firstDate: DateTime(1900),
                    lastDate: agora,
                    //Muda a cor do calendário
                    builder: (context, filhinho) => Theme(
                      child: Center(child: filhinho), //required: child e data
                      data: ThemeData().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: corBase,
                        ),
                      ),
                    ),
                  ).then((value) {
                    //Atualiza as informações na tela
                    setState(() {
                      //Envia a data selecionada (value) para calcular a idade
                      campoData.text = calcularIdade(value);
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String calcularIdade(dataInformada) {
    if (dataInformada != null) {
      DateTime dataAtual = DateTime.now();

      if (dataAtual.year > dataInformada.year) {
        if (dataAtual.month >= dataInformada.month) {
          if (dataAtual.day >= dataInformada.day) {
            return "${dataAtual.year - dataInformada.Year} anos de vida";
          } else {
            return "${dataAtual.year - dataInformada.year - 1} anos de vida";
          }
        } else {
          return "${dataAtual.year - dataInformada.year - 1} anos de vida";
        }
      }
    }
    return "Data inválida";
  }
}
