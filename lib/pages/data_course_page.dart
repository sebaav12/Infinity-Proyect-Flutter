import 'package:flutter/material.dart';
//import 'package:infinity/models/course_model.dart';
//import 'package:infinity/provider/course_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeline/models/course_model.dart';
import 'package:timeline/provider/course_list_provider.dart';

class DataCoursePage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    final CourseModel course = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _crearImagen(context),
          SizedBox(height: 70.0),
          _crearTexto(context, course),
          SizedBox(height: 70.0),
          _crearButton(context, course),
        ],
      ),
    ));
  }

  Widget _crearButton(BuildContext context, course) {
    return RaisedButton(
      child: Text("Eliminar Curso"),
      color: Colors.red,
      textColor: Colors.white,
      shape: StadiumBorder(),
      onPressed: () => _mostrarAlert(context, course),
    );
  }

  Widget _crearTexto(BuildContext context, course) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(course.description.toString(), style: estiloTitulo),
                  SizedBox(height: 20.0),
                  Text('Tiempo invertido: 12:04:00', style: estiloSubTitulo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTitulo(BuildContext context, course) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(course.name.toString(), style: estiloTitulo),
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'scroll'),
        child: Image(
          image: NetworkImage(
              'https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context, course) {
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
                  Provider.of<CourseListProvider>(context, listen: false)
                      .borrarCoursePorId(course.id);
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          );
        });
  }
}
