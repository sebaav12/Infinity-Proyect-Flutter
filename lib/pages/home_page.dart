import 'package:flutter/material.dart';
import 'package:infinity/provider/course_list_provider.dart';
import 'package:provider/provider.dart';

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
          actions: [
            IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  Provider.of<CourseListProvider>(context, listen: false)
                      .borrarTodos();
                })
          ],
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
    // Usar el ScanListProvider redibujando la escena
    final courseListProvider = Provider.of<CourseListProvider>(context);

    // Carga de cursos
    courseListProvider.cargarCourses();

    final courses = courseListProvider.courses;

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title: Text(courses[i].name),
        subtitle: Text(courses[i].description),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () => {
          print(courses[i].id),
          Navigator.pushNamed(context, "/curso", arguments: courses[i]),
        },
      ),
    );
    /* return ListView(
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
    */
  }

  // Button onPressed methods

}
