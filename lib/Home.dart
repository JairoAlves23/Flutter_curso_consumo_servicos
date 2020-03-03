import 'package:consumo_servicos/icon_tile_medida.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unidade de Medida"),
        actions: <Widget>[
          Container(
            child: Icon(Icons.sort),
            margin: EdgeInsets.only(right: 15),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Und",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Dz",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Ml",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Dz",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "L",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Kg",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Kg",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Kg",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Kg2",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
            IconTileMedida(
              highLighted: false,
              iconData: Icons.dehaze,
              label: "Kg3",
            ),
            Divider(
              height: 15,
              color: Colors.purple[900],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
