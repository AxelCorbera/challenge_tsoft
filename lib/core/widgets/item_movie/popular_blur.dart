import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/providers/genres_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [PopularBlur] es un widget que muestra una interfaz de visualización
/// de pelicula sin rep.
///
/// Este widget se utiliza comúnmente en tarjetas o listas donde se muestra
/// botones de reproducción/pausa y detalles como los generos y promedio de
/// puntuación
///
/// Parámetros:
/// - [movie] Objeto de tipo [Movie] que contiene los datos de la película.
/// - [height] Altura del contenedor total del widget.

class PopularBlur extends StatelessWidget {
  final Movie movie;
  final double height;
  const PopularBlur({super.key, required this.movie, required this.height});

  @override
  Widget build(BuildContext context) {
    final genresProvider = context.watch<GenresProvider>();
    return Container(
      height: height / 3,
      color: Colors.white.withOpacity(0.1),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: height / 7,
                    height: height / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc4c4c4),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (genresProvider.allGenres.isNotEmpty &&
                      movie.genreIds != null)
                    Row(
                      children: List.generate(
                          movie.genreIds!.length,
                          (index) => genresProvider.allGenres
                                  .any((g) => g.id == movie.genreIds![index])
                              ? Text(
                                  '${genresProvider.allGenres.firstWhere((g) => g.id == movie.genreIds![index]).name} ${movie.genreIds!.length - 1 == index ? '' : ' / '}',
                                  style: const TextStyle(
                                      color: Color(0xffADADAD),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                )
                              : Container()),
                    )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: 2,
                  height: height / 8,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white10, Colors.white60, Colors.white10],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 2.0),
                    child: Icon(Icons.star, size: 12),
                  ),
                  Text(
                    movie.voteAverage! % 2 > 0
                        ? movie.voteAverage!.toStringAsPrecision(2)
                        : movie.voteAverage!.toString(),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
