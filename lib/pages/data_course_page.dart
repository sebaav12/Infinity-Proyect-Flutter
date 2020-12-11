import 'package:flutter/material.dart';
import 'package:infinity/models/course_model.dart';
import 'package:infinity/provider/course_list_provider.dart';
import 'package:provider/provider.dart';

class DataCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CourseModel course = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: course.description.toString()),
          ),
          RaisedButton(
            child: Text("Eliminar Curso"),
            color: Colors.red,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlert(context, course),
          ),
        ],
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
