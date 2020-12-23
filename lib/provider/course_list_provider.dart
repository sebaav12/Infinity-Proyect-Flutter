import 'package:flutter/material.dart';
//import 'package:infinity/models/course_model.dart';
import 'package:timeline/models/course_model.dart';

import 'db_provider.dart';

class CourseListProvider extends ChangeNotifier {
  List<CourseModel> courses = [];

  Future<CourseModel> nuevoCourse(String name, description) async {
    final nuevoCourse = new CourseModel(name: name, description: description);
    final id = await DBProvider.db.nuevoCourse(nuevoCourse);
    // Asignar el ID de la base de datos al modelo
    nuevoCourse.id = id;
    this.courses.add(nuevoCourse);
    notifyListeners();

    return nuevoCourse;
  }

  cargarCourses() async {
    final courses = await DBProvider.db.getTodosLosCourses();
    this.courses = [...courses];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllCourses();
    this.courses = [];
    notifyListeners();
  }

  borrarCoursePorId(int id) async {
    await DBProvider.db.deleteCourse(id);
  }
}
