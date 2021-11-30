import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultadoFinal = "Resultado";
  TextEditingController _controllerMarca = TextEditingController();
  TextEditingController _controllerMl = TextEditingController();
  TextEditingController _controllerValor = TextEditingController();

  void _calcular(){
    double _cervejaMl = double.tryParse(_controllerMl.text);
    double _cervejaValor = double.tryParse(_controllerValor.text);
    String _marca = "";
    _marca = _controllerMarca.text;


    if (_cervejaMl == null || _cervejaValor == null || _marca == null) {
      setState(() {
        _resultadoFinal = "Número inválido\ndigite números\nmaiores que 0\ne utilizando (.)";
      });
    } else {
      setState(() {
        double _resultado = (_cervejaValor*1000)/_cervejaMl;
        String resultadofrac = _resultado.toStringAsFixed(2);
        _resultadoFinal = "Marca:\n$_marca\n\nValor do litro:\nR\$ $resultadofrac";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cerveja \$ - Melhor compra !!!",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset("images/logo.png"),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 180,
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: ("Marca"),
                          ),
                          style: TextStyle(fontSize: 22),
                          controller: _controllerMarca,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: ("ML Total"),
                          ),
                          style: TextStyle(fontSize: 22),
                          controller: _controllerMl,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: ("Valor"),
                          ),
                          style: TextStyle(fontSize: 22),
                          controller: _controllerValor,
                        )
                      ],
                    ),
                  ),
                  Container(child: Column(children: [
                    Text(_resultadoFinal,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],),)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  color: Colors.amber,
                  textColor: Colors.black,
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: _calcular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
