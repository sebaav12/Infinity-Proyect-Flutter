// Este codigo es util para definir iconos como variables que puedan
// ser reutilizadas con facilidad

// Es mejor usar el icon helper si . es un plugin propio de flutter

import "package:flutter/material.dart";

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
  "tune": Icons.tune,
  "list": Icons.list,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
