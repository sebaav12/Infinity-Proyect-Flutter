import 'package:flutter/material.dart';

class DataCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        RaisedButton(
          child: Text("Cronometro"),
          color: Colors.green,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => Navigator.pushNamed(context, "/cronometro"),
        ),
        RaisedButton(
          child: Text("Temporizador"),
          color: Colors.green,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => Navigator.pushNamed(context, "/temporizador"),
        ),
        RaisedButton(
          child: Text("Eliminar curso"),
          color: Colors.red,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ]),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            title: Text("Eliminar curso"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("¿Estas seguro que deseas eliminar este curso?"),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
