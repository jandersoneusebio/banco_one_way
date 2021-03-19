import 'package:banco_one_way/telas/celular/MainCelular.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:banco_one_way/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:banco_one_way/model/Contas.dart';

class GerenciarContas extends StatefulWidget {
  @override
  _GerenciarContasState createState() => _GerenciarContasState();
}

class _GerenciarContasState extends State<GerenciarContas> {

  Future<List<Conta>> _listarContas() async{
    http.Response response = await http.get(url + "conta/");
    var dados = json.decode(response.body);

    List<Conta> contas = List();

    for (var resp in dados){
      Conta p = Conta(resp["agencia"], resp["numero"]);
      contas.add(p);
    }

    return contas;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gerenciar Contas"),
          centerTitle: true,
        ),

        body: Container(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Conta>>(
                  future: _listarContas(),
                  // ignore: missing_return
                  builder: (context, snapshot){

                    switch(snapshot.connectionState){
                      case (ConnectionState.none):
                      case (ConnectionState.active):
                      case (ConnectionState.waiting):
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case (ConnectionState.done):
                        if(snapshot.hasError){
                          print("erro ao carregar lista");
                        } else{
                          print("lista carregada");
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index){
                              List<Conta> lista = snapshot.data;
                              Conta c = lista[index];

                              return ListTile(
                                title: Text(c.agencia),
                                subtitle: Text(c.conta),
                                onTap: (){
                                  agAtual = c.agencia;
                                  contaAtual = c.conta;
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        }
                    }
                  },
                ),
              )
            ],
          ),
        )

    );
  }
}
