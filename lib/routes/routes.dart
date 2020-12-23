import 'package:flutter/cupertino.dart';
//import 'package:infinity/pages/cronometro_page.dart';
//import 'package:infinity/pages/course_page.dart';
//import 'package:infinity/pages/home_page.dart';
//import 'package:infinity/pages/new_course.dart';
//import 'package:infinity/pages/temporizador_page.dart';
import 'package:timeline/pages/course_page.dart';
import 'package:timeline/pages/cronometro_page.dart';
import 'package:timeline/pages/home_page.dart';
import 'package:timeline/pages/new_course.dart';
import 'package:timeline/pages/temporizador_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => HomePage(),
    "/cronometro": (BuildContext context) => CronometroPage(),
    "/temporizador": (BuildContext context) => TemporizadorPage(),
    "/curso": (BuildContext context) => CoursePage(),
    "/new_course": (BuildContext context) => NewCourse(),
  };
}
