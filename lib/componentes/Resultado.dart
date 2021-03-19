import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final String msg;

  Resultado({this.msg});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(msg),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            child: Text("Ok"),
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
