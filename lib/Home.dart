import 'package:consumo_servicos/telas/Biblioteca.dart';
import 'package:consumo_servicos/telas/EmAlta.dart';
import 'package:consumo_servicos/telas/Inicio.dart';
import 'package:consumo_servicos/telas/Inscricao.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.5),
        title: Image.asset(
          "imagens/youtube.png",
          width: 120,
          height: 30,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("acao: videcam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("acao: search");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("acao: circle");
            },
          ),
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        currentIndex: _indiceAtual,
        type: BottomNavigationBarType.shifting,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              title: Text("Início"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              title: Text("Em Alta"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              title: Text("Incrições"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
