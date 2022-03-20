import 'dart:ui';

import 'package:flutter/material.dart';

class CalcSimples extends StatefulWidget {
  const CalcSimples({Key? key}) : super(key: key);

  @override
  State<CalcSimples> createState() => _CalcSimplesState();
}

class _CalcSimplesState extends State<CalcSimples> {
  //Declaração dos atributos (variaveis)
  TextEditingController campoValor1 = TextEditingController(text: "");
  TextEditingController campoValor2 = TextEditingController(text: "");
  num valor1 = 0, valor2 = 0, resultado = 0;
  Color corBase = Colors.grey.shade700;

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
            "Calculadora Simples",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                "Resultado: $resultado",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: corBase,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Input valor 1
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Informe o primeiro valor"),
                controller: campoValor1,
              ),
              //Input valor 2
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Informe o segundo valor"),
                controller: campoValor2,
              ),
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Botão Somar
                  MaterialButton(
                    color: corBase,
                    onPressed: somar,
                    child: const Text(
                      "Somar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //Botão Limpar
                  MaterialButton(
                    color: corBase,
                    onPressed: limparCampos,
                    child: const Text(
                      "Limpar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void somar() {
    if (campoValor1.text == "") {
      setState(() {
        valor1 = 0;
      });
      return;
    }
    if (campoValor2.text == "") {
      setState(() {
        valor2 == 0;
      });
      return;
    }

    setState(() {
      //Converte os campos de texto em valores numéricos
      valor1 = num.parse(campoValor1.text);
      valor2 = num.parse(campoValor2.text);

      //Efetua o cálculo e guarda o resultado
      resultado = valor1 + valor2;
    });
  }

  //Reseta os valores e limpa os campos
  void limparCampos() {
    setState(() {
      valor1 = 0;
      valor2 = 0;
      resultado = 0;
      campoValor1.text = "";
      campoValor2.text = "";
    });
  }
}
