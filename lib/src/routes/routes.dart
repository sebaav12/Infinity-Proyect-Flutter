import 'package:flutter/cupertino.dart';
import 'package:infinity/src/pages/cronometro_page.dart';
import 'package:infinity/src/pages/curso_page.dart';
import 'package:infinity/src/pages/home_page.dart';
import 'package:infinity/src/pages/new_course.dart';
import 'package:infinity/src/pages/temporizador_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => HomePage(),
    "/cronometro": (BuildContext context) => CronometroPage(),
    "/temporizador": (BuildContext context) => TemporizadorPage(),
    "/curso": (BuildContext context) => CursoPage(),
    "/new_course": (BuildContext context) => NewCourse(),
  };
}
