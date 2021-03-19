import 'package:banco_one_way/model/Contas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:banco_one_way/model/Extrato.dart';
import 'package:banco_one_way/constantes.dart';

class ExtratoController{

  Future<List<Extrato>> visualizarExtrato() async{
    http.Response response = await http.get(url + "extrato/emitir-extrato/$agAtual/$contaAtual");
    var dados = json.decode(response.body);

    List<Extrato> extratos = List();

    for(var resp in dados){
      Extrato e = Extrato(
        resp["cliente"]["nome"],
        resp["cliente"]["cpf"],
        resp["operacao"],
        resp["agencia"],
        resp["conta"],
        resp["valor"],
        resp["data"],
        resp["saldo"]
      );
      extratos.add(e);
    }

    return extratos;

  }

}
