import 'dart:convert';

/// Decodifica un [String] en una instancia de [GetMovieResponse].
GetMovieResponse getMovieResponseFromJson(String str) =>
    GetMovieResponse.fromJson(json.decode(str));

/// Codifica una instancia de [GetMovieResponse] en un [String] JSON.
String getMovieResponseToJson(GetMovieResponse data) =>
    json.encode(data.toJson());

/// Modelo que representa la respuesta de la API `MoviesApi/getMovies` de TMDb.
///
/// Contiene información sobre la paginación y una lista de objetos [Movie].
class GetMovieResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  GetMovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  /// Crea una instancia de [GetMovieResponse] a partir de un [Map] JSON.
  factory GetMovieResponse.fromJson(Map<String, dynamic> json) =>
      GetMovieResponse(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Movie>.from(json["results"]!.map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  /// Convierte la instancia actual a un [Map] JSON.
  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

/// Modelo que representa una película individual obtenida desde la API de TMDb.
class Movie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  /// Crea una instancia de [Movie] a partir de un [Map] JSON.
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  /// Convierte esta instancia de [Movie] a un [Map] JSON.
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
