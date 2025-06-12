import 'dart:math';

import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:challenge_tsoft/models/genre.dart';
import 'package:challenge_tsoft/core/utils/color_utils.dart';
import 'package:flutter/material.dart';

/// Provider que administra la sección actualmente seleccionada en la pantalla inicial.
///
/// Se inicializa mediante la funcion init para obtener el listado de generos del
/// servidor.
///
/// Se preseleccionan inicialmente 5 generos del listado
///
/// Expone el listado de generos que se obtuvo como asi tambien el listado de
/// generos que se seleccionan por defecto
///
/// Posee una funcion para seleccionar generos como asi tambien para eliminar
/// generos seleccionados
class GenresProvider extends ChangeNotifier {
  bool gettingData = true;
  List<Genre> _listGenres = [];
  List<Genre> _listSelected = [];

  Future init() async {
    final response = await ServiceManager().apiTmdb.genresApi.getGenres();
    if (response.genres != null) {
      _listGenres = response.genres!.toList();

      // Bucle para preseleccionar inicialmente 5 generos aleatorios asignandole
      // un color random de una lista predefinida en [ColorUtils]
      for (int i = 0; i < 5; i++) {
        int j = Random().nextInt(listGenresUnselected().length);
        selectNewGenre(listGenresUnselected()[j]);
      }
    }
    gettingData = false;
    notifyListeners();
  }

  List<Genre> get listGenresSelected => _listSelected;
  List<Genre> get allGenres => _listGenres;

  List<Genre> listGenresUnselected() {
    return _listGenres
        .where((g) => !_listSelected.any((s) => s.id == g.id))
        .toList();
  }

  void selectNewGenre(Genre genre) {
    genre.background = ColorUtils.getRandomColor();
    _listSelected.add(genre);
    notifyListeners();
  }

  void removeGenre(Genre genre) {
    genre.background = const Color(0xff262629);
    _listSelected.removeWhere((g) => g.id == genre.id);
    notifyListeners();
  }
}
