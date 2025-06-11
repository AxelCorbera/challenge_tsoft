import 'package:flutter/material.dart';

/// [Genre] es la clase que corresponde a los distintos
/// generos que se utilizan en [FavouriteGenres]
///
/// Se utiliza un Color Background para asignarle un color
/// al Widget [GenreChip]
///
class Genre {
  final String title;
  final Color background;
  Genre({required this.title, required this.background});
}
