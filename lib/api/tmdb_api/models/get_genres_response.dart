import 'dart:convert';

import '../../../models/genre.dart';

/// Decodifica un [String] en una instancia de [GetGenresresponse].
GetGenresresponse getGenresresponseFromJson(String str) =>
    GetGenresresponse.fromJson(json.decode(str));

/// Codifica una instancia de [GetGenresresponse] en un [String] JSON.
String getGenresresponseToJson(GetGenresresponse data) =>
    json.encode(data.toJson());

/// Modelo que representa la respuesta de la API `GenresApi/getGenres` de TMDb.
///
/// Contiene información sobre la paginación y una lista de objetos [Genre].
class GetGenresresponse {
  List<Genre>? genres;

  GetGenresresponse({
    this.genres,
  });

  factory GetGenresresponse.fromJson(Map<String, dynamic> json) =>
      GetGenresresponse(
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}
