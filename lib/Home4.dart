import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Exemplo de requisição API

class Home4 extends StatefulWidget {
  @override
  _Home4State createState() => _Home4State();
}

class _Home4State extends State<Home4> {

  String _resultado = "Resultado";
  final _buscarCep = TextEditingController();

  _recuperCep() async {
  
  String cep = _buscarCep.text;
  String url = "https://viacep.com.br/ws/${cep}/json/";
  http.Response response;
  response = await http.get(url);
  Map<String,dynamic> retorno = json.decode(response.body);
  String logradouro = retorno["logradouro"]; 
  String complemento = retorno["complemento"]; 
  String bairro = retorno["bairro"]; 
  String localidade = retorno["localidade"]; 
  
  setState(() {
    _resultado = "${logradouro} ${complemento} ${bairro} ${localidade}";
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _buscarCep,
              decoration: InputDecoration(
                labelText: "Novo Cep",
              ),
            ),
            RaisedButton(
              child: Text("Clique Aqui"),
              onPressed: _recuperCep,
            ),
            Text(
              _resultado
            )
          ],
        ),
      ) ,
    );
  }
}