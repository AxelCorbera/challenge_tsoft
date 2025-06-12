import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/widgets/generic_future_builder.dart';
import 'package:challenge_tsoft/core/widgets/generic_shimmer.dart';
import 'package:challenge_tsoft/core/widgets/item_movie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../core/services/service_manager.dart';

/// [NewTrailers] muestra sub-panel de nuevos trailers
/// y un filtro de orden por fecha
///
/// Este widget está compuesto por un título, un filtro y un listado de
/// peliculas que se llaman desde un [FutureBuilder]
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

class NewTrailers extends StatelessWidget {
  const NewTrailers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.width * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('New trailers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text('Sort By',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff606265))),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Text('Today',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 12,
                          height: 12,
                          child: Image.asset('assets/icons/sort_btn.png'),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          GenericFutureBuilder(
              loadingWidget: Column(
                children: List.generate(
                    2,
                    (index) => Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            GenericShimmer(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                          ],
                        ))),
              ),
              future: ServiceManager().apiTmdb.moviesApi.getTrailers(),
              builder: (context, data) => Column(
                    children: List.generate(
                        data.results!.length > 1 ? 2 : 1,
                        (index) => Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ItemMovie(
                                movie: data.results![index],
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                showPopularity: true,
                              ),
                            )),
                  )),
        ],
      ),
    );
  }
}
