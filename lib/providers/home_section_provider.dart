import 'package:flutter/material.dart';
import 'package:challenge_tsoft/core/const/const.dart';

/// Provider que administra la sección actualmente seleccionada en la pantalla inicial.
///
/// Expone el valor actual mediante [currentSection] y permite cambiarlo
/// con [changeSection]. Notifica a los widgets que dependan del estado
/// cuando se produce un cambio.
class HomeSectionProvider extends ChangeNotifier {
  HomeSection _currentSection = HomeSection.movies;

  HomeSection get currentSection => _currentSection;

  /// Cambia la sección seleccionada y notifica a los oyentes.
  void changeSection(HomeSection section) {
    if (_currentSection != section) {
      _currentSection = section;
      notifyListeners();
    }
  }
}
