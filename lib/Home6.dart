import 'package:consumo_servicos/Post.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<Post> postagens = List();

    for (var post in dadosJson) {
      //print("post: " + post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  _post() async {
    Post post = Post(120, null, "titulo", "corpo");

    var corpo = json.encode(post.toJson());
    http.Response response = await http.post(
      _urlBase + "/posts",
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print("reposta ${response.statusCode}");
    print("reposta ${response.body}");
  }

  _put() async {
    var corpo = json.encode({
      "userId": 120,
      "id": null,
      "title": "titulo Alterado",
      "body": "corpo de postagem alterada"
    });
    http.Response response = await http.put(
      _urlBase + "/posts/2",
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print("reposta ${response.statusCode}");
    print("reposta ${response.body}");
  }

  _patch() async {
    var corpo = json.encode({
      "userId": 120,
      "body": "corpo de postagem alterada - enviar somente o que eu quero"
    });
    http.Response response = await http.put(
      _urlBase + "/posts/2",
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print("reposta ${response.statusCode}");
    print("reposta ${response.body}");
  }

  _delete() async {
    http.Response response = await http.delete(_urlBase + "/posts/2");
    print("reposta ${response.statusCode}");
    print("reposta ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consumo avançado"),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Salvar"),
                    onPressed: _post,
                  ),
                  RaisedButton(
                    child: Text("Atualizar"),
                    onPressed: _put,
                  ),
                  RaisedButton(
                    child: Text("Patch"),
                    onPressed: _patch,
                  ),
                  RaisedButton(
                    child: Text("Remover"),
                    onPressed: _delete,
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          print("Lista: Erro ao carregar");
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              List<Post> lista = snapshot.data;
                              Post post = lista[index];
                              return Dismissible(
                                direction: DismissDirection.startToEnd,
                                key: Key(DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString()),
                                background: Container(
                                  color: Colors.red,
                                  child: Align(
                                    alignment: Alignment(-0.9, 0.0),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onDismissed: null,
                                child: ListTile(
                                  title: Text(post.title),
                                  leading: Text(post.id.toString()),
                                ),
                              );
                            },
                          );
                        }
                        break;
                      default:
                    }
                    return Center(
                      child: Text('Texto'),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
