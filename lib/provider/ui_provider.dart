import 'package:flutter/material.dart';

// nos permite redibujar cambios en varias paginas asociadas a la vez sin usar stream.
class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  // Notifica cambios a todos los oyentes
  set selectedMenuOpt(int i) {
    this._selectedMenuOpt = i;
    notifyListeners();
  }
}
