import 'package:flutter/material.dart';
//import 'package:infinity/models/course_model.dart';

//import 'package:infinity/provider/ui_provider.dart';
//import 'package:infinity/pages/cronometro_page.dart';
//import 'package:infinity/pages/data_course_page.dart';
//import 'package:infinity/pages/temporizador_page.dart';
//import 'package:infinity/widgets/custom_navigationbar.dart';
import 'package:provider/provider.dart';
import 'package:timeline/models/course_model.dart';
import 'package:timeline/pages/temporizador_page.dart';
import 'package:timeline/provider/ui_provider.dart';
import 'package:timeline/widgets/custom_navigationbar.dart';

import 'cronometro_page.dart';
import 'data_course_page.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CourseModel course = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: _CoursePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _CoursePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final CourseModel course = ModalRoute.of(context).settings.arguments;

    print(course.name);

    /*
    Codigo para insertar en la base de datos DBProvider

    final tempCourse =
        new CourseModel(name: "Termo", description: "Curso de plan comun");

    DBProvider.db.nuevoCourseRaw(tempCourse);
    */

    // Consultar datos a la bdd
    // DBProvider.db.getCourseById(2).then((course) => print(course.name));
    // DBProvider.db.getTodosLosCourses().then(print);

    // Eliminar todos los datos
    // DBProvider.db.deleteAllCourses().then(print);

    switch (currentIndex) {
      case 0:
        return DataCoursePage();

      case 1:
        return TemporizadorPage();

      case 2:
        return CronometroPage();

      default:
        return DataCoursePage();
    }
  }
}
