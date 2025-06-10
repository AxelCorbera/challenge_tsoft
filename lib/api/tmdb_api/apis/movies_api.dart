import 'dart:convert';
import 'dart:io';

import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:http/http.dart' as http;

class MoviesApi {
  /// Note: This method returns the HTTP [Response].
  Future<http.Response> _getMovieWithHttps() async {
    // ignore: prefer_const_declarations
    final path = r'/3/discover/movie';
    Uri uri = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: path,
    );
    Map<String, String>? headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ServiceManager().apiTmdb.accessToken}'
    };
    final response = await http.get(uri, headers: headers);

    return response;
  }

  /// createOperation
  Future<GetMovieResponse> getMovie() async {
    final response = await _getMovieWithHttps();
    print(response.body.toString());
    if (response.statusCode >= HttpStatus.badRequest) {
      throw Exception('Error');
    }
    if (response.statusCode != HttpStatus.noContent) {
      return GetMovieResponse.fromJson(jsonDecode(response.body));
    }
    return Future<GetMovieResponse>.value();
  }
}
