import 'package:flutter/material.dart';

//Exemplo de Lista com Alert

class Home3 extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {

  List _itens = [];

  void _carregarItens() {
  _itens = [];  
  for (int i = 0; i < 10; i++) {
    Map<String,dynamic> item = Map();
    item["titulo"] = "Valor do Titulo ${i}";
    item["descricao"] = "Valor da descricao ${i}";
    _itens.add(item);
  }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder:(context,indice) {
            return ListTile(
              onTap: () {
                //print ("Clique com onTap${indice}");
                showDialog(
                context: context,
                builder: (context) {
                    return AlertDialog(
                      title: Text(_itens[indice]["titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange
                      ),
                      content: Text(_itens[indice]["descricao"]),
                      contentPadding: EdgeInsets.all(80),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Sim"),
                          onPressed: () {
                            print("Selecionado sim");
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text("Não"),
                          onPressed: () {
                            print("Selecionado Não");
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                 }   
                ); 
              },
              /* onLongPress: () {
                print ("Clique com onlongPress");
              }, */
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),
            );
          }
        ),
      ) ,
    );
  }
}