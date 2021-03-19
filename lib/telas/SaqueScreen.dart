import 'package:banco_one_way/controllers/SaqueController.dart';
import 'package:flutter/material.dart';
import 'package:banco_one_way/constantes.dart';

class SaqueScreen extends StatefulWidget {
  @override
  _SaqueScreenState createState() => _SaqueScreenState();
}

class _SaqueScreenState extends State<SaqueScreen> {
  TextEditingController _valorController = TextEditingController();
  SaqueController saque = SaqueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saque"),
      ),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: TextField(
                  controller: _valorController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 48
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Valor à sacar",
                    labelStyle: TextStyle(
                        fontSize: 18
                    ),
                    contentPadding: EdgeInsets.only(bottom: 12, top: 32),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    child: Text(
                      "Sacar",
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
                      saque.sacar(double.parse(_valorController.text), context);
                    }
                ),
              )
            ],
          )
      ),
    );
  }
}
