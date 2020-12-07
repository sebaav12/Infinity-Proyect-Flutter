import 'package:flutter/material.dart';
import 'package:infinity/provider/db_provider.dart';

// change `flutter_database` to whatever your project name is

class HomePage extends StatelessWidget {
  final estiloTexto = new TextStyle(fontSize: 25);

  @override

  // Context le permite saber a la pagina en que apagina se encuentra
  // cual esta antes y despues, lo que le permite ir a una ruta X y volver

  Widget build(BuildContext context) {
    return Scaffold(

        // AppBAR
        appBar: AppBar(
          title: Text('Proyect Infinity'),
          centerTitle: true,
        ),

        // Body
        body: Center(
          child: _lista(context),
        ),

        // Boton para agregar cursos
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/new_course");
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  // Lista estatica - temporal
  Widget _lista(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Probabilidad y Estadistica'),

          // Accion de ir a cronometro
          onTap: () {
            Navigator.pushNamed(context, "/curso");
          },
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Termodinamica'),
          // Accion de ir a cronometro
          onTap: () {
            Navigator.pushNamed(context, "/curso");
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Bilogia de la Celula'),
          // Accion de ir a cronometro
          onTap: () {
            Navigator.pushNamed(context, "/curso");
          },
        ),
      ],
    );
  }

  // Button onPressed methods

}
