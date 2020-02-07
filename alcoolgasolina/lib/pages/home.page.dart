import 'package:alcoolgasolina/widgets/logo.widget.dart';
import 'package:alcoolgasolina/widgets/rodape.dart';
import 'package:alcoolgasolina/widgets/submit-form.dart';
import 'package:alcoolgasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.black;
var _gasCtrl = new MoneyMaskedTextController();
var __alcoolgCtrl = new MoneyMaskedTextController();
var _busy = false;
var _completed = false;
var _resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: Theme.of(context).primaryColor,
        child :ListView(
          children: <Widget>[
            Rodape(),
            Logo(),            
            _completed 
            ? Success(            
              result: _resultText,
              reset: reset,
            )
            : SubmitForm(
              gasCtrl: _gasCtrl,
              alcoolgCtrl: __alcoolgCtrl, 
              busy: _busy, 
              submitFunc: calculate,
            ),
            
          ],
        ),
      ),
    );
  }

  Future calculate(){


    double alc = double.parse( __alcoolgCtrl.text.replaceAll(new RegExp(r'[,.]'), ''),)/100;
    double gas = double.parse( _gasCtrl.text.replaceAll(new RegExp(r'[,.]'), ''), )/100;

    double res = alc / gas;


    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed( const Duration(seconds: 1),() {
      
        setState(() {
          if(alc == 0 || gas == 0){
              _resultText = "É necessario informar os valores de Gasolina e Alcool!";
          }else{

            if(res >= 0.7 ){
              res = res * 100;
            _resultText = "Compensa usar Gasolina.\n\nO preço do Álcool corresponde à "+res.toStringAsPrecision(2)+"% do preço da Gasolina" ;
            } else {
              res = res * 100;        
              _resultText = "Compensa usar Álcool.\n\nO preço do Álcool corresponde à "+res.toStringAsPrecision(2)+"% do preço da Gasolina" ;
            }
          }

            _busy = false;
            _completed = true;
          });
      }); 
  }

  reset(){
    setState(() {
      __alcoolgCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }

}