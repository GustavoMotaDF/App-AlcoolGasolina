import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return 
      Container(
            margin: EdgeInsets.all(10),
            
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
              15,
              ),
            ),
            child: FlatButton(
              child: Text(
               "Produced by @gustavohenrique_m_s",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15,
                  fontFamily: "Comfortaa",
                ),
              ), onPressed: () {},
             
            ),
             
          );
  }
}