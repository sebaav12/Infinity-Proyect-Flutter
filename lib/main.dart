import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity/pages/home_page.dart';
import 'package:infinity/provider/course_list_provider.dart';

import 'package:infinity/provider/ui_provider.dart';
import 'package:infinity/routes/routes.dart';
import 'package:infinity/share_prefs/preferencias_usuario.dart';

import 'package:provider/provider.dart';

import 'share_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new CourseListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          print("Ruta llamada: ${settings.name}");
          return MaterialPageRoute(
              builder: (BuildContext context) => (HomePage()));
        },
        //theme: (prefs.colorSecundario) ? ThemeData.dark() : null,
      ),
    );
  }
}
