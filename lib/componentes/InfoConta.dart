import 'package:banco_one_way/telas/configuracoes/GerenciarContas.dart';
import 'package:flutter/material.dart';
import 'package:banco_one_way/constantes.dart';
import 'package:banco_one_way/controllers/SaldoController.dart';


class InfoConta extends StatefulWidget {

  final String agencia;
  final String conta;

  InfoConta({this.agencia, this.conta});

  @override
  _InfoContaState createState() => _InfoContaState();
}

class _InfoContaState extends State<InfoConta> {
  SaldoController saldo = new SaldoController();
  String valor = "##,##";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: azul,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Conta \n${widget.agencia} ${widget.conta}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        saldo.atualizarSaldo();
                        setState(() {

                        });
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.refresh_rounded, color: Colors.white),
                    ),
                  ),
                  FutureBuilder(
                    future: saldo.atualizarSaldo(),
                    builder: (context, snapshot){
                      switch(snapshot.connectionState){
                        case ConnectionState.none:
                          valor = "?";
                          break;
                        case ConnectionState.waiting:
                          valor = "Carregando";
                          break;
                        case ConnectionState.active:
                          break;
                        case ConnectionState.done:
                          if(snapshot.hasError){
                            valor = "Erro!";
                            print("Ocorreu um erro ao carregar o saldo, verifique a URL e tente novamente");
                          }else{
                            valor = snapshot.data.toString();
                          }
                          break;
                      }
                      return Text(
                        "Saldo \nR\$ ${valor}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
  /*
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: azul,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Conta \n${main.agencia} ${main.conta}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        saldo.atualizarSaldo();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.refresh_rounded, color: Colors.white),
                    ),
                  ),
                  FutureBuilder(
                    future: saldo.atualizarSaldo(),
                    builder: (context, snapshot){
                      switch(snapshot.connectionState){
                        case ConnectionState.none:
                          main.saldo = "?";
                          break;
                        case ConnectionState.waiting:
                          main.saldo = "Carregando";
                          break;
                        case ConnectionState.active:
                          break;
                        case ConnectionState.done:
                          if(snapshot.hasError){
                            main.saldo = "Erro!";
                            print("Ocorreu um erro ao carregar o saldo, verifique a URL e tente novamente");
                          }else{
                            main.saldo = snapshot.data.toString();
                          }
                          break;
                      }
                      return Text(
                        "Saldo \nR\$ ${main.saldo}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
   */
}
