import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:banco_one_way/constantes.dart';

class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  var _text = "texto";

  String _cpf = "70316699446";

  TextEditingController _controller = new TextEditingController();

  Future<String> _saldo() async{
    String url = "http://localhost:8080/treinamento/rest/conta/consultar-saldo/001/11112-2";
    http.Response response = await http.get(url);

    return response.body;
  }

  Future<Map> _resgataJson() async{
    String url = "http://localhost:8080/treinamento/rest/clientes/buscar-por-cpf/" + _cpf;
    http.Response response = await http.get(url);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banco One Way"),
        centerTitle: true,
        backgroundColor: marinho,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,

              ),
              FutureBuilder(
                future: _saldo(),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      _text = "Conexão não estabelecida";
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.waiting:
                      _text = ("Carregando...");
                      break;
                    case ConnectionState.done:
                      if(snapshot.hasError){
                        _text = "Houve um erro ao resgatar o valor";
                      } else{
                        //_text = snapshot.data["nome"].toString();
                        _text = snapshot.data.toString();
                      }
                      break;
                  }
                  return Text(
                      _text
                  );
                },
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    print(_cpf);
                    _cpf = _controller.text;
                  });

                },
                child: Text("Apertaaa"))
            ],
          )
        ),
      ),
    );
  }
}
