import 'package:flutter/material.dart';
import 'package:banco_one_way/constantes.dart';
import 'package:banco_one_way/componentes/Resultado.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TransfController{
  transferir(String agOrigem, String ctOrigem, String agDestino, String ctDestino, double valor, BuildContext context) async{
    var corpo = json.encode({
      "agenciaDestino" : agDestino,
      "agenciaOrigem" : agOrigem,
      "numeroContaDestino" : ctDestino,
      "numeroContaOrigem" : ctOrigem,
      "valor" : valor
    });

    http.Response response = await http.post(
        url + "conta/transferencia",
        headers: {
          "Content-type" : "application/json"
        },
        body: corpo
    );

    print(response.statusCode.toString());
    print(response.body);

    if(response.statusCode == 200){
      showDialog(
          context: context,
          builder: (context){
            return Resultado(
              msg: "Transferência realizada com sucesso",
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