import 'package:banco_one_way/controllers/DepositoController.dart';
import 'package:flutter/material.dart';
import 'package:banco_one_way/constantes.dart';

class DepositoScreen extends StatefulWidget {
  @override
  _DepositoScreenState createState() => _DepositoScreenState();
}

class _DepositoScreenState extends State<DepositoScreen> {

  TextEditingController _valorController = TextEditingController();
  DepositoController deposito = DepositoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depósito"),
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
                  labelText: "Valor à depositar",
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
                  "Depositar",
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
                  deposito.depositar(double.parse(_valorController.text), context);
                }
              ),
            )
          ],
        )
      ),
    );
  }
}
