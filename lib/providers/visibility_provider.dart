import 'package:flutter/material.dart';

/// Provider para gestionar la visibilidad del widget [HomeLeftPanel].
///
/// [isVisible] representa si el widget está visible o no.
/// Puedes cambiar su estado con [toggleVisibility] y [setVisibility]
class VisibilityProvider extends ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void setVisibility(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}
