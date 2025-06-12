import 'dart:convert';
import 'dart:io';

import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:http/http.dart' as http;

/// [MoviesApi] es una clase responsable de realizar las peticiones HTTP
/// a la API de TMDb relacionadas con películas. Incluye métodos para obtener
/// películas y construir URLs para imágenes (w500 y original).

class MoviesApi {
  /// Host principal de la API de TMDb
  final String _host = 'api.themoviedb.org';

  /// Host base para la carga de imágenes
  final String _hostImages = 'https://image.tmdb.org/t/p';

  /// Ruta para imágenes de tamaño medio (w500)
  final String _pathImageW500 = '/w500';

  /// Ruta para imágenes en tamaño original
  final String _pathImageOriginal = '/original';

  /// URL completa para imágenes de tamaño medio (w500)
  String get urlHostImage => _hostImages + _pathImageW500;

  /// URL completa para imágenes en tamaño original
  String get urlHostBanner => _hostImages + _pathImageOriginal;

  /// Método privado que construye y ejecuta la petición HTTP GET
  /// para obtener películas desde TMDb.
  ///
  /// Lanza una excepción si no se obtiene una respuesta válida.
  Future<http.Response> _getMoviesWithHttps() async {
    const path = r'/3/discover/movie';
    Uri uri = Uri(
      host: _host,
      path: path,
    );
    Map<String, String>? headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ServiceManager().apiTmdb.accessToken}'
    };
    final response = await http.get(uri, headers: headers);

    return response;
  }

  /// Obtiene un listado de películas desde la API de TMDb.
  ///
  /// Retorna una instancia de [GetMovieResponse] si la respuesta es exitosa.
  /// Lanza una excepción si el código de estado es mayor o igual a 400.
  Future<GetMovieResponse> getMovies() async {
    final response = await _getMoviesWithHttps();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw Exception('Ha ocurrido un error');
    }
    if (response.statusCode != HttpStatus.noContent) {
      return GetMovieResponse.fromJson(jsonDecode(response.body));
    }
    // Retorna una instancia vacía en caso de no tener contenido
    return Future<GetMovieResponse>.value();
  }

  /// Método privado que construye y ejecuta la petición HTTP GET
  /// para obtener películas que se esten reproduciendo en este momento desde
  /// TMDb.
  ///
  /// Lanza una excepción si no se obtiene una respuesta válida.
  Future<http.Response> _getMoviesNowPlayingWithHttps() async {
    const path = r'/3/movie/now_playing';
    Uri uri = Uri(
      host: _host,
      path: path,
    );
    Map<String, String>? headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ServiceManager().apiTmdb.accessToken}'
    };
    final response = await http.get(uri, headers: headers);

    return response;
  }

  /// Obtiene un listado de películas que se esten reproduciendo en este momento
  /// desde la API de TMDb.
  ///
  /// Retorna una instancia de [GetMovieResponse] si la respuesta es exitosa.
  /// Lanza una excepción si el código de estado es mayor o igual a 400.
  Future<GetMovieResponse> getMoviesNowPlaying() async {
    final response = await _getMoviesNowPlayingWithHttps();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw Exception('Ha ocurrido un error');
    }
    if (response.statusCode != HttpStatus.noContent) {
      return GetMovieResponse.fromJson(jsonDecode(response.body));
    }
    // Retorna una instancia vacía en caso de no tener contenido
    return Future<GetMovieResponse>.value();
  }

  /// Método privado que construye y ejecuta la petición HTTP GET
  /// para obtener películas populares desde TMDb.
  ///
  /// Lanza una excepción si no se obtiene una respuesta válida.
  Future<http.Response> _getMoviesPopularWithHttps() async {
    const path = r'/3/movie/popular';
    Uri uri = Uri(
      host: _host,
      path: path,
    );
    Map<String, String>? headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ServiceManager().apiTmdb.accessToken}'
    };
    final response = await http.get(uri, headers: headers);

    return response;
  }

  /// Obtiene un listado de películas populares desde la API de TMDb.
  ///
  /// Retorna una instancia de [GetMovieResponse] si la respuesta es exitosa.
  /// Lanza una excepción si el código de estado es mayor o igual a 400.
  Future<GetMovieResponse> getMoviesPopular() async {
    final response = await _getMoviesPopularWithHttps();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw Exception('Ha ocurrido un error');
    }
    if (response.statusCode != HttpStatus.noContent) {
      return GetMovieResponse.fromJson(jsonDecode(response.body));
    }
    // Retorna una instancia vacía en caso de no tener contenido
    return Future<GetMovieResponse>.value();
  }

  /// Método privado que construye y ejecuta la petición HTTP GET
  /// para obtener Trailers desde TMDb.
  ///
  /// Lanza una excepción si no se obtiene una respuesta válida.
  Future<http.Response> _getTrailersWithHttps() async {
    const path = r'/3/movie/upcoming';
    Uri uri = Uri(
      host: _host,
      path: path,
    );
    Map<String, String>? headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ServiceManager().apiTmdb.accessToken}'
    };
    final response = await http.get(uri, headers: headers);

    return response;
  }

  /// Obtiene un listado de Trailers desde la API de TMDb.
  ///
  /// Retorna una instancia de [GetMovieResponse] si la respuesta es exitosa.
  /// Lanza una excepción si el código de estado es mayor o igual a 400.
  Future<GetMovieResponse> getTrailers() async {
    final response = await _getTrailersWithHttps();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw Exception('Ha ocurrido un error');
    }
    if (response.statusCode != HttpStatus.noContent) {
      return GetMovieResponse.fromJson(jsonDecode(response.body));
    }
    // Retorna una instancia vacía en caso de no tener contenido
    return Future<GetMovieResponse>.value();
  }
}
