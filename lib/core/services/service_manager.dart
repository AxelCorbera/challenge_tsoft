import 'package:challenge_tsoft/api/api_tmdb.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager._internal();
  factory ServiceManager() => _instance;

  ServiceManager._internal();

  late final ApiTmdb apiTmdb;

  Future<void> init() async {
    apiTmdb = ApiTmdb();
    apiTmdb.setToken(dotenv.env['ACCESS_TOKEN_TMDB']);
  }
}
