import 'package:flutter/material.dart';

class IconTileMedida extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highLighted;

  const IconTileMedida(
      {Key key, this.label, this.iconData, this.onTap, this.highLighted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: Theme.of(context).textTheme.title.fontWeight,
          fontSize: Theme.of(context).textTheme.title.fontSize,
          letterSpacing: 0.8,
          color: highLighted ? Theme.of(context).primaryColor : Colors.black,
        ),
      ),
      leading: Icon(
        iconData,
        color: highLighted ? Theme.of(context).primaryColor : Colors.black,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
    ); 

  }
}