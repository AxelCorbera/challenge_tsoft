import 'package:challenge_tsoft/api/tmdb_api/apis/genres_api.dart';
import 'package:challenge_tsoft/api/tmdb_api/apis/movies_api.dart';

/// [ApiTmdb] es la clase que centraliza todas las APIs disponibles
/// para interactuar con el backend de The Movie Database (TMDb).
///
/// Incluye el acceso al token de autenticación y a las instancias
/// de cada API específica como [MoviesApi].
class ApiTmdb {
  /// Token de acceso utilizado para autenticar peticiones a la API de TMDb.
  /// Para este caso único se obtendrá de las variables de
  /// entorno (.env)
  String? _accessToken;

  /// Instancia de la API de películas.
  final MoviesApi moviesApi;

  /// Instancia de la API de generos.
  final GenresApi genresApi;

  /// Constructor privado para permitir uso de fábrica.
  ApiTmdb._(this.moviesApi, this.genresApi);

  /// Fábrica para crear una instancia preconfigurada de [ApiTmdb].
  factory ApiTmdb() {
    return ApiTmdb._(MoviesApi(), GenresApi());
  }

  /// Retorna el access token actual, o una String vacío si no fue configurado.
  ///
  /// Se recomienda validar que el token exista antes de usarlo!
  String get accessToken => _accessToken ?? '';

  /// Asigna el access token que se usará para autenticar las peticiones.
  void setToken(String token) {
    _accessToken = token;
  }
}
