import 'package:consumo_servicos/model/Video.dart';
import 'package:consumo_servicos/telas/Api.dart';
import 'package:flutter/material.dart';


class Inicio extends StatefulWidget {
  
  String pesquisa;
  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  
  _listarVideo(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideo(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;

          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];
                    return GestureDetector(
                      child: Column(
                      children: <Widget>[
                        Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.imagem)),
                            )),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        )
                      ],
                    ),
                    onTap: () {
                      /* import 'package:flutter_youtube/flutter_youtube.dart';
		                  FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API,
                        videoId: video.id,
                        autoPlay: true
                      ); */
                    },
                    );
                  },
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ));
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
            break;

          default:
        }
      },
    );
  }
}
