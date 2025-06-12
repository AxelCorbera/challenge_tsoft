import 'package:challenge_tsoft/api/api_tmdb.dart';
import 'package:challenge_tsoft/providers/genres_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// [ServiceManager] actúa como una clase singleton responsable
/// de inicializar y exponer los servicios globales de la aplicación.
///
/// Actualmente administra:
/// - [ApiTmdb]: Cliente para acceder a los endpoints de The Movie Database (TMDb).
///
/// Esta clase debe ser inicializada mediante [init] antes de usarse.
class ServiceManager {
  /// Instancia única de [ServiceManager] (singleton).
  static final ServiceManager _instance = ServiceManager._internal();

  /// Constructor de fábrica que retorna la instancia única.
  factory ServiceManager() => _instance;

  /// Constructor privado.
  ServiceManager._internal();

  /// Cliente de la API de TMDb.
  late final ApiTmdb apiTmdb;

  /// Inicializa todos los servicios necesarios para la aplicación.
  ///
  /// Carga el token de autenticación para TMDb desde variables de entorno
  /// definidas en '.env', y lo asigna al cliente [ApiTmdb].
  Future<void> init() async {
    apiTmdb = ApiTmdb();
    apiTmdb.setToken(dotenv.env['TMDB_ACCESS_TOKEN']!);
  }
}
