import 'package:banco_one_way/model/Contas.dart';
import 'package:banco_one_way/model/Extrato.dart';
import 'package:flutter/material.dart';
import 'package:banco_one_way/controllers/ExtratoController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:banco_one_way/constantes.dart';

class ExtratoScreen extends StatefulWidget {
  @override
  _ExtratoScreenState createState() => _ExtratoScreenState();
}

class _ExtratoScreenState extends State<ExtratoScreen> {

  ExtratoController extrato = ExtratoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extratos"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Extrato>>(
                future: extrato.visualizarExtrato(),
                // ignore: missing_return
                builder: (context, snapshot){

                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      if(snapshot.hasError){
                        print("erro ao carregar os dados");
                        print(snapshot.error.toString());
                        print(snapshot.data.toString());
                      }else{
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index){
                            List<Extrato> extrato = snapshot.data;
                            Extrato e = extrato[index];
                            String _op;
                            IconData _icone;
                            Color _cor;

                            switch(e.operacao){
                              case "deposito":
                                _op = "Depósito";
                                _icone = Icons.arrow_circle_down_rounded;
                                _cor = Colors.green;
                                break;
                              case "saque":
                                _op = "Saque";
                                _icone = Icons.arrow_circle_up_rounded;
                                _cor = Colors.blue;
                                break;
                              case "transferencia":
                                _op = "Transferência";
                                _icone = Icons.compare_arrows_rounded;
                                _cor = Colors.amber;
                                break;
                            }


                            return ListTile(
                              leading: Icon(_icone, size: 40, color: _cor,),
                              title: Text(_op),
                              subtitle: Text(e.data),
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      title: Text("Extrato #"),
                                      content: SingleChildScrollView(
                                        child: Text(
                                          "Nome do cliente: ${e.nome}\n"
                                          "CPF: ${e.cpf}\n"
                                          "Agência: ${e.agencia}\n"
                                          "Conta: ${e.conta}\n"
                                          "Operação feita: $_op\n"
                                          "Data do serviço: ${e.data}\n"
                                          "Valor movimentado: R\$ ${e.valor}\n"
                                          "Saldo após a operação: R\$ ${e.saldo}"
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text("Ok"),
                                        )
                                      ],
                                    );
                                  }
                                );
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
