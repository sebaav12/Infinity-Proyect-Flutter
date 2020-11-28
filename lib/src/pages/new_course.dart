import "package:flutter/material.dart";

class NewCourse extends StatefulWidget {
  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String _name_course = "";
  String _description_value = "";

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
    );
  }

  Widget _newCourse() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Letras ${_name_course.length}"),
        hintText: "Nombre del curso",
        labelText: "Nombre",
        suffixIcon: Icon(Icons.accessibility),
      ),
      onChanged: (valor) {
        setState(() {
          _name_course = valor;
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
        counter: Text("Letras ${_name_course.length}"),
        hintText: "Ingrese una descripción",
        labelText: "Descripción",
        suffixIcon: Icon(Icons.library_books),
      ),
      onChanged: (valor) {
        setState(() {
          _description_value = valor;
        });
      },
    );
  }
}
