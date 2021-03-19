import 'package:banco_one_way/componentes/SquareButton.dart';
import 'package:banco_one_way/telas/configuracoes/Config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:banco_one_way/constantes.dart' as constantes;

import '../constantes.dart';
import 'celular/MainCelular.dart';
import 'celular/MainDesktop.dart';
import 'configuracoes/GerenciarContas.dart';

String agencia = constantes.agAtual;
String conta = constantes.contaAtual;
String saldo = "##,##";

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banco One Way"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Config())).then((value) => setState((){})
              );
            },
            child: Icon(Icons.settings_outlined, color: Colors.white,),
          )
        ],
      ),
      body: MediaQuery.of(context).size.width > 700 ? MainDesktop() : MainCelular()
    );
  }
}
