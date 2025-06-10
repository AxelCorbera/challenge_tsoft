import 'package:challenge_tsoft/api/tmdb_api/apis/movies_api.dart';

class ApiTmdb {
  String? _accessToken;
  final MoviesApi moviesApi;

  ApiTmdb._(this.moviesApi);

  factory ApiTmdb() {
    return ApiTmdb._(MoviesApi());
  }

  String get accessToken => _accessToken ?? '';

  setToken(t) {
    _accessToken = t;
  }
}
