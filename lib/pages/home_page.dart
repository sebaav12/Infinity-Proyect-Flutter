import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:infinity/provider/course_list_provider.dart';
import 'package:infinity/share_prefs/preferencias_usuario.dart';
import 'package:infinity/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

import 'dart:math';

// change `flutter_database` to whatever your project name is

class HomePage extends StatelessWidget {
  final estiloTexto = new TextStyle(fontSize: 25);
  final prefs = new PreferenciasUsuario();

  @override

  // Context le permite saber a la pagina en que apagina se encuentra
  // cual esta antes y despues, lo que le permite ir a una ruta X y volver

  Widget build(BuildContext context) {
    return Scaffold(

        // AppBAR
        appBar: AppBar(
          title: Text('Save Time',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  Provider.of<CourseListProvider>(context, listen: false)
                      .borrarTodos();
                })
          ],
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),

        // Body

        drawer: MenuWidget(),
        body: Stack(
          children: <Widget>[
            _fondoApp(),
            _lista(context),
          ],
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
        focusColor: Colors.red,
        onTap: () => {
          print(courses[i].id),
          Navigator.pushNamed(context, "/curso", arguments: courses[i]),
        },
      ),
    );
  }

  // Button onPressed methods

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(69, 118, 171, 1.0),
                Color.fromRGBO(18, 48, 82, 1.0)
              ])),
        ));

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: cajaRosa)],
    );
  }
}
