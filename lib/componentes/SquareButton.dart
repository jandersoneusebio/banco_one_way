import 'package:banco_one_way/telas/DepositoScreen.dart';
import 'package:banco_one_way/telas/ExtratoScreen.dart';
import 'package:banco_one_way/telas/SaqueScreen.dart';
import 'package:banco_one_way/telas/TransfScreen.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class SquareButton extends StatelessWidget {
  final Color color;
  final String title;
  final Icon icon;
  final String route;

  SquareButton({
    this.color,
    this.title,
    this.icon,
    this.route
  });

  var rota;

  _guia(String route){

    switch (route){
      case "/transf":
        this.rota = TransfScreen();
        break;
      case "/deposito":
        this.rota = DepositoScreen();
        break;
      case "/saque":
        this.rota = SaqueScreen();
        break;
      case "/extrato":
        this.rota = ExtratoScreen();
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    _guia(route);
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      transitionDuration: Duration(milliseconds: 500),
      closedBuilder: (context, action) => Container(
          width: _size.width > 400 ? 150 : 125, //150
          height: _size.width > 400 ? 150 : 125,
          color: color,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                icon,
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          )
      ),
      openBuilder: (context, action) =>
        rota
    );
  }
}
