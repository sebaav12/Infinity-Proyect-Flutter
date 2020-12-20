import 'package:flutter/material.dart';
import 'package:infinity/share_prefs/preferencias_usuario.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool _colorSecundario;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _colorSecundario = prefs.colorSecundario;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('AppBar Color'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          )
        ],
      ),
    );
  }
}
