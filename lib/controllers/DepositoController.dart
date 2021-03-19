import 'package:flutter/material.dart';
import 'package:banco_one_way/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:banco_one_way/telas/Main.dart' as main;
import 'package:banco_one_way/componentes/Resultado.dart';
import 'package:banco_one_way/constantes.dart';
import 'dart:convert';

class DepositoController{

  depositar(double valor, BuildContext context) async{
    var corpo = json.encode({
      "agencia" : "${agAtual}",
      "numeroConta" : "${contaAtual}",
      "valor" : valor
    });

    http.Response response = await http.post(
      url + "conta/deposito",
      headers: {
        "Content-type" : "application/json"
      },
      body: corpo
    );

    print(response.statusCode.toString());

    if(response.statusCode == 200){
      showDialog(
          context: context,
          builder: (context){
            return Resultado(
              msg: "Depósito realizado com sucesso",
            );
          }
      );
    }else if(response.statusCode == 400){
      showDialog(
          context: context,
          builder: (context){
            return Resultado(
                msg: "Erro: Conta não encontrada"
            );
          }
      );
    } else if(response.statusCode == 500){
      showDialog(
          context: context,
          builder: (context){
            return Resultado(
              msg: "Erro interno, tente novamente mais tarde",
            );
          }
      );
    }

  }

}