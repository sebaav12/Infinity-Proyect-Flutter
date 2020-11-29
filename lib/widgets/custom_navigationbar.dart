import 'package:flutter/material.dart';
import 'package:infinity/provider/ui_provider.dart';
import 'package:provider/provider.dart';

// La gracia de crear una carpeta widgets es para evitar usar clases privadas dentro de cada pagina, asi reducimos
// codigo y de paso creamos widgets reutilizables

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Curso'),
        BottomNavigationBarItem(
            icon: Icon(Icons.timelapse), label: 'Temporizador'),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time), label: 'Cronometro'),
      ],
    );
  }
}
