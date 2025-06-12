import 'package:flutter/material.dart';

/// [Genre] es la clase que corresponde a los distintos
/// generos que se utilizan en [FavouriteGenres]
///
/// Se utiliza un Color Background para asignarle un color
/// al Widget [GenreChip]
///
class Genre {
  final int id;
  final String name;
  Color? background;
  Genre(
      {required this.id,
      required this.name,
      this.background = const Color(0xff262629)});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
