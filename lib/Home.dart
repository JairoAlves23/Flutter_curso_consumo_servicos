import 'package:consumo_servicos/icon_tile_medida.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unidade de Medida"),
        actions: <Widget>[Icon(Icons.sort)],
      ),
      body: Column(
        children: <Widget>[
          IconTileMedida(
            highLighted: true,
            iconData: Icons.dehaze,
            label: "Und",
          ),
          Divider(height: 15,),
          IconTileMedida(
            highLighted: false,
            iconData: Icons.dehaze,
            label: "Dz",
          ),
          Divider(height: 15,),
          IconTileMedida(
            highLighted: false,
            iconData: Icons.dehaze,
            label: "ml",
          ),
          Divider(height: 15,),
          IconTileMedida(
            highLighted: false,
            iconData: Icons.dehaze,
            label: "Dz",
          ),
          Divider(height: 15,),
          IconTileMedida(
            highLighted: false,
            iconData: Icons.dehaze,
            label: "L",
          ),
          Divider(height: 15,),
          IconTileMedida(
            highLighted: false,
            iconData: Icons.dehaze,
            label: "Kg",
          ),
          Divider(height: 15,),
        ],
      ),
    );
  }
}
