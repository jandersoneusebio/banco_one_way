import 'package:banco_one_way/controllers/TransfController.dart';
import 'package:flutter/material.dart';
import 'Main.dart' as main;

import '../constantes.dart';

class TransfScreen extends StatefulWidget {
  final String agencia;
  final String conta;

  TransfScreen({this.agencia, this.conta});

  @override
  _TransfScreenState createState() => _TransfScreenState();
}

class _TransfScreenState extends State<TransfScreen> {

  TextEditingController _agController = new TextEditingController();
  TextEditingController _contaController = new TextEditingController();
  TextEditingController _digitoController = new TextEditingController();
  TextEditingController _valorController = new TextEditingController();

  TransfController transf = new TransfController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferência"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15, top: 10, right: 25, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: _agController,
                          decoration: InputDecoration(
                              labelText: "Agência"
                          ),
                          keyboardType: TextInputType.number,
                        )
                    )
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: _contaController,
                          decoration: InputDecoration(
                              labelText: "Conta"
                          ),
                          keyboardType: TextInputType.number,
                        )
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: _digitoController,
                          decoration: InputDecoration(
                            labelText: "Dígito",
                          ),
                          keyboardType: TextInputType.number,
                        )
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    controller: _valorController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 48
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Valor à transferir",
                      labelStyle: TextStyle(
                        fontSize: 18
                      ),
                      contentPadding: EdgeInsets.only(bottom: 12, top: 32),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    child: Text(
                      "Transferir",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: azul,
                      fixedSize: Size(100,50),
                    ),
                    onPressed: (){

                      String _conta = "${_contaController.text}-${_digitoController.text}";
                      transf.transferir(agAtual, contaAtual, _agController.text, _conta, double.parse(_valorController.text), context);

                      print("Conta principal: ${main.agencia}  ${main.conta}");
                    }
                  ),
                )
              ],
            ),
          ),
        )
        )
    );
  }
}
