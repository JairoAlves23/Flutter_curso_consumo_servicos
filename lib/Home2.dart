import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//API para pegar preço do bitcoin

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  Future<Map> _recuperPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {    
    return FutureBuilder<Map> (
     future: _recuperPreco(),
     builder: (context,snapshot) {
       String resultado;
       switch (snapshot.connectionState) {
         case ConnectionState.none:
         case ConnectionState.waiting:
           print("conexao waiting");
           resultado = "Carregando...";
           break;
         case ConnectionState.active:
         case ConnectionState.done:
           print("conexao done");
           if (snapshot.hasError) {
             resultado = "Erro ao carregar os dados...";
           } else {
             double valor = snapshot.data["BRL"]["buy"];
             resultado = "Preço do bitcoin: ${valor.toString()}";
           }
           break;
         default:
       }
       return Center(
         child: Text('$resultado'),
       );
     },
    );
  }
}