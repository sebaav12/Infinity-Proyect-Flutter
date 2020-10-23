import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estiloTexto = new TextStyle(fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // AppBAR
        appBar: AppBar(
          title: Text('Proyect Infinity'),
          centerTitle: true,
        ),

        // Body
        body: Center(
          child: _lista(),
        ),

        // Boton para agregar cursos
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('Hola Mundo!');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  // Lista estatica - temporal
  Widget _lista() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Probabilidad y Estadistica'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Termodinamica'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Bilogia de la Celula'),
        ),
      ],
    );
  }
}
