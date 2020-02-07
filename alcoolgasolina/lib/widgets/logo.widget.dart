import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          SizedBox(
            height:10,
          ),
          Image.asset(
            "assets/images/icone.png",
          height: 100,
          ),
          SizedBox(
            height:10,
          ),
          Text(
            "EtaNóis ou Gasolixo?",
            style: TextStyle(
              color:Colors.white,
              fontSize: 25,
              fontFamily: "Comfortaa",
            ),
            textAlign: TextAlign.center,
          ),
           SizedBox(
            height:20,
          ),
        ],
    );
  }
}