import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _result = "";
  var _ethanolTxtFieldCtrl = TextEditingController();
  var _gasolineTxtFieldCtrl = TextEditingController();

  void calculate() {
    var _priceEthanol = double.tryParse(_ethanolTxtFieldCtrl.text);
    var _priceGasoline = double.tryParse(_gasolineTxtFieldCtrl.text);

    setState(() {
      if(_priceEthanol / _priceGasoline >= 0.7)
        {
          _result = "Gasolina !!!";
        } else {
         _result = "Álcool !!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Comparador de combustível."),
            backgroundColor: Colors.deepPurple,
          ),
          body: Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("images/logo.png"),
                    Text(
                      "Saiba qual melhor opção para seu abastecimento.",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Preço do Álcool"),
                      keyboardType: TextInputType.number,
                      controller: _ethanolTxtFieldCtrl,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Preço da Gasolina"),
                      keyboardType: TextInputType.number,
                      controller: _gasolineTxtFieldCtrl,
                    ),
                    RaisedButton(
                      child: Text(
                        "Calcular !",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.deepPurpleAccent,
                      onPressed: calculate,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        _result,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}
