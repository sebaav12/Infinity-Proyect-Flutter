import "package:flutter/material.dart";
import 'package:infinity/provider/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:infinity/provider/course_list_provider.dart';

class NewCourse extends StatefulWidget {
  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String name_course = "";
  String description_value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nuevo curso"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _newCourse(),
            Divider(),
            _description(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Insert name, decription in Table Courses

            //final tempCourse = new CourseModel(
            //    name: '$name_course', description: '$description_value');
            //DBProvider.db.nuevoCourseRaw(tempCourse);

            final courseListProvider =
                Provider.of<CourseListProvider>(context, listen: false);

            courseListProvider.nuevoCourse(name_course, description_value);

            // Redrirect to Home Page
            //Navigator.pushNamed(context, "/");
            Navigator.pop(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Widget _newCourse() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Letras ${name_course.length}"),
        hintText: "Nombre del curso",
        labelText: "Nombre",
        suffixIcon: Icon(Icons.accessibility),
      ),
      onChanged: (valor) {
        setState(() {
          name_course = valor;
        });
      },
    );
  }

  Widget _description() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Letras ${name_course.length}"),
        hintText: "Ingrese una descripción",
        labelText: "Descripción",
        suffixIcon: Icon(Icons.library_books),
      ),
      onChanged: (valor) {
        setState(() {
          description_value = valor;
        });
      },
    );
  }
}
