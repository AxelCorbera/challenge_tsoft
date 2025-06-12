import 'dart:convert';
import 'dart:io';
import 'package:challenge_tsoft/api/tmdb_api/models/get_genres_response.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:http/http.dart' as http;

/// [GenresApi] es una clase responsable de realizar las peticiones HTTP
/// a la API de TMDb relacionadas con los generos. Incluye métodos para obtener
/// listado de generos.

class GenresApi {
  /// Host principal de la API de TMDb
  final String _host = 'api.themoviedb.org';

  /// Método privado que construye y ejecuta la petición HTTP GET
  /// para obtener películas desde TMDb.
  ///
  /// Lanza una excepción si no se obtiene una respuesta válida.
  Future<http.Response> _getGenresWithHttps() async {
    const path = r'/3/genre/movie/list';
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

  /// Obtiene un listado de generos desde la API de TMDb.
  ///
  /// Retorna una instancia de [GetGenresresponse] si la respuesta es exitosa.
  /// Lanza una excepción si el código de estado es mayor o igual a 400.
  Future<GetGenresresponse> getGenres() async {
    final response = await _getGenresWithHttps();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw Exception('Ha ocurrido un error');
    }
    if (response.statusCode != HttpStatus.noContent) {
      return GetGenresresponse.fromJson(jsonDecode(response.body));
    }
    // Retorna una instancia vacía en caso de no tener contenido
    return Future<GetGenresresponse>.value();
  }
}
