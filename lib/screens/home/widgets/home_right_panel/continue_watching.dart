import 'package:challenge_tsoft/core/widgets/generic_shimmer.dart';
import 'package:challenge_tsoft/core/widgets/item_movie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../core/services/service_manager.dart';
import '../../../../core/widgets/generic_future_builder.dart';

/// [ContinueWatching] es un sub-panel de [HomeRightPanel] que muestra las peliculas
/// que se han comenzado a ver y no se han finalizado.
///
/// Muestra el titulo de la clase, la cantidad de peliculas, posee un botón para
/// ver todas las pelicuas y muestra 2 [ItemMovies]
///
/// Actualmente el [FutureBuilder] espera la respuesta del metodo 'GetMovies'
/// que corresponde a la clase 'MoviesApi'. Esta respuesta es de tipo
/// [GetMovieResponse] y contiene un listado de peliculas (clase 'Movie')
/// en el elemento 'results'
///
/// Se muestran los 2 primeros elementos del listado
///
/// Mientras espera los resultados muestra 2 [Shimmer] con las mismas
/// dimensiones que [ItemMovie]
///
/// En el caso de que el listado se encutre vacio, se muestra un mensaje
/// indicando que no hay peliculas disponibles
///
/// Si ocurre un error durante la carga, se muestra un mensaje indicando que
/// ha ocurrido un error.

class ContinueWatching extends StatelessWidget {
  const ContinueWatching({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.01),
                    child: const Text(
                      'Continue Watching',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.01),
                    child: Container(
                      height: 14,
                      width: 1,
                      decoration: BoxDecoration(color: Color(0xff454545)),
                    ),
                  ),
                  const Text(
                    '4 Movies',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff606265)),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'All movies',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff606265)),
                      ),
                    ),
                    Image.asset('assets/icons/arrow_forward.png'),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GenericFutureBuilder(
                loadingWidget: Row(
                  children: [
                    GenericShimmer(
                        height: MediaQuery.of(context).size.height * 0.24),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GenericShimmer(
                        height: MediaQuery.of(context).size.height * 0.24),
                  ],
                ),
                future:
                    ServiceManager().apiTmdb.moviesApi.getMoviesNowPlaying(),
                builder: (context, data) => Row(
                      children: [
                        Expanded(
                          child: ItemMovie(
                              movie: data.results!.last,
                              height: MediaQuery.of(context).size.height * 0.24,
                              seenUntil: const Duration(minutes: 2, seconds: 0),
                              outstanding: true),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Expanded(
                          child: ItemMovie(
                              movie: data.results![data.results!.length - 2],
                              height: MediaQuery.of(context).size.height * 0.24,
                              seenUntil:
                                  const Duration(minutes: 32, seconds: 47),
                              showViewers: true),
                        ),
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
