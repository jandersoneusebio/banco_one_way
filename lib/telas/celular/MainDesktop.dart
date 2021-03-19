import 'package:banco_one_way/componentes/InfoConta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:banco_one_way/componentes/SquareButton.dart';
import 'package:banco_one_way/constantes.dart';

class MainDesktop extends StatefulWidget {
  @override
  _MainDesktopState createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            InfoConta(
                agencia: agAtual,
                conta: contaAtual
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 75, left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SquareButton(
                          title: "Transferência",
                          color: Colors.amber,
                          icon: Icon(Icons.compare_arrows_rounded, color: Colors.white, size: 50,),
                          route: "/transf",
                        ),
                        SquareButton(
                          title: "Depósito",
                          color: Colors.green,
                          icon: Icon(Icons.arrow_circle_down_rounded, color: Colors.white, size: 50,),
                          route: "/deposito",
                        ),
                        SquareButton(
                          title: "Saque",
                          color: Colors.blue,
                          icon: Icon(Icons.arrow_circle_up_rounded, color: Colors.white, size: 50,),
                          route: "/saque",
                        ),
                        SquareButton(
                          title: "Extrato",
                          color: Colors.deepOrangeAccent,
                          icon: Icon(Icons.data_usage_rounded, color: Colors.white, size: 50),
                          route: "/extrato",
                        ),

                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
