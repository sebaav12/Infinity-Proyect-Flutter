import 'package:flutter/material.dart';

class CronometroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        // Boton para volver atras
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_location),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
}
