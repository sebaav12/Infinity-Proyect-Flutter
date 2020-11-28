import 'package:flutter/material.dart';

// Nosotros escribimos
// import 'src/app.dart';

import 'package:infinity/src/pages/home_page.dart';
import 'package:infinity/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print("Ruta llamada: ${settings.name}");
        return MaterialPageRoute(
            builder: (BuildContext context) => (HomePage()));
      },
      theme: ThemeData.dark(),
    );
  }
}

// Impementar cambio de pagina
