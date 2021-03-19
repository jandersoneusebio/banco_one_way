import 'package:banco_one_way/telas/configuracoes/GerenciarContas.dart';
import 'package:flutter/material.dart';
import 'package:banco_one_way/constantes.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Gerenciar Contas"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GerenciarContas()));
            },
          ),
          ListTile(
            title: Text("URL"),
            onTap: (){
              showDialog(
                context: context,
                builder: (context){
                  TextEditingController _controller = TextEditingController();

                  return AlertDialog(
                    title: Text("Nova URL do SSH"),
                    content: TextField(
                      controller: _controller,
                      autofocus: true,
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          url = _controller.text;
                        },
                        child: Text("Ok"),
                      )
                    ],
                  );
                }

              );
            }
          )
        ],
      )
    );
  }
}
