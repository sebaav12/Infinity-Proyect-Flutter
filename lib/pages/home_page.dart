import 'package:flutter/material.dart';
import 'package:infinity/provider/db_provider.dart';

// change `flutter_database` to whatever your project name is

class HomePage extends StatelessWidget {
  final estiloTexto = new TextStyle(fontSize: 25);

  final dbHelper = DatabaseHelper.instance;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'insert',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _insert();
                },
              ),
              RaisedButton(
                child: Text(
                  'query',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _query();
                },
              ),
              RaisedButton(
                child: Text(
                  'update',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _update();
                },
              ),
              RaisedButton(
                child: Text(
                  'delete',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _delete();
                },
              ),
            ],
          ),
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

  void _insert() async {
    DatabaseHelper.instance.database;
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Bob',
      DatabaseHelper.columnAge: 23
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Mary',
      DatabaseHelper.columnAge: 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
