import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:challenge_tsoft/core/widgets/banner_movie.dart';
import 'package:challenge_tsoft/core/widgets/generic_future_builder.dart';
import 'package:challenge_tsoft/core/widgets/generic_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// [HomeBanner] es el widget que se muestra como banner en la pantalla
/// inicial.
///
/// Es un [FutureBuilder] que espera la respuesta del metodo 'GetMovies' que
/// corresponde a la API 'MoviesApi'. Esta respuesta es de tipo
/// [GetMovieResponse] y contiene un listado de peliculas (clase 'Movie')
/// en el elemento 'results'.
///
/// Se muestra el primer valor del listado.
///
/// Mientras espera los resultados muestra 2 [Shimmer] con las mismas
/// dimensiones que [BannerMovie]
///
/// En el caso de que el listado se encutre vacio, se muestra un mensaje
/// indicando que no hay peliculas disponibles
///
/// Si ocurre un error durante la carga, se muestra un mensaje indicando que
/// ha ocurrido un error.

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GenericFutureBuilder(
        loadingWidget: Row(children: [
          GenericShimmer(
            height: MediaQuery.of(context).size.height * 0.17,
          )
        ]),
        future: ServiceManager().apiTmdb.moviesApi.getMovies(),
        builder: (context, data) => Row(
              children: [
                Expanded(
                  child: BannerMovie(
                    movie: data.results!.first,
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                ),
              ],
            ));
  }
}
